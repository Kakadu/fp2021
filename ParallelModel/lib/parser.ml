open Angstrom

(* open Ast *)
type expr =
  | INT of int
  | VAR_NAME of string
  | REGISTER of string
  | PLUS of expr * expr
  | SUB of expr * expr
  | MUL of expr * expr
  | DIV of expr * expr

type stmt =
  | ASSIGN of expr * expr
  | IF of expr * stmt list
  | IF_ELSE of expr * stmt list * stmt list
  (* | BLOCK of stmt list *)
  | SMP_RMB
  | SMP_WMB
  | SMP_MB
  | NO_OP

type thread = THREAD of (int * stmt list)

type prog = PROG of thread list

let rec put_parens s = "(" ^ s ^ ")"

let expr_to_string expr =
  let rec expr_to_str = function
    | INT i -> string_of_int i
    | VAR_NAME v -> v
    | REGISTER r -> r
    | PLUS (l, r) -> put_parens (expr_to_str l ^ " + " ^ expr_to_str r)
    | SUB (l, r) -> put_parens (expr_to_str l ^ " - " ^ expr_to_str r)
    | MUL (l, r) -> put_parens (expr_to_str l ^ " * " ^ expr_to_str r)
    | DIV (l, r) -> put_parens (expr_to_str l ^ " / " ^ expr_to_str r)
  in
  expr_to_str expr ^ "\n"

let rec split list f = match list with h :: tl -> f h :: split tl f | _ -> []

let splitter s = Str.split (Str.regexp "|||") (" " ^ s ^ " ")

let split_on_parts s =
  let lines = String.split_on_char '\n' (String.trim s) in
  split lines splitter

let get_threads_number s = split_on_parts s |> List.hd |> List.length

let trim_list list = List.map String.trim list

let empty_str_to_no_op list =
  List.map (fun s -> match s with "" -> "no_op" | _ -> s) list

let concat_list = String.concat " ||| "

let concat_lines = String.concat "\n"

let preprocess input =
  split_on_parts input |> List.map trim_list
  |> List.map empty_str_to_no_op
  |> List.map concat_list |> String.concat "\n"

let reserved = [ "smp_rmb"; "smp_wmb"; "smp_mb"; "if" ]

let is_whitespace = function ' ' | '\n' | '\r' | '\t' -> true | _ -> false

let whitespace = take_while is_whitespace

let is_end_of_line = function '\n' | '\r' -> true | _ -> false

let is_not_end_of_line c = not @@ is_end_of_line @@ c

let token s = whitespace *> string s

let is_digit = function '0' .. '9' -> true | _ -> false

let parse p s = parse_string ~consume:All p (preprocess s)

let parse_unproc p s = parse_string ~consume:All p s

let jump_to_new_line = take_till is_end_of_line *> take_while is_end_of_line

let cross_thread_delim =
  take_till (fun c -> match c with '|' | '\n' | '\r' -> true | _ -> false)
  *> token "|||"

let cross_n_delims n = count n cross_thread_delim

let go_to_next_line_for_thread n =
  jump_to_new_line *> count n cross_thread_delim

let number =
  let digits = whitespace *> take_while1 is_digit in
  digits >>= fun s -> return @@ INT (int_of_string s)

let addition =
  number >>= fun e1 ->
  token "+" *> number >>= fun e2 -> return @@ PLUS (e1, e2)

let add = token "+" *> return (fun e1 e2 -> PLUS (e1, e2))

let sub = token "-" *> return (fun e1 e2 -> SUB (e1, e2))

let mul = token "*" *> return (fun e1 e2 -> MUL (e1, e2))

let div = token "/" *> return (fun e1 e2 -> DIV (e1, e2))

let is_big_letter = function 'A' .. 'Z' -> true | _ -> false

let registers = [ "EAX"; "EBX" ]

let is_register name = List.mem name registers

let reg =
  whitespace *> take_while1 is_big_letter >>= fun s ->
  match is_register s with
  | true -> return @@ REGISTER s
  | false -> fail "No register with such name"

let is_allowed_var_name name = not @@ List.mem name (reserved @ registers)

let var_name =
  let is_allowed_fst_char = function
    | 'a' .. 'z' | 'A' .. 'Z' | '_' -> true
    | _ -> false
  in
  let is_allowed_var_name_char = function
    | 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' -> true
    | _ -> false
  in
  whitespace *> peek_char >>= function
  | Some c when is_allowed_fst_char c ->
      take_while is_allowed_var_name_char >>= fun var_name ->
      if is_allowed_var_name var_name then return @@ VAR_NAME var_name
      else fail "Variable's name is key word or register name"
  | _ -> fail "invalid variable name"

(* let left_of p1 p = p <* whitespace <* p1

   let right_of p1 p = p1 *> whitespace *> p

   let between p1 p2 p = left_of p2 (right_of p1 p)

   let parens p = between (token "(") (token ")") p *)

let parens p = token "(" *> p <* token ")"

let chainl1 e op =
  let rec go acc = lift2 (fun f x -> f acc x) op e >>= go <|> return acc in
  e >>= fun init -> go init

let chainl1 x op =
  let rec loop a = op >>= (fun f -> x >>= fun b -> loop (f a b)) <|> return a in
  x >>= loop

let factop = mul <|> div <?> "'*' or '/' expected" <* whitespace

let termop = whitespace *> add <|> sub <?> "'+' or '-' expected" <* whitespace

let expr =
  fix (fun expr ->
      let other = choice [ number; reg; var_name ] in
      let power =
        let predict =
          whitespace *> peek_char_fail >>= function
          | '(' -> parens expr
          | _ -> other
        in
        choice [ predict; other ]
      in
      let term1 = chainl1 power factop in
      let arexpr = chainl1 term1 termop in
      let newexpr = fix (fun newexpr -> arexpr <|> parens newexpr) in
      newexpr)

let mem_barrier thread_num =
  let smp_rmb = token "smp_rmb" *> return SMP_RMB in
  let smp_wmb = token "smp_wmb" *> return SMP_WMB in
  let smp_mb = token "smp_mb" *> return SMP_MB in
  cross_n_delims thread_num *> (smp_rmb <|> smp_wmb <|> smp_mb)
  <* jump_to_new_line

let assignment thread_num =
  cross_n_delims thread_num *> (reg <|> var_name) >>= fun named_loc ->
  token "<-" *> expr <* jump_to_new_line >>= fun e ->
  return @@ ASSIGN (named_loc, e)

let del_space_newline =
  take_while (fun c -> is_whitespace c || is_end_of_line c)

let block stmt_parser thread_number =
  token "{" *> jump_to_new_line *> many1 stmt_parser
  <* cross_n_delims thread_number
  <* token "}" <* jump_to_new_line
  >>= fun stmt_list -> return @@ stmt_list

let if_stmt stmt_parser thread_number =
  cross_n_delims thread_number *> token "if" *> token "(" *> expr <* token ")"
  >>= fun e ->
  block stmt_parser thread_number >>= fun block -> return @@ IF (e, block)

(* the only way to use if-else statement!
   if () {
   }
   else {
   } *)
let if_else_stmt stmt_parser thread_number =
  cross_n_delims thread_number *> token "if" *> token "(" *> expr <* token ")"
  >>= fun e ->
  block stmt_parser thread_number >>= fun bk1 ->
  cross_n_delims thread_number
  *> token "else"
  *> block stmt_parser thread_number
  >>= fun bk2 -> return @@ IF_ELSE (e, bk1, bk2)

let no_op thread_num =
  cross_n_delims thread_num *> token "no_op" <* jump_to_new_line >>= fun _ ->
  return NO_OP

let stmt thread_number =
  fix (fun stmt ->
      if_else_stmt stmt thread_number
      <|> if_stmt stmt thread_number <|> assignment thread_number
      <|> mem_barrier thread_number <|> no_op thread_number)

let thread n = many (stmt n) >>= fun stmts -> return @@ THREAD (n, stmts)

let prog s =
  let n = get_threads_number s in
  let nums = List.init n (fun x -> x) in
  let f1 k = parse (thread k) s in
  let results = List.map f1 nums in
  let oks = List.map Result.get_ok results in
  PROG oks

let test s =
  match parse (stmt 0) s with
  | Result.Ok stmt -> stmt
  | _ -> failwith "parse failed"

let test2 s = match prog s with PROG t_list -> List.hd t_list

module SequentialConsistency = struct
  type ram = (string, int) Hashtbl.t

  type mesi_state = Modified | Exclusive | Shared | Invalidated | Test

  (* В мою кэш линию влезает лишь одна int переменная
     ключ для таблицы это имя переменной*)
  type cache_line = { state : mesi_state; value : int }

  type cache = (string, cache_line) Hashtbl.t

  let add_entry_to_cache (cache : cache) name value =
    match Hashtbl.find_opt cache name with
    | Some _ -> failwith "tried to add cache line that was already in cache"
    | None -> Hashtbl.add cache name { state = Exclusive; value }

  let check_cache_hit cache name =
    let bindings = Hashtbl.find_all cache name in
    if List.length bindings > 1 then
      failwith "variable sits in several cache lines"
    else if List.length bindings = 1 then
      match Hashtbl.find cache name with
      | c_line -> if c_line.state = Invalidated then None else Some c_line
    else None

  (* counter это список счетчиков для разных уровней вложенности
     самый глубокий уровень стоит в списке последним. Список нужен для исполнения
     стейтментов по одному за раз, без списка сложные стейтменты будут исполняться за один раз *)

  type thread_stat = {
    stmts : stmt list;
    counters : int list;
    length : int;
    branch_exprs : int list;
    cache : cache;
    number : int;
  }

  type prog_stat = { threads : thread_stat list; ram : ram }

  let rec remove_at n = function
    | [] -> []
    | h :: t -> if n = 0 then t else h :: remove_at (n - 1) t

  (* возвращает номер первого эл-та от которого f возвращает true *)
  let number_of list f =
    let rec helper list f n =
      if List.length list = 0 then None
        (* failwith "list doesn't have element e such as f(e) returns true" *)
      else
        match f (List.hd list) with
        | true -> Some n
        | false -> helper (List.tl list) f (n + 1)
    in
    helper list f 0

  let set v' n = List.mapi (fun i v -> if i = n then v' else v)

  let init_var memory var =
    match Hashtbl.find_opt memory var with
    | Some _ -> failwith ("variable @" ^ var ^ " already initialized")
    | None -> Hashtbl.add memory var 0

  (* updates only value of cache line, mesi-state is untouched *)
  let update_cache_line cache name value =
    match Hashtbl.find_opt cache name with
    | None -> failwith "tried to update cache line which is not in cache"
    | Some c_line -> Hashtbl.replace cache name { c_line with value }

  type mesi_msg =
    | Read of string
    | ReadResponse of int option
    | Invalidate of string
    | InvalidateAcknowledge
    | ReadInvalidate of string
    | Writeback of string * int

  let change_mesi_state cache name new_mesi_state =
    match Hashtbl.find_opt cache name with
    | None ->
        failwith
          "tried to change mesi_state for cache line which is not in cache"
    | Some c_line ->
        Hashtbl.replace cache name { c_line with state = new_mesi_state }

  let invalidate_cache_line name cache =
    match check_cache_hit cache name with
    | None -> InvalidateAcknowledge
    | Some _ ->
        change_mesi_state cache name Invalidated;
        InvalidateAcknowledge

  let invalidate_caches p_stat n name =
    let rec select_other_caches t_stats acc =
      match t_stats with
      | [] -> acc
      | t_stat :: tl ->
          if t_stat.number = n then select_other_caches tl acc
          else select_other_caches tl (t_stat.cache :: acc)
    in
    let caches = select_other_caches p_stat.threads [] in
    List.iter
      (fun cache ->
        match invalidate_cache_line name cache with
        | InvalidateAcknowledge -> ()
        | _ ->
            failwith
              "invalidate_cache_line could return only InvalidateAcknowledge")
      caches

  let write_back_to_ram_from_cache ram cache name =
    (* check for idiot case *)
    match check_cache_hit cache name with
    | None ->
        failwith "tried to write back to ram the variable that is not in cache"
    | Some c_line ->
        let store_to_ram ram (name : string) (value : int) =
          Hashtbl.replace ram name value
        in
        store_to_ram ram name c_line.value

  let flush_cache_to_ram cache ram =
    Hashtbl.iter
      (fun name c_line ->
        match c_line.state with
        | Invalidated -> ()
        | Modified | Exclusive | Shared ->
            write_back_to_ram_from_cache ram cache name
        | Test -> failwith "tried to flush cache line it Test state")
      cache

  let flush_all_caches p_stat =
    List.iter
      (fun t_stat -> flush_cache_to_ram t_stat.cache p_stat.ram)
      p_stat.threads

  let poll_caches p_stat n name =
    let rec select_other_caches t_stats acc =
      match t_stats with
      | [] -> acc
      | t_stat :: tl ->
          if t_stat.number = n then select_other_caches tl acc
          else select_other_caches tl (t_stat.cache :: acc)
    in
    let caches = select_other_caches p_stat.threads [] in
    let poll_cache cache name =
      match check_cache_hit cache name with
      | None -> ReadResponse None
      | Some c_line -> (
          match c_line.state with
          | Exclusive ->
              change_mesi_state cache name Shared;
              ReadResponse (Some c_line.value)
          | Modified ->
              write_back_to_ram_from_cache p_stat.ram cache name;
              change_mesi_state cache name Shared;
              ReadResponse (Some c_line.value)
          | Shared -> ReadResponse (Some c_line.value)
          | Invalidated -> failwith "check_cache_hit works incorrectly"
          | _ -> failwith "poll_cache with Test state")
    in
    let rec poll_other_caches cache_list name =
      if List.length cache_list = 0 then None
      else
        match poll_cache (List.hd cache_list) name with
        | ReadResponse (Some v) -> Some v
        | ReadResponse None -> poll_other_caches (List.tl cache_list) name
        | _ -> failwith "poll_cache must return only ReadResponse"
    in
    poll_other_caches caches name

  let rec store_to_cache p_stat n name value =
    let t_stat = List.nth p_stat.threads n in
    let local_cache = t_stat.cache in
    match check_cache_hit local_cache name with
    | Some c_line -> (
        match c_line.state with
        | Modified -> update_cache_line local_cache name value
        | Exclusive ->
            update_cache_line local_cache name value;
            change_mesi_state local_cache name Modified
        | Shared ->
            invalidate_caches p_stat n name;
            update_cache_line local_cache name value;
            change_mesi_state local_cache name Modified
        | Invalidated -> failwith "cache hit of line in Invalidated state"
        | Test -> failwith "Test")
    | None -> read_with_intent_to_modify p_stat n name value

  and read_with_intent_to_modify p_stat n name value' =
    let local_thread = List.nth p_stat.threads n in
    let rec select_other_caches t_stats acc =
      match t_stats with
      | [] -> acc
      | t_stat :: tl ->
          if t_stat.number = n then select_other_caches tl acc
          else select_other_caches tl (t_stat.cache :: acc)
    in
    let caches = select_other_caches p_stat.threads [] in
    match poll_caches p_stat n name with
    | None ->
        (* value from main mem. store and set state to M *)
        load_to_cache_from_ram p_stat n name;
        update_cache_line local_thread.cache name value';
        change_mesi_state local_thread.cache name Modified
    | Some value ->
        (*other caches invalidate their copies*)
        let helper name cache =
          match check_cache_hit cache name with
          | None -> ()
          | Some c_line -> (
              match c_line.state with
              | Modified ->
                  write_back_to_ram_from_cache p_stat.ram cache name;
                  change_mesi_state cache name Invalidated
              | Exclusive | Shared -> change_mesi_state cache name Invalidated
              | _ -> failwith "unexpected behavior")
        in
        List.iter (helper name) caches;

        add_entry_to_cache local_thread.cache name value;
        update_cache_line local_thread.cache name value';
        change_mesi_state local_thread.cache name Modified

  and load_to_cache_from_ram p_stat n name =
    let load_from_ram ram var =
      match Hashtbl.find_opt ram var with
      | Some value -> value
      | None ->
          (* Вернуть ноль *)
          init_var ram var;
          Hashtbl.find ram var
    in
    let value = load_from_ram p_stat.ram name in
    add_entry_to_cache (List.nth p_stat.threads n).cache name value
  (* store_to_cache p_stat n name value *)

  let load_from_cache p_stat n name =
    let local_cache = (List.nth p_stat.threads n).cache in
    match check_cache_hit local_cache name with
    | Some c_line -> c_line.value (* cache hit *)
    (* cache miss *)
    | None -> (
        (* poll other caches for this "cache line" (in my case it's variable which is called "name") *)
        match poll_caches p_stat n name with
        | Some value ->
            (* found in cache of another thread *)
            add_entry_to_cache local_cache name value;
            change_mesi_state local_cache name Shared;
            value
        | None -> (
            (* load cache line from main-memory (RAM) *)
            load_to_cache_from_ram p_stat n name;
            match check_cache_hit local_cache name with
            | None ->
                failwith
                  "value was loaded from ram to cache but it is absent in cache"
            | Some c_line -> c_line.value))

  let print_ht =
    Hashtbl.iter (fun v_name value ->
        print_string (v_name ^ " = " ^ string_of_int value ^ "\t"))

  let mesi_state_to_string = function
    | Modified -> "M"
    | Exclusive -> "E"
    | Shared -> "S"
    | Invalidated -> "I"
    | Test -> "TEST"

  let print_cache =
    Hashtbl.iter (fun name c_line ->
        print_string
          (name ^ " = " ^ string_of_int c_line.value ^ " in state: "
          ^ mesi_state_to_string c_line.state
          ^ "\n"))

  (* n - is a thread number where expression is evaluated *)
  let rec eval_expr n p_stat = function
    | INT n -> n
    | VAR_NAME var -> load_from_cache p_stat n var
    | REGISTER r -> failwith "reads from registers not impl yet"
    | PLUS (l, r) -> eval_expr n p_stat l + eval_expr n p_stat r
    | SUB (l, r) -> eval_expr n p_stat l - eval_expr n p_stat r
    | MUL (l, r) -> eval_expr n p_stat l * eval_expr n p_stat r
    | DIV (l, r) ->
        let r_exp = eval_expr n p_stat r in
        if r_exp = 0 then failwith "div by zero"
        else eval_expr n p_stat l / r_exp

  let rec eval_stmt n p_stat = function
    | ASSIGN (l, r) -> eval_assign n p_stat l r
    | NO_OP -> p_stat
    | IF (e, block) -> eval_if n p_stat e block
    | IF_ELSE (e, bk1, bk2) -> eval_if_else n p_stat e bk1 bk2
    | _ -> failwith "mem barrier or block"

  and eval_if_else n p_stat e block1 block2 =
    let cond = eval_expr n p_stat e in
    if cond <> 0 then eval_block n p_stat block1 else eval_block n p_stat block2

  and eval_if n p_stat e block =
    let cond = eval_expr n p_stat e in
    if cond <> 0 then eval_block n p_stat block else p_stat

  and eval_block n p_stat block =
    match block with
    | [] -> p_stat
    | stmtt :: tl -> eval_block n (eval_stmt n p_stat stmtt) tl

  and eval_assign n p_stat l r =
    let value = eval_expr n p_stat r in
    match l with
    | VAR_NAME v ->
        store_to_cache p_stat n v value;
        p_stat
    | REGISTER reg ->
        failwith "assignment to register is not implemented"
        (* Hashtbl.replace ctx.regs reg value;
           p_stat *)
    | _ -> failwith "assignment allowed only to variable and register"

  let print_t_stat t_stat =
    print_string ("thread " ^ string_of_int t_stat.number ^ ":\n");
    print_string "counters: ";
    List.iter (fun x -> print_string @@ string_of_int x ^ "; ") t_stat.counters;
    print_string "\n";
    print_cache t_stat.cache;
    print_string "\n"

  let print_p_stat p_stat =
    List.iter print_t_stat p_stat.threads;
    print_string "ram: ";
    print_ht p_stat.ram;
    print_string "\n"

  let init_thread_stat t =
    let t_info = match t with THREAD (n, stmt_list) -> (n, stmt_list) in
    {
      stmts = snd t_info;
      counters = [ 0 ];
      length = List.length (snd t_info);
      branch_exprs = [];
      cache = Hashtbl.create 8;
      number = fst t_info;
    }

  let init_prog_stat p =
    let t_stats =
      match p with PROG threads -> List.map init_thread_stat threads
    in
    { threads = t_stats; ram = Hashtbl.create 16 }

  let inc_last ls =
    let len = List.length ls in
    List.mapi (fun i x -> if i = len - 1 then x + 1 else x) ls

  let last ls = List.nth ls (List.length ls - 1)

  let enter_block t_stat v =
    {
      t_stat with
      counters = t_stat.counters @ [ 0 ];
      branch_exprs = t_stat.branch_exprs @ [ v ];
    }

  let enter_block_in_thread n p_stat v =
    {
      p_stat with
      threads =
        List.mapi
          (fun i t_stat -> if i = n then enter_block t_stat v else t_stat)
          p_stat.threads;
    }

  let get_stmt t_stat =
    let rec helper stmts counts lvl =
      match counts with
      | [ n ] -> List.nth stmts n
      | n :: tl ->
          helper
            (match List.nth stmts n with
            | IF (_, stmt_list) ->
                if List.nth t_stat.branch_exprs lvl <> 0 then stmt_list
                else failwith "try enter if-block when condition is false"
            | IF_ELSE (_, bk1, bk2) ->
                if List.nth t_stat.branch_exprs lvl <> 0 then bk1 else bk2
            | _ -> failwith "this stmt is not compound")
            tl (lvl + 1)
      | _ -> failwith "invalid list of counters (counts)"
    in
    helper t_stat.stmts t_stat.counters 0

  let check t_stat =
    try match get_stmt t_stat with _ -> true with Failure _ -> false

  let reduce ls = ls |> List.rev |> List.tl |> List.rev

  let thread_stat_inc t_stat =
    { t_stat with counters = inc_last t_stat.counters }

  let correct_t_stat_inc t_stat =
    let rec helper t_stat =
      let t_stat' = thread_stat_inc t_stat in
      if List.length t_stat'.counters = 1 || check t_stat' then t_stat'
      else
        helper
          {
            t_stat' with
            counters = reduce t_stat'.counters;
            branch_exprs = reduce t_stat'.branch_exprs;
          }
    in
    helper t_stat

  let prog_stat_inc p_stat n =
    {
      p_stat with
      threads =
        set (correct_t_stat_inc (List.nth p_stat.threads n)) n p_stat.threads;
    }

  let exec_single_stmt_in_thread n p_stat =
    let t_stat = List.nth p_stat.threads n in
    match get_stmt t_stat with
    | IF (e, _) ->
        if eval_expr n p_stat e = 0 then
          (* skip full if-stmt *)
          prog_stat_inc p_stat n
        else
          (* enter if-block, save this fact in t_stat,  *)
          enter_block_in_thread n p_stat (eval_expr n p_stat e)
    | IF_ELSE (e, _, _) -> enter_block_in_thread n p_stat (eval_expr n p_stat e)
    | NO_OP -> prog_stat_inc p_stat n
    | ASSIGN (l, r) -> prog_stat_inc (eval_assign n p_stat l r) n
    | SMP_RMB | SMP_WMB | SMP_MB -> prog_stat_inc p_stat n

  let thread_is_not_finished t_stat =
    if List.hd t_stat.counters < t_stat.length then true else false

  let prog_is_not_finished p_stat =
    List.exists
      (fun x -> x = true)
      (List.map thread_is_not_finished p_stat.threads)

  let choose_not_finished_thread p_stat =
    let len = List.length p_stat.threads in
    let rec helper p_stat n i =
      if List.nth p_stat.threads i |> thread_is_not_finished then i
      else helper p_stat n (Random.int len)
    in
    helper p_stat len (Random.int len)

  let exec_prog_in_cs p =
    let p_stat = init_prog_stat p in
    let rec helper p_stat =
      if prog_is_not_finished p_stat then
        helper
          (exec_single_stmt_in_thread
             (choose_not_finished_thread p_stat)
             p_stat)
      else p_stat
    in
    let res_p_stat = helper p_stat in
    flush_all_caches res_p_stat;
    res_p_stat
end

module TSO = struct
  let set v' n = List.mapi (fun i v -> if i = n then v' else v)

  type store_op = { name : string; value : int }

  let print_store_op op =
    let s = op.name ^ " <- " ^ string_of_int op.value in
    print_endline s

  type invalidation = { target : string }

  let print_inv inv =
    let s = "invalidate " ^ inv.target in
    print_endline s

  type store_buf = store_op Queue.t

  let print_store_buf buf =
    print_endline "store_buf:";
    Queue.iter print_store_op buf

  type inv_queue = invalidation Queue.t

  let print_inv_q q =
    print_endline "inv_q:";
    Queue.iter print_inv q

  let buffer_invalidation inv inv_queue = Queue.add inv inv_queue

  let buffer_store (store : store_op) st_buf = Queue.add store st_buf

  (* посчитать число записей в переменную name ,которые находятся в store buffer-e *)
  let calc_entries name st_buf =
    Queue.fold
      (fun accu store_op -> if store_op.name = name then accu + 1 else accu)
      0 st_buf

  (* получить последнее значение записанное в переменную name и
     находящееся в буфере записи *)
  let store_forwarding (name : string) (st_buf : store_buf) =
    let n = calc_entries name st_buf in
    if n = 0 then None
    else
      let last_buffered_store_to_name_value =
        Queue.fold
          (fun accu store_op ->
            if store_op.name = name then store_op.value else accu)
          0 st_buf
      in
      Some last_buffered_store_to_name_value

  type ram = (string, int) Hashtbl.t

  type ram_controller = { load_requests : (string * int) Queue.t }

  type mesi_state = Modified | Exclusive | Shared | Invalidated

  let mesi_state_to_string = function
    | Modified -> "M"
    | Exclusive -> "E"
    | Shared -> "S"
    | Invalidated -> "I"

  type mesi_msg =
    (* какую переменную и от какого потока. номep нужен, чтобы знать кому потом посылать ответ *)
    | ReadRq of (string * int)
    (* имя запрашиваемой переменной, её значение, если присутствует в опрашиваемом кэше и в каком состоянии
       она была в кэше(если была), который отправляет ответ*)
    | ReadResponse of (string * int option * mesi_state option)
    | Invalidate of (string * int)
    (* инвалидэйт акноуледжмент какой кэш линии (переменной) и от процессора с каким номером *)
    | InvalidateAcknowledge of (string * int)
    | ReadInvalidate of string
    | Writeback of string * int

  let print_mesi_msg = function
    | ReadRq (v_name, n) ->
        print_endline ("ReadRq: " ^ v_name ^ " by thread " ^ string_of_int n)
    | ReadResponse (v_name, value, state) -> (
        match value with
        | None -> print_endline ("ReadResp: " ^ v_name ^ " is not in cache")
        | Some v -> (
            match state with
            | None -> failwith "impossible"
            | Some st ->
                print_endline
                  ("ReadResp: " ^ v_name ^ " = " ^ string_of_int v
                 ^ " was in state " ^ mesi_state_to_string st)))
    | Invalidate (v_name, n) ->
        print_endline ("Invalidate " ^ v_name ^ " by thread " ^ string_of_int n)
    | InvalidateAcknowledge (v_name, n) ->
        print_endline
          ("InvalidateAck " ^ v_name ^ " by thread " ^ string_of_int n)
    | _ -> failwith "ReadInvalidate and Writeback don't printed"

  let print_cache_rq_q = Queue.iter print_mesi_msg

  (* В мою кэш линию влезает лишь одна int переменная
     ключ для таблицы это имя переменной*)
  type cache_line = { state : mesi_state; value : int }

  type cache = (string, cache_line) Hashtbl.t

  let add_entry_to_cache (cache : cache) name value =
    match Hashtbl.find_opt cache name with
    | Some _ -> failwith "tried to add cache line that was already in cache"
    | None -> Hashtbl.add cache name { state = Exclusive; value }

  let add_or_modify_cache_line cache name value =
    match Hashtbl.find_opt cache name with
    | Some _ -> Hashtbl.replace cache name { state = Modified; value }
    | None -> Hashtbl.add cache name { state = Exclusive; value }

  let check_cache_hit cache name =
    let bindings = Hashtbl.find_all cache name in
    if List.length bindings > 1 then
      failwith "variable sits in several cache lines"
    else if List.length bindings = 1 then
      match Hashtbl.find cache name with
      | c_line -> if c_line.state = Invalidated then None else Some c_line
    else None

  type thread_stat = {
    stmts : stmt list;
    counters : int list;
    length : int;
    branch_exprs : int list;
    cache : cache;
    cache_request_queue : mesi_msg Queue.t;
    cache_ack_queue : mesi_msg Queue.t;
    st_buf : store_buf;
    inv_q : inv_queue;
    number : int;
    pending_load : bool;
    last_eval_res : int;
    read_rq_tbl : (string, bool * int) Hashtbl.t;
    inv_rq_tbl : (string, int) Hashtbl.t;
  }

  type prog_stat = {
    threads : thread_stat list;
    ram : ram;
    ram_controller : ram_controller;
  }

  let get_thread p_stat n =
    let rec helper t_stats =
      match t_stats with
      | [] ->
          failwith ("program doesn't have thread with num " ^ string_of_int n)
      | t_stat :: tl -> if t_stat.number = n then t_stat else helper tl
    in
    helper p_stat.threads

  let await_pending_load_in_thread n p_stat =
    let helper t_stat =
      match t_stat.pending_load with
      | true -> t_stat
      (* failwith "previous pending_load is not ended" *)
      (* надо ли last_eval_res = None? *)
      | false -> { t_stat with pending_load = true }
    in
    let t_stat' = helper (get_thread p_stat n) in
    let t_stats' = set t_stat' n p_stat.threads in
    { p_stat with threads = t_stats' }

  let finish_pending_load_in_thread n p_stat =
    let helper t_stat =
      match t_stat.pending_load with
      | true -> { t_stat with pending_load = false }
      | false -> t_stat
    in
    let t_stat' = helper (get_thread p_stat n) in
    let t_stats' = set t_stat' n p_stat.threads in
    { p_stat with threads = t_stats' }

  (* updates only value of cache line, mesi-state is untouched *)
  let update_cache_line cache name value =
    match Hashtbl.find_opt cache name with
    | None -> failwith "tried to update cache line which is not in cache"
    | Some c_line -> Hashtbl.replace cache name { c_line with value }

  let change_mesi_state cache name new_mesi_state =
    match Hashtbl.find_opt cache name with
    | None ->
        failwith
          "tried to change mesi_state for cache line which is not in cache"
    | Some c_line ->
        Hashtbl.replace cache name { c_line with state = new_mesi_state }

  let invalidate_cache_line name cache =
    match check_cache_hit cache name with
    | None -> ()
    | Some _ -> change_mesi_state cache name Invalidated

  (* let invalidate_caches p_stat n name =
     let rec select_other_caches t_stats acc =
       match t_stats with
       | [] -> acc
       | t_stat :: tl ->
           if t_stat.number = n then select_other_caches tl acc
           else select_other_caches tl (t_stat.cache :: acc)
     in
     let caches = select_other_caches p_stat.threads [] in
     let invalidate_cache_line name cache =
       match check_cache_hit cache name with
       | None -> InvalidateAcknowledge
       | Some _ ->
           change_mesi_state cache name Invalidated;
           InvalidateAcknowledge
     in
     List.iter
       (fun cache ->
         match invalidate_cache_line name cache with
         | InvalidateAcknowledge -> ()
         | _ ->
             failwith
               "invalidate_cache_line could return only InvalidateAcknowledge")
       caches *)

  let write_back_to_ram_from_cache ram cache name =
    (* check for idiot case *)
    match check_cache_hit cache name with
    | None ->
        failwith "tried to write back to ram the variable that is not in cache"
    | Some c_line ->
        let store_to_ram ram (name : string) (value : int) =
          Hashtbl.replace ram name value
        in
        store_to_ram ram name c_line.value

  let flush_cache_to_ram cache ram =
    Hashtbl.iter
      (fun name c_line ->
        match c_line.state with
        | Invalidated -> ()
        | Modified | Exclusive | Shared ->
            write_back_to_ram_from_cache ram cache name)
      cache

  let flush_all_caches p_stat =
    List.iter
      (fun t_stat -> flush_cache_to_ram t_stat.cache p_stat.ram)
      p_stat.threads

  let rec select_other_caches p_stat n =
    let rec helper t_stats acc =
      match t_stats with
      | [] -> acc
      | t_stat :: tl ->
          if t_stat.number = n then helper tl acc
          else helper tl (t_stat.cache :: acc)
    in
    helper p_stat.threads []

  (* послать запрос из потока n на инвалидацию кэш линии (переменной) другим кэшам *)
  let send_invalidate_request p_stat n name =
    List.iter
      (fun t_stat ->
        (* посылаем всем кэшам, можно подумать об отправке только тем, которые содержат name *)
        if t_stat.number <> n then
          Queue.add (Invalidate (name, n)) t_stat.cache_request_queue
        else ())
      p_stat.threads

  (* это метод вызывается, когда у потока в начале очереди cache_request_queue
     находится Invalidate (v_name, n). Наша задача это при наличии в кэше переменной name
     инвалидировать её, а потом положить в очередь cache_ack_queue потока n наш acknowledgment *)
  (* применяя этот метод мы удаляем из очереди первый запрос! *)
  let speculativly_process_invalidate_request p_stat cur_thread_num =
    let local_thread = get_thread p_stat cur_thread_num in
    match Queue.take_opt local_thread.cache_request_queue with
    | None -> failwith "nothing to put in inv_queue"
    | Some request -> (
        match request with
        | Invalidate (v_name, source_t_num) ->
            let requestor_thread = get_thread p_stat source_t_num in
            (* добавляем инвалидацию в свою invalidation_queue *)
            Queue.add { target = v_name } local_thread.inv_q;
            (* отправляем акноуледжмент *)
            Queue.add
              (InvalidateAcknowledge (v_name, cur_thread_num))
              requestor_thread.cache_ack_queue
        | _ ->
            failwith
              "first element in cache_request_queue isn't an Invalidate request"
        )

  (* let really_process_invalidate_request p_stat cur_thread_num =
     let local_thread = get_thread p_stat cur_thread_num in
     match Queue.take_opt local_thread.cache_request_queue with
     | None -> failwith "no (invalidate) requests to process"
     | Some request -> (
         match request with
         | Invalidate (v_name, source_t_num) -> (
             let requestor_thread = get_thread p_stat source_t_num in
             match check_cache_hit local_thread.cache v_name with
             | None ->
                 Queue.add
                   (InvalidateAcknowledge (v_name, cur_thread_num))
                   requestor_thread.cache_ack_queue
             | Some _ ->
                 invalidate_cache_line v_name local_thread.cache;
                 Queue.add
                   (InvalidateAcknowledge (v_name, cur_thread_num))
                   requestor_thread.cache_ack_queue)
         | _ ->
             failwith
               "fst element in cache_request_queue isn't Invalidate request") *)

  let load_from_ram_request p_stat n name =
    Queue.add (name, n) p_stat.ram_controller.load_requests

  let send_read_request p_stat n name =
    (* по идее здесь нужно запускать загрузку значения из оперативки,
       поскольку это долго, о запускается сразу, а потом, если в кешах нашли переменную -
       обрывается. *)
    (* load_from_ram_request p_stat n name; *)
    List.iter
      (fun t_stat ->
        if t_stat.number <> n then
          Queue.add (ReadRq (name, n)) t_stat.cache_request_queue
        else ())
      p_stat.threads

  (* применяя этот метод мы удаляем из очереди первый запрос! *)
  let process_read_request p_stat cur_t_num =
    let local_thread = get_thread p_stat cur_t_num in
    match Queue.take_opt local_thread.cache_request_queue with
    | None -> failwith "no (read) requests to process"
    | Some request -> (
        match request with
        | ReadRq (v_name, source_t_num) -> (
            let requestor_thread = get_thread p_stat source_t_num in
            match check_cache_hit local_thread.cache v_name with
            | None ->
                Queue.add
                  (ReadResponse (v_name, None, None))
                  requestor_thread.cache_ack_queue
            | Some c_line -> (
                match c_line.state with
                | Exclusive ->
                    Queue.add
                      (ReadResponse (v_name, Some c_line.value, Some Exclusive))
                      requestor_thread.cache_ack_queue;
                    change_mesi_state local_thread.cache v_name Shared
                | Modified ->
                    write_back_to_ram_from_cache p_stat.ram local_thread.cache
                      v_name;
                    change_mesi_state local_thread.cache v_name Shared;
                    Queue.add
                      (ReadResponse (v_name, Some c_line.value, Some Modified))
                      requestor_thread.cache_ack_queue
                | Shared ->
                    Queue.add
                      (ReadResponse (v_name, Some c_line.value, Some Shared))
                      requestor_thread.cache_ack_queue
                | Invalidated ->
                    failwith
                      "cache hit for line in Invalidated state is an error"))
        | _ -> failwith "fst element in cache_request_queue isn't ReadRq")

  let issue_read_rq p_stat n v_name =
    let local_thread = get_thread p_stat n in
    match Hashtbl.find_opt local_thread.read_rq_tbl v_name with
    | None ->
        Hashtbl.add local_thread.read_rq_tbl v_name (false, 0);
        send_read_request p_stat n v_name
        (* значит запрос на чтении этой переменной уже послан, надо ожидать ответа других кэшей *)
    | Some _ -> ()

  let issue_inv_rq p_stat n v_name =
    let local_thread = get_thread p_stat n in
    match Hashtbl.find_opt local_thread.inv_rq_tbl v_name with
    | None ->
        Hashtbl.add local_thread.inv_rq_tbl v_name 0;
        send_invalidate_request p_stat n v_name
        (* запрос на инвалидацию этой переменной уже послан, надо ожидать ответа всех других кэшей *)
    | Some _ -> ()

  let rec store_to_cache p_stat n name value =
    let local_thread = get_thread p_stat n in
    let local_cache = local_thread.cache in
    match check_cache_hit local_cache name with
    | Some c_line -> (
        match c_line.state with
        | Modified -> update_cache_line local_cache name value
        | Exclusive ->
            update_cache_line local_cache name value;
            change_mesi_state local_cache name Modified
        | Shared ->
            (* помещаем запись в буфер_записей,
               посылаем запрос на инвалидацию дригим кэшам *)
            buffer_store { name; value } local_thread.st_buf;

            issue_inv_rq p_stat n name
            (* send_invalidate_request p_stat n name *)
        | Invalidated ->
            failwith "store_to_cache: cache hit of line in Invalidated state")
    | None ->
        (* можно ли помещать в буфер_записей запись в кэш-линию в состоянии Invalidated?  *)
        (* предположим, что это можно делать *)
        buffer_store { name; value } local_thread.st_buf;
        issue_read_rq p_stat n name;
        issue_inv_rq p_stat n name

  and load_to_cache_from_ram p_stat n name =
    let load_from_ram ram var =
      match Hashtbl.find_opt ram var with
      | Some value -> value
      | None ->
          (* Вернуть ноль *)
          let init_var memory var =
            match Hashtbl.find_opt memory var with
            | Some _ -> failwith ("variable @" ^ var ^ " already initialized")
            | None -> Hashtbl.add memory var 0
          in
          init_var ram var;
          Hashtbl.find ram var
    in
    let value = load_from_ram p_stat.ram name in
    add_entry_to_cache (get_thread p_stat n).cache name value

  let load_from_cache_opt p_stat n name =
    let local_thread = get_thread p_stat n in
    let local_cache = local_thread.cache in
    match store_forwarding name local_thread.st_buf with
    | Some v -> Some v (* store forwarding *)
    | None -> (
        match check_cache_hit local_cache name with
        | Some c_line -> Some c_line.value
        | None ->
            (* send ReadRq to other caches and leave method
               (to await other caches or ram supply us with "cache line" (variable)) *)
            (* send_read_request p_stat n name; *)
            issue_read_rq p_stat n name;
            None)

  let print_ht ht =
    Hashtbl.iter
      (fun v_name value ->
        print_string (v_name ^ " = " ^ string_of_int value ^ "\t"))
      ht;
    print_endline ""

  let print_cache =
    Hashtbl.iter (fun name c_line ->
        print_string
          (name ^ " = " ^ string_of_int c_line.value ^ " in state: "
          ^ mesi_state_to_string c_line.state
          ^ "\n"))

  let eval_int c t_num p_stat =
    let t_stat = get_thread p_stat t_num in
    let t_stat' = { t_stat with last_eval_res = c } in
    { p_stat with threads = set t_stat' t_num p_stat.threads }

  (* n - is a thread number where expression is evaluated *)
  let rec eval_expr n p_stat = function
    | INT value -> eval_int value n p_stat
    | VAR_NAME var -> (
        match load_from_cache_opt p_stat n var with
        | Some value -> eval_int value n p_stat
        (* надо ожидать поступления значения из других кешей или основной памяти.
               Плюс надо факт такого ожидания отметить в p_stat или t_stat
               Когда данные придут, то передающий их кэш или основная память должны
               изменить значение флага pending_load на false *)
        | None -> await_pending_load_in_thread n p_stat)
    | REGISTER r -> failwith "reads from registers not impl yet"
    | PLUS (l, r) -> (
        let p_stat1 = eval_expr n p_stat l in
        let t_stat1 = get_thread p_stat1 n in
        match t_stat1.pending_load with
        | true -> p_stat1
        | false -> (
            let p_stat2 = eval_expr n p_stat r in
            let t_stat2 = get_thread p_stat2 n in
            match t_stat2.pending_load with
            | false ->
                eval_int
                  (t_stat1.last_eval_res + t_stat2.last_eval_res)
                  n p_stat2
            | true -> p_stat2))
    | SUB (l, r) -> (
        let p_stat1 = eval_expr n p_stat l in
        let t_stat1 = get_thread p_stat1 n in
        match t_stat1.pending_load with
        | true -> p_stat1
        | false -> (
            let p_stat2 = eval_expr n p_stat r in
            let t_stat2 = get_thread p_stat2 n in
            match t_stat2.pending_load with
            | false ->
                eval_int
                  (t_stat1.last_eval_res - t_stat2.last_eval_res)
                  n p_stat2
            | true -> p_stat2))
    | MUL (l, r) -> (
        let p_stat1 = eval_expr n p_stat l in
        let t_stat1 = get_thread p_stat1 n in
        match t_stat1.pending_load with
        | true -> p_stat1
        | false -> (
            let p_stat2 = eval_expr n p_stat r in
            let t_stat2 = get_thread p_stat2 n in
            match t_stat2.pending_load with
            | false ->
                eval_int
                  (t_stat1.last_eval_res * t_stat2.last_eval_res)
                  n p_stat2
            | true -> p_stat2))
    | DIV (l, r) -> (
        let p_stat1 = eval_expr n p_stat l in
        let t_stat1 = get_thread p_stat1 n in
        match t_stat1.pending_load with
        | true -> p_stat1
        | false -> (
            let p_stat2 = eval_expr n p_stat r in
            let t_stat2 = get_thread p_stat2 n in
            match t_stat2.pending_load with
            | false ->
                if t_stat2.last_eval_res = 0 then failwith "div by zero"
                else
                  eval_int
                    (t_stat1.last_eval_res / t_stat2.last_eval_res)
                    n p_stat2
            | true -> p_stat2))

  let eval_assign n p_stat l r =
    let p_stat' = eval_expr n p_stat r in
    let t_stat' = get_thread p_stat' n in
    if t_stat'.pending_load then p_stat'
    else
      match l with
      | VAR_NAME v ->
          store_to_cache p_stat' n v t_stat'.last_eval_res;
          p_stat'
      | REGISTER reg ->
          failwith "assignment to register is not implemented"
          (* Hashtbl.replace ctx.regs reg value;
             p_stat *)
      | _ -> failwith "assignment allowed only to variable and register"

  let print_read_rq_tbl =
    Hashtbl.iter (fun v_name pair ->
        print_endline
          (v_name ^ " "
          ^ string_of_bool (fst pair)
          ^ " "
          ^ string_of_int (snd pair)))

  let print_t_stat t_stat =
    print_string ("thread " ^ string_of_int t_stat.number ^ ":\n");

    print_string "counters: ";
    List.iter (fun x -> print_string @@ string_of_int x ^ "; ") t_stat.counters;
    print_string "\n";

    print_cache t_stat.cache;

    (* print_string "\n"; *)
    print_endline "read_rq_tbl: ";
    print_read_rq_tbl t_stat.read_rq_tbl;
    print_endline "inv_rq_tbl: ";
    print_ht t_stat.inv_rq_tbl;

    print_store_buf t_stat.st_buf;
    print_inv_q t_stat.inv_q;

    print_endline "cache_request_queue: ";
    print_cache_rq_q t_stat.cache_request_queue;

    print_endline "cache_ack_queue: ";
    print_cache_rq_q t_stat.cache_ack_queue;

    print_endline "----------------"

  let print_p_stat p_stat =
    List.iter print_t_stat p_stat.threads;
    print_string "\n";
    print_string "ram: ";
    print_ht p_stat.ram;
    print_string "\n"

  let init_thread_stat t =
    let t_info = match t with THREAD (n, stmt_list) -> (n, stmt_list) in
    {
      stmts = snd t_info;
      counters = [ 0 ];
      length = List.length (snd t_info);
      branch_exprs = [];
      cache = Hashtbl.create 8;
      st_buf = Queue.create ();
      inv_q = Queue.create ();
      cache_request_queue = Queue.create ();
      cache_ack_queue = Queue.create ();
      number = fst t_info;
      pending_load = false;
      last_eval_res = 0;
      read_rq_tbl = Hashtbl.create 32;
      inv_rq_tbl = Hashtbl.create 32;
    }

  let init_prog_stat p =
    let t_stats =
      match p with PROG threads -> List.map init_thread_stat threads
    in
    {
      threads = t_stats;
      ram = Hashtbl.create 16;
      ram_controller = { load_requests = Queue.create () };
    }

  let inc_last ls =
    let len = List.length ls in
    List.mapi (fun i x -> if i = len - 1 then x + 1 else x) ls

  let last ls = List.nth ls (List.length ls - 1)

  let enter_block t_stat v =
    {
      t_stat with
      counters = t_stat.counters @ [ 0 ];
      branch_exprs = t_stat.branch_exprs @ [ v ];
    }

  let enter_block_in_thread n p_stat v =
    {
      p_stat with
      threads =
        List.mapi
          (fun i t_stat -> if i = n then enter_block t_stat v else t_stat)
          p_stat.threads;
    }

  let get_stmt t_stat =
    let rec helper stmts counts lvl =
      match counts with
      | [ n ] -> List.nth stmts n
      | n :: tl ->
          helper
            (match List.nth stmts n with
            | IF (_, stmt_list) ->
                if List.nth t_stat.branch_exprs lvl <> 0 then stmt_list
                else failwith "try enter if-block when condition is false"
            | IF_ELSE (_, bk1, bk2) ->
                if List.nth t_stat.branch_exprs lvl <> 0 then bk1 else bk2
            | _ -> failwith "this stmt is not compound")
            tl (lvl + 1)
      | _ -> failwith "invalid list of counters (counts)"
    in
    helper t_stat.stmts t_stat.counters 0

  let check t_stat =
    try match get_stmt t_stat with _ -> true with Failure _ -> false

  let reduce ls = ls |> List.rev |> List.tl |> List.rev

  let thread_stat_inc t_stat =
    { t_stat with counters = inc_last t_stat.counters }

  let correct_t_stat_inc t_stat =
    let rec helper t_stat =
      let t_stat' = thread_stat_inc t_stat in
      if List.length t_stat'.counters = 1 || check t_stat' then t_stat'
      else
        helper
          {
            t_stat' with
            counters = reduce t_stat'.counters;
            branch_exprs = reduce t_stat'.branch_exprs;
          }
    in
    helper t_stat

  let set v' n = List.mapi (fun i v -> if i = n then v' else v)

  let prog_stat_inc p_stat n =
    {
      p_stat with
      threads =
        set (correct_t_stat_inc (List.nth p_stat.threads n)) n p_stat.threads;
    }

  let process_read_resp_in_thread n p_stat v_name value =
    let local_thread = get_thread p_stat n in
    let read_rq_tbl = local_thread.read_rq_tbl in
    match Hashtbl.find_opt read_rq_tbl v_name with
    | None ->
        failwith
          "thread that issued ReadRq must put in his read_rq_tbl pair of key = \
           v_name; value = (false, 0)"
    | Some (is_obtained, cnt) -> (
        if is_obtained = false && cnt = 0 then (
          (* это первый поступивший ответ на запрос чтения *)
          match value with
          | None -> Hashtbl.replace read_rq_tbl v_name (false, 1)
          | Some v ->
              (* add to our cache *)
              add_entry_to_cache local_thread.cache v_name v;

              (* finish_pending_load_in_thread n p_stat; <-----------------------------------------------------*)

              (* так как значение получили от других кешей, то наша кэш линия
                 должна быть в состоянии Shared *)
              change_mesi_state local_thread.cache v_name Shared;
              Hashtbl.replace read_rq_tbl v_name (true, 1))
        else
          let cnt' = cnt + 1 in
          match is_obtained with
          | true -> Hashtbl.replace read_rq_tbl v_name (true, cnt')
          | false -> (
              match value with
              | None -> Hashtbl.replace read_rq_tbl v_name (false, cnt')
              | Some v ->
                  (* add to our cache *)
                  add_entry_to_cache local_thread.cache v_name v;
                  Hashtbl.replace read_rq_tbl v_name (true, cnt')))

  let process_inv_ack_in_thread n p_stat v_name =
    let local_thread = get_thread p_stat n in
    let inv_rq_tbl = local_thread.inv_rq_tbl in
    match Hashtbl.find_opt inv_rq_tbl v_name with
    | None -> Hashtbl.add inv_rq_tbl v_name 1
    | Some cnt -> Hashtbl.replace inv_rq_tbl v_name (cnt + 1)

  (* поток должен уметь принимать акноуледжменты и обрабатывать запросы, которые лежат в очередях
     cache_ack_queue and cache_request_queue
     Для этого нужны отдельные ф-ии *)
  let process_rq_in_thread n p_stat =
    let local_thread = get_thread p_stat n in
    match Queue.peek_opt local_thread.cache_request_queue with
    | None -> ()
    | Some rq -> (
        match rq with
        | ReadRq (_, _) -> process_read_request p_stat n
        | Invalidate (_, _) -> speculativly_process_invalidate_request p_stat n
        | _ -> failwith "processing of this rq is not impl")

  let process_ack_in_thread n p_stat =
    let local_thread = get_thread p_stat n in
    let num_of_caches = List.length p_stat.threads in
    match Queue.take_opt local_thread.cache_ack_queue with
    | None -> ()
    | Some ack -> (
        match ack with
        | ReadResponse (v_name, value, responder_cache_state) ->
            process_read_resp_in_thread n p_stat v_name value;
            let read_rq = Hashtbl.find local_thread.read_rq_tbl v_name in
            let is_obtained = fst read_rq in
            let cnt' = snd read_rq in

            if cnt' = num_of_caches - 1 then (
              Hashtbl.remove local_thread.read_rq_tbl v_name;
              if not is_obtained then load_to_cache_from_ram p_stat n v_name
              else ())
            else ()
            (* let _ = Queue.take local_thread.cache_ack_queue in
               () *)
        | InvalidateAcknowledge (v_name, responder_t_num) ->
            process_inv_ack_in_thread n p_stat v_name;
            let num_of_resps = Hashtbl.find local_thread.inv_rq_tbl v_name in
            if num_of_resps = num_of_caches - 1 then (
              Hashtbl.remove local_thread.inv_rq_tbl v_name;
              (* move store from st_buf to cache; change cache line state *)
              match Queue.peek_opt local_thread.st_buf with
              | None ->
                  failwith
                    "we received all inv_acks but there is no store in \
                     store_buffer"
              | Some store ->
                  if store.name = v_name then (
                    (* add_entry_to_cache local_thread.cache v_name store.value; *)
                    add_or_modify_cache_line local_thread.cache v_name
                      store.value;
                    let _ = Queue.pop local_thread.st_buf in
                    ())
                  else
                    failwith
                      ("we received all inv_acks but first entry in st_buf is \
                        a store to a location different from " ^ v_name))
            else ()
        | _ ->
            failwith "process_ack_in_thread: processing of this ack is not impl"
        )

  let exec_single_stmt_in_thread n p_stat =
    let t_stat = get_thread p_stat n in
    match get_stmt t_stat with
    | IF (e, _) -> (
        let p_stat' = eval_expr n p_stat e in
        let t_stat' = get_thread p_stat' n in
        match t_stat'.pending_load with
        | false ->
            if t_stat'.last_eval_res = 0 then prog_stat_inc p_stat' n
            else enter_block_in_thread n p_stat' t_stat'.last_eval_res
        | true -> p_stat')
    | IF_ELSE (e, _, _) -> (
        let p_stat' = eval_expr n p_stat e in
        let t_stat' = get_thread p_stat' n in
        match t_stat'.pending_load with
        | false -> enter_block_in_thread n p_stat' t_stat'.last_eval_res
        | true -> p_stat'
        (* enter_block_in_thread n p_stat (eval_expr n p_stat e) *))
    | NO_OP -> prog_stat_inc p_stat n
    | ASSIGN (l, r) -> (
        let p_stat' = eval_assign n p_stat l r in
        let t_stat' = get_thread p_stat' n in
        match t_stat'.pending_load with
        | true -> p_stat'
        | false -> prog_stat_inc p_stat' n
        (* prog_stat_inc (eval_assign n p_stat l r) n *))
    | SMP_RMB | SMP_WMB | SMP_MB ->
        (* prog_stat_inc p_stat n *) failwith "mem bars not impl yet"

  let exec_stmt_or_process_cache n p_stat =
    match Random.int 3 with
    | 0 -> exec_single_stmt_in_thread n p_stat
    | 1 ->
        process_rq_in_thread n p_stat;
        p_stat
    | 2 ->
        process_ack_in_thread n p_stat;
        p_stat

  let thread_is_not_finished t_stat =
    if List.hd t_stat.counters < t_stat.length then true else false

  let prog_is_not_finished p_stat =
    List.exists
      (fun x -> x = true)
      (List.map thread_is_not_finished p_stat.threads)

  let choose_not_finished_thread p_stat =
    let len = List.length p_stat.threads in
    let rec helper p_stat n i =
      if List.nth p_stat.threads i |> thread_is_not_finished then i
      else helper p_stat n (Random.int len)
    in
    helper p_stat len (Random.int len)

  let exec_prog_in_tso p =
    let p_stat = init_prog_stat p in
    let rec helper p_stat =
      if prog_is_not_finished p_stat then
        helper
          ((* exec_single_stmt_in_thread *)
           exec_stmt_or_process_cache
             (choose_not_finished_thread p_stat)
             p_stat)
      else p_stat
    in
    let res_p_stat = helper p_stat in
    (* flush_all_store_buffers_and_inv_queues *)
    flush_all_caches res_p_stat;
    res_p_stat
end

let s = "x<-1 ||| y<-1\na<- y ||| b <- x"

let p = prog s

open TSO

let p_stat = TSO.init_prog_stat p
