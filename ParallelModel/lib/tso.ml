type expr =
  | INT of int
  | VAR_NAME of string
  | REGISTER of string
  | PLUS of expr * expr
  | SUB of expr * expr
  | MUL of expr * expr
  | DIV of expr * expr
[@@deriving show { with_path = false }]

type stmt =
  | ASSERT of expr
  | ASSIGN of expr * expr
  | WHILE of expr * stmt list
  | IF of expr * stmt list
  | IF_ELSE of expr * stmt list * stmt list
  | SMP_RMB
  | SMP_WMB
  | SMP_MB
  | NO_OP
[@@deriving show { with_path = false }]

type thread = THREAD of (int * stmt list)
[@@deriving show { with_path = false }]

type prog = PROG of thread list [@@deriving show { with_path = false }]

open Angstrom

let splitter s = Str.split (Str.regexp "|||") (" " ^ s ^ " ")

let split_on_parts s =
  let lines = String.split_on_char '\n' (String.trim s) in
  List.map splitter lines

let get_threads_number s = split_on_parts s |> List.hd |> List.length

let trim_list list = List.map String.trim list

let empty_str_to_no_op list =
  List.map (fun s -> match s with "" -> "no_op" | _ -> s) list

let concat_list = String.concat " ||| "

let concat_lines = String.concat "\n"

let preprocess input =
  (split_on_parts input |> List.map trim_list
  |> List.map empty_str_to_no_op
  |> List.map concat_list |> String.concat "\n")
  ^ "\n"

let reserved =
  [ "smp_rmb"; "smp_wmb"; "smp_mb"; "if"; "assert"; "while"; "else"; "no_op" ]

let is_whitespace = function ' ' | '\n' | '\r' | '\t' -> true | _ -> false

(* let whitespace = take_while is_whitespace *)

let space =
  let is_space = function ' ' | '\t' -> true | _ -> false in
  take_while is_space

let is_end_of_line = function '\n' | '\r' -> true | _ -> false

let is_not_end_of_line c = not @@ is_end_of_line @@ c

(* let token s = whitespace *> string s *)
let token s = space *> string s

let is_digit = function '0' .. '9' -> true | _ -> false

let parse p s = parse_string ~consume:All p (preprocess s)

let parse_unproc p s = parse_string ~consume:All p s

let skip_rest_of_line = take_while (fun c -> c <> '\n') *> string "\n"

(* let jump_to_new_line = take_till is_end_of_line *> take_while is_end_of_line *)

let cross_thread_delim =
  take_till (fun c -> match c with '|' | '\n' | '\r' -> true | _ -> false)
  *> token "|||"

let cross_n_delims n = count n cross_thread_delim

(* let go_to_next_line_for_thread n =
   jump_to_new_line *> count n cross_thread_delim *)

let number =
  let digits = space *> take_while1 is_digit in
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
  space *> take_while1 is_big_letter >>= fun s ->
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
  space *> peek_char >>= function
  | Some c when is_allowed_fst_char c ->
      take_while is_allowed_var_name_char >>= fun var_name ->
      if is_allowed_var_name var_name then return @@ VAR_NAME var_name
      else fail "Variable's name is key word or register name"
  | _ -> fail "invalid variable name"

let parens p = token "(" *> p <* token ")"

let chainl1 x op =
  let rec loop a = op >>= (fun f -> x >>= fun b -> loop (f a b)) <|> return a in
  x >>= loop

let factop = mul <|> div <?> "'*' or '/' expected" <* space

let termop = add <|> sub <?> "'+' or '-' expected" <* space

let expr =
  fix (fun expr ->
      let value = choice [ number; reg; var_name ] in
      let parentheses =
        let helper =
          space *> peek_char_fail >>= function '(' -> parens expr | _ -> value
        in
        choice [ helper; value ]
      in
      let term1 = chainl1 parentheses factop in
      let arexpr = chainl1 term1 termop in
      let newexpr = fix (fun newexpr -> arexpr <|> parens newexpr) in
      newexpr)

let end_of_instr = choice [ token "\n"; token "|||" *> skip_rest_of_line ]

let mem_barrier thread_num =
  let smp_rmb = token "smp_rmb" *> return SMP_RMB in
  let smp_wmb = token "smp_wmb" *> return SMP_WMB in
  let smp_mb = token "smp_mb" *> return SMP_MB in
  cross_n_delims thread_num *> (smp_rmb <|> smp_wmb <|> smp_mb) <* end_of_instr

let assert_stmt thread_num =
  cross_n_delims thread_num *> token "assert" *> token "(" *> expr
  <* token ")" <* end_of_instr
  >>= fun e -> return @@ ASSERT e

let assignment thread_num =
  cross_n_delims thread_num *> (reg <|> var_name) >>= fun named_loc ->
  token "<-" *> expr <* end_of_instr >>= fun e -> return @@ ASSIGN (named_loc, e)

(*
   the only way to use if-else statement!
      if () {
      }
      else {
      }
      You must use java style for curly brackets.
      For empty block is allowed to be written like:
      while (1) {}
*)
let block stmt_parser thread_number =
  let empty_block =
    token "{"
    *> choice
         [
           token "}";
           skip_rest_of_line *> cross_n_delims thread_number *> token "}";
         ]
    *> end_of_instr
    *> return [ NO_OP ]
  in
  let correct_block =
    token "{" *> skip_rest_of_line *> many1 stmt_parser
    <* cross_n_delims thread_number
    <* token "}" <* end_of_instr
    >>= fun stmt_list -> return @@ stmt_list
  in
  choice [ correct_block; empty_block ]

let while_stmt stmt_parser thread_num =
  cross_n_delims thread_num *> token "while" *> token "(" *> expr <* token ")"
  >>= fun e ->
  block stmt_parser thread_num >>= fun block -> return @@ WHILE (e, block)

let if_stmt stmt_parser thread_number =
  cross_n_delims thread_number *> token "if" *> token "(" *> expr <* token ")"
  >>= fun e ->
  block stmt_parser thread_number >>= fun block -> return @@ IF (e, block)

let if_else_stmt stmt_parser thread_number =
  cross_n_delims thread_number *> token "if" *> token "(" *> expr <* token ")"
  >>= fun e ->
  block stmt_parser thread_number >>= fun bk1 ->
  cross_n_delims thread_number
  *> token "else"
  *> block stmt_parser thread_number
  >>= fun bk2 -> return @@ IF_ELSE (e, bk1, bk2)

let no_op thread_num =
  cross_n_delims thread_num *> token "no_op" *> end_of_instr >>= fun _ ->
  return NO_OP

let stmt thread_number =
  fix (fun stmt ->
      if_else_stmt stmt thread_number
      <|> if_stmt stmt thread_number
      <|> while_stmt stmt thread_number
      <|> assignment thread_number <|> assert_stmt thread_number
      <|> mem_barrier thread_number <|> no_op thread_number)

let thread n = many (stmt n) >>= fun stmts -> return @@ THREAD (n, stmts)

let parse_prog s =
  let n = get_threads_number s in
  let nums = List.init n (fun x -> x) in
  let parse_thread k = parse (thread k) s in
  let results = List.map parse_thread nums in
  let oks = List.map Result.get_ok results in
  PROG oks

let set v' n = List.mapi (fun i v -> if i = n then v' else v)

let ( >>= ) = Result.bind

let ( >>== ) xs f = List.concat (List.map f xs)

let return = Result.ok

let error = Result.error

type memory = (string * int) list [@@deriving show { with_path = false }]

type mesi_state = Modified | Exclusive | Shared | Invalidated
[@@deriving show { with_path = false }]

type mesi_msg =
  | ReadRq of (string * int)
  | ReadResponse of (string * int option * mesi_state option)
  | Invalidate of (string * int)
  | InvalidateAcknowledge of (string * int)
[@@deriving show { with_path = false }]

type store_op = { name : string; value : int }
[@@deriving show { with_path = false }]

type invalidation = { target : string } [@@deriving show { with_path = false }]

type pending_load = { is_pending : bool; v_name : string }
[@@deriving show { with_path = false }]

type cache_line = { name : string; value : int; mesi_state : mesi_state }
[@@deriving show { with_path = false }]

type cache = cache_line list [@@deriving show { with_path = false }]

type read_rq = { target : string; is_obtained : bool; responses : int }
[@@deriving show { with_path = false }]

type inv_rq = { target : string; responses : int }
[@@deriving show { with_path = false }]

type thread_stat = {
  stmts : stmt list;
  counters : int list;
  length : int;
  number : int;
  branch_exprs : int list;
  last_eval_res : int;
  cache : cache;
  registers : memory;
  cache_request_queue : mesi_msg list;
  cache_ack_queue : mesi_msg list;
  st_buf : store_op list;
  inv_q : invalidation list;
  pending_load : pending_load;
  read_rq_tbl : read_rq list;
  inv_rq_tbl : inv_rq list;
  is_waiting_on_wmb : bool;
  loaded : int option;
  st_buf_is_flushed : bool;
}
[@@deriving show { with_path = false }]

(* type step = int * stmt [@@deriving show { with_path = false }] *)
type step' = INSTR of stmt | CACHE_PROC of mesi_msg
[@@deriving show { with_path = false }]

type step = int * step' [@@deriving show { with_path = false }]

type prog_stat = {
  threads : thread_stat list;
  ram : memory;
  trace : step list;
  depth : int;
}
[@@deriving show { with_path = false }]

let print_t_stat_briefly t_stat =
  print_endline ("thread " ^ string_of_int t_stat.number);
  print_endline "registers:";
  print_endline (show_memory t_stat.registers);
  print_endline "cache:";
  print_endline (show_cache t_stat.cache)

let print_p_stat_briefly p_stat =
  List.iter print_t_stat_briefly p_stat.threads;
  print_endline "RAM:";
  print_endline (show_memory p_stat.ram);
  print_endline "trace:";
  List.iter (fun step -> print_endline ("\t" ^ show_step step)) p_stat.trace;
  print_endline ("depth = " ^ string_of_int p_stat.depth)

let get_thread p_stat n =
  let rec helper t_stats =
    match t_stats with
    | [] -> error ("program doesn't have thread with num " ^ string_of_int n)
    | t_stat :: tl -> if t_stat.number = n then return t_stat else helper tl
  in
  helper p_stat.threads

let buffer_invalidation p_stat n (inv : invalidation) =
  get_thread p_stat n >>= fun thread ->
  let inv_q = thread.inv_q @ [ inv ] in
  let thread = { thread with inv_q } in
  let threads = set thread n p_stat.threads in
  return { p_stat with threads }

let buffer_store p_stat n (store : store_op) =
  get_thread p_stat n >>= fun thread ->
  let st_buf = thread.st_buf @ [ store ] in
  let thread = { thread with st_buf; st_buf_is_flushed = false } in
  let threads = set thread n p_stat.threads in
  return { p_stat with threads }

let await_pending_load_in_thread n p_stat v_name =
  let helper t_stat =
    match t_stat.pending_load.is_pending with
    | true -> t_stat
    | false -> { t_stat with pending_load = { is_pending = true; v_name } }
  in
  get_thread p_stat n >>= fun thread ->
  let thread = helper thread in
  let threads = set thread n p_stat.threads in
  return { p_stat with threads }

let finish_pending_load_in_thread n p_stat =
  let helper t_stat =
    match t_stat.pending_load.is_pending with
    | true -> { t_stat with pending_load = { is_pending = false; v_name = "" } }
    | false -> t_stat
  in
  get_thread p_stat n >>= fun thread ->
  let thread = helper thread in
  let threads = set thread n p_stat.threads in
  return { p_stat with threads }

let rec find_cache_line cache name =
  match cache with
  | [] -> None
  | c_line :: tl ->
      if c_line.name = name then Some c_line else find_cache_line tl name

let get_pos_of_cache_line cache name =
  let rec helper cache name pos =
    match cache with
    | [] -> error "cache line is not in cache"
    | c_line :: tl ->
        if c_line.name = name then return pos else helper tl name (pos + 1)
  in
  helper cache name 0

let occurs_of_c_line cache name =
  let rec helper cache name num =
    match cache with
    | [] -> num
    | c_line :: tl ->
        if c_line.name = name then helper tl name (num + 1)
        else helper tl name num
  in
  helper cache name 0

let check_cache_hit (cache : cache) name =
  if occurs_of_c_line cache name > 1 then
    error "variable sits in several cache lines"
  else
    match find_cache_line cache name with
    | None -> return false
    | Some c_line ->
        if c_line.mesi_state = Invalidated then return false else return true

(* возвращаем новый кэш c инвалидированной линией *)
let invalidate_cache_line p_stat n name =
  get_thread p_stat n >>= fun thread ->
  check_cache_hit thread.cache name >>= fun is_hit ->
  if is_hit then
    match find_cache_line thread.cache name with
    | None -> error "have cache hit but didn't find var in cache"
    | Some c_line ->
        let c_line = { c_line with mesi_state = Invalidated } in
        get_pos_of_cache_line thread.cache name >>= fun pos ->
        let cache = set c_line pos thread.cache in
        let thread = { thread with cache } in
        let threads = set thread n p_stat.threads in
        return { p_stat with threads }
  else return p_stat

let change_mesi_state_of_cache_line p_stat n name mesi_state =
  get_thread p_stat n >>= fun thread ->
  match find_cache_line thread.cache name with
  | None ->
      error "tried to change mesi_state for cache line which is not in cache"
  | Some c_line ->
      let c_line = { c_line with mesi_state } in
      get_pos_of_cache_line thread.cache name >>= fun pos ->
      let cache = set c_line pos thread.cache in
      let thread = { thread with cache } in
      let threads = set thread n p_stat.threads in
      return { p_stat with threads }

let change_value_of_cache_line p_stat n name value =
  get_thread p_stat n >>= fun thread ->
  match find_cache_line thread.cache name with
  | None -> error "tried to change value of cache line which is not in cache"
  | Some c_line ->
      let c_line = { c_line with value } in
      get_pos_of_cache_line thread.cache name >>= fun pos ->
      let cache = set c_line pos thread.cache in
      let thread = { thread with cache } in
      let threads = set thread n p_stat.threads in
      return { p_stat with threads }

let remove list name =
  let rec helper list name acc =
    match list with
    | [] -> acc
    | h :: tl -> (
        match h with
        | v_name, _ ->
            if v_name = name then helper tl name acc
            else helper tl name (h :: acc))
  in
  helper list name []

let rec replace list name value =
  match
    List.find_opt (fun x -> match x with v_name, _ -> v_name = name) list
  with
  | None -> (name, value) :: list
  | Some x -> (
      match x with
      | v_name, _ ->
          let list = remove list v_name in
          (name, value) :: list)

let store_to_memory memory name value = replace memory name value

let write_back_to_ram_from_cache p_stat cache name =
  check_cache_hit cache name >>= fun is_hit ->
  match is_hit with
  | false ->
      error "tried to write back to ram the variable that is not in cache"
  | true -> (
      match find_cache_line cache name with
      | None -> error "cache hit but var not found"
      | Some c_line ->
          let ram = store_to_memory p_stat.ram name c_line.value in
          let p_stat = { p_stat with ram } in
          return p_stat)

let rec select_other_caches p_stat n =
  let rec helper t_stats acc =
    match t_stats with
    | [] -> acc
    | t_stat :: tl ->
        if t_stat.number = n then helper tl acc
        else helper tl (t_stat.cache :: acc)
  in
  helper p_stat.threads []

let send_inv_rq_to_thread n p_stat target sender_thread_num =
  get_thread p_stat n >>= fun dst_thread ->
  let cache_request_queue =
    dst_thread.cache_request_queue @ [ Invalidate (target, sender_thread_num) ]
  in
  let dst_thread = { dst_thread with cache_request_queue } in
  let threads = set dst_thread n p_stat.threads in
  return { p_stat with threads }

let send_read_rq_to_thread n p_stat target sender_thread_num =
  get_thread p_stat n >>= fun dst_thread ->
  let cache_request_queue =
    dst_thread.cache_request_queue @ [ ReadRq (target, sender_thread_num) ]
  in
  let dst_thread = { dst_thread with cache_request_queue } in
  let threads = set dst_thread n p_stat.threads in
  return { p_stat with threads }

let add_inv_ack_to_thread n p_stat target cur_t_num =
  get_thread p_stat n >>= fun dst_thread ->
  let cache_ack_queue =
    dst_thread.cache_ack_queue @ [ InvalidateAcknowledge (target, cur_t_num) ]
  in
  let dst_thread = { dst_thread with cache_ack_queue } in
  let threads = set dst_thread n p_stat.threads in
  return { p_stat with threads }

let send_read_response_to_thread n p_stat target value =
  get_thread p_stat n >>= fun dst_thread ->
  let cache_ack_queue =
    dst_thread.cache_ack_queue @ [ ReadResponse (target, value, None) ]
  in
  let dst_thread = { dst_thread with cache_ack_queue } in
  let threads = set dst_thread n p_stat.threads in
  return { p_stat with threads }

let add_invalidation_to_inv_q p_stat n target =
  get_thread p_stat n >>= fun thread ->
  let inv_q = thread.inv_q @ [ { target } ] in
  let thread = { thread with inv_q } in
  let threads = set thread n p_stat.threads in
  return { p_stat with threads }

let get_thread_number p_stat = List.length p_stat.threads

let send_invalidate_request p_stat target n =
  let num = get_thread_number p_stat in
  let rec helper p_stat i =
    if i < num then
      if i <> n then
        send_inv_rq_to_thread i p_stat target n >>= fun p_stat ->
        helper p_stat (i + 1)
      else helper p_stat (i + 1)
    else return p_stat
  in
  helper p_stat 0

let pop_cache_request_queue p_stat n =
  get_thread p_stat n >>= fun thread ->
  let cache_request_queue = List.tl thread.cache_request_queue in
  let thread = { thread with cache_request_queue } in
  let threads = set thread n p_stat.threads in
  return { p_stat with threads }

let pop_cache_ack_queue p_stat n =
  get_thread p_stat n >>= fun thread ->
  if List.length thread.cache_ack_queue = 0 then
    error "tried to pop empty cache_ack_queue"
  else
    let cache_ack_queue = List.tl thread.cache_ack_queue in
    let thread = { thread with cache_ack_queue } in
    let threads = set thread n p_stat.threads in
    return { p_stat with threads }

let pop_st_buf p_stat n =
  get_thread p_stat n >>= fun thread ->
  if List.length thread.st_buf = 0 then error "tried to pop empty st_buf"
  else
    let st_buf = List.tl thread.st_buf in
    let thread = { thread with st_buf } in
    let threads = set thread n p_stat.threads in
    return { p_stat with threads }

let speculativly_process_invalidate_request p_stat cur_thread_num =
  get_thread p_stat cur_thread_num >>= fun local_thread ->
  match List.nth_opt local_thread.cache_request_queue 0 with
  | None -> error "cache_request_queue is empty"
  | Some rq -> (
      pop_cache_request_queue p_stat cur_thread_num >>= fun p_stat ->
      match rq with
      | Invalidate (target, source_t_num) ->
          add_invalidation_to_inv_q p_stat cur_thread_num target
          >>= fun p_stat ->
          add_inv_ack_to_thread source_t_num p_stat target cur_thread_num
      | _ ->
          error
            "first element in cache_request_queue isn't an Invalidate request")

let send_read_request p_stat target n =
  let num = get_thread_number p_stat in
  let rec helper p_stat i =
    if i < num then
      if i <> n then
        send_read_rq_to_thread i p_stat target n >>= fun p_stat ->
        helper p_stat (i + 1)
      else helper p_stat (i + 1)
    else return p_stat
  in
  helper p_stat 0

let calc_entries_in_inv_q (inv_q : invalidation list) target =
  List.fold_left
    (fun accu (inv : invalidation) ->
      if inv.target = target then accu + 1 else accu)
    0 inv_q

let pop_inv_q p_stat n =
  get_thread p_stat n >>= fun t_stat ->
  let inv_q = List.tl t_stat.inv_q in
  let thread = { t_stat with inv_q } in
  let threads = set thread n p_stat.threads in
  return { p_stat with threads }

let rec process_inv_q p_stat n v_name =
  get_thread p_stat n >>= fun t_stat ->
  match calc_entries_in_inv_q t_stat.inv_q v_name with
  | 0 -> return p_stat
  | _ ->
      if List.length t_stat.inv_q = 0 then
        error "tried to process_inv_q when inv_q empty"
      else
        let invalidation = List.hd t_stat.inv_q in
        pop_inv_q p_stat n >>= fun p_stat ->
        invalidate_cache_line p_stat n invalidation.target >>= fun p_stat ->
        process_inv_q p_stat n v_name

let process_one_element_of_inv_q p_stat n =
  get_thread p_stat n >>= fun t_stat ->
  if List.length t_stat.inv_q <> 0 then
    let invalidation = List.hd t_stat.inv_q in
    pop_inv_q p_stat n >>= fun p_stat ->
    invalidate_cache_line p_stat n invalidation.target
  else return p_stat

let rec process_whole_inv_q p_stat n =
  get_thread p_stat n >>= fun t_stat ->
  match List.nth_opt t_stat.inv_q 0 with
  | None -> return p_stat
  | Some invalidation ->
      pop_inv_q p_stat n >>= fun p_stat ->
      invalidate_cache_line p_stat n invalidation.target >>= fun p_stat ->
      process_whole_inv_q p_stat n

let process_read_request p_stat cur_t_num =
  get_thread p_stat cur_t_num >>= fun local_thread ->
  match List.nth_opt local_thread.cache_request_queue 0 with
  | None -> error "no (read) requests to process"
  | Some request -> (
      pop_cache_request_queue p_stat cur_t_num >>= fun p_stat ->
      match request with
      | ReadRq (v_name, source_t_num) -> (
          process_inv_q p_stat cur_t_num v_name >>= fun p_stat ->
          check_cache_hit local_thread.cache v_name >>= fun is_hit ->
          match is_hit with
          | false ->
              send_read_response_to_thread source_t_num p_stat v_name None
              (* Queue.add
                   (ReadResponse (v_name, None, None))
                   requestor_thread.cache_ack_queue;
                 p_stat *)
          | true -> (
              match find_cache_line local_thread.cache v_name with
              | None -> error "  "
              | Some c_line -> (
                  match c_line.mesi_state with
                  | Exclusive ->
                      send_read_response_to_thread source_t_num p_stat v_name
                        (Some c_line.value)
                      >>= fun p_stat ->
                      change_mesi_state_of_cache_line p_stat cur_t_num v_name
                        Shared
                      (* Queue.add
                           (ReadResponse (v_name, Some c_line.value, Some Exclusive))
                           requestor_thread.cache_ack_queue;
                         change_mesi_state local_thread.cache v_name Shared;
                         p_stat *)
                  | Modified ->
                      write_back_to_ram_from_cache p_stat local_thread.cache
                        v_name
                      >>= fun p_stat ->
                      send_read_response_to_thread source_t_num p_stat v_name
                        (Some c_line.value)
                      >>= fun p_stat ->
                      change_mesi_state_of_cache_line p_stat cur_t_num v_name
                        Shared
                      (* change_mesi_state local_thread.cache v_name Shared; *)
                      (* Queue.add
                           (ReadResponse (v_name, Some c_line.value, Some Modified))
                           requestor_thread.cache_ack_queue;
                         p_stat *)
                  | Shared ->
                      send_read_response_to_thread source_t_num p_stat v_name
                        (Some c_line.value)
                      (* Queue.add
                           (ReadResponse (v_name, Some c_line.value, Some Shared))
                           requestor_thread.cache_ack_queue;
                         p_stat *)
                  | Invalidated ->
                      error
                        "cache hit for line in Invalidated state is an error")))
      | _ -> error "fst element in cache_request_queue isn't ReadRq")

let add_read_rq_to_read_rq_tbl p_stat n (read_rq : read_rq) =
  get_thread p_stat n >>= fun thread ->
  let read_rq_tbl = thread.read_rq_tbl @ [ read_rq ] in
  let thread = { thread with read_rq_tbl } in
  let threads = set thread n p_stat.threads in
  return { p_stat with threads }

let remove_read_rq_from_read_rq_tbl p_stat n v_name =
  get_thread p_stat n >>= fun thread ->
  let rec helper (read_rq_tbl : read_rq list) acc =
    match read_rq_tbl with
    | [] -> acc
    | read_rq :: tl ->
        if read_rq.target = v_name then helper tl acc
        else helper tl (acc @ [ read_rq ])
  in
  let read_rq_tbl = helper thread.read_rq_tbl [] in
  let thread = { thread with read_rq_tbl } in
  let threads = set thread n p_stat.threads in
  return { p_stat with threads }

let remove_inv_rq_from_read_rq_tbl p_stat n v_name =
  get_thread p_stat n >>= fun thread ->
  let rec helper (inv_rq_tbl : inv_rq list) acc =
    match inv_rq_tbl with
    | [] -> acc
    | inv_rq :: tl ->
        if inv_rq.target = v_name then helper tl acc
        else helper tl (acc @ [ inv_rq ])
  in
  let inv_rq_tbl = helper thread.inv_rq_tbl [] in
  let thread = { thread with inv_rq_tbl } in
  let threads = set thread n p_stat.threads in
  return { p_stat with threads }

let add_inv_rq_to_inv_rq_tbl p_stat n inv_rq =
  get_thread p_stat n >>= fun thread ->
  let inv_rq_tbl = thread.inv_rq_tbl @ [ inv_rq ] in
  let thread = { thread with inv_rq_tbl } in
  let threads = set thread n p_stat.threads in
  return { p_stat with threads }

let scan_read_rq_tbl p_stat n v_name =
  get_thread p_stat n >>= fun thread ->
  let rec helper read_rq_tbl =
    match read_rq_tbl with
    | [] -> None
    | (read_rq : read_rq) :: tl ->
        if read_rq.target = v_name then Some read_rq else helper tl
  in
  return (helper thread.read_rq_tbl)

let get_pos_of_read_rq p_stat n v_name =
  get_thread p_stat n >>= fun thread ->
  let rec helper read_rq_tbl pos =
    match read_rq_tbl with
    | [] -> pos
    | (read_rq : read_rq) :: tl ->
        if read_rq.target = v_name then pos else helper tl (pos + 1)
  in
  return (helper thread.read_rq_tbl 0)

let get_pos_of_inv_rq p_stat n v_name =
  get_thread p_stat n >>= fun thread ->
  let rec helper inv_rq_tbl pos =
    match inv_rq_tbl with
    | [] -> pos
    | (inv_rq : inv_rq) :: tl ->
        if inv_rq.target = v_name then pos else helper tl (pos + 1)
  in
  return (helper thread.inv_rq_tbl 0)

let replace_read_rq p_stat n pos (read_rq : read_rq) =
  get_thread p_stat n >>= fun thread ->
  let read_rq_tbl = set read_rq pos thread.read_rq_tbl in
  let thread = { thread with read_rq_tbl } in
  let threads = set thread n p_stat.threads in
  return { p_stat with threads }

let replace_inv_rq p_stat n pos (inv_rq : inv_rq) =
  get_thread p_stat n >>= fun thread ->
  let inv_rq_tbl = set inv_rq pos thread.inv_rq_tbl in
  let thread = { thread with inv_rq_tbl } in
  let threads = set thread n p_stat.threads in
  return { p_stat with threads }

let update_read_rq_in_read_rq_tbl p_stat n (read_rq' : read_rq) =
  scan_read_rq_tbl p_stat n read_rq'.target >>= fun read_rq_opt ->
  match read_rq_opt with
  | None -> add_read_rq_to_read_rq_tbl p_stat n read_rq'
  | Some read_rq ->
      get_pos_of_read_rq p_stat n read_rq.target >>= fun pos ->
      replace_read_rq p_stat n pos read_rq'

let scan_inv_rq_tbl p_stat n v_name =
  get_thread p_stat n >>= fun thread ->
  let rec helper inv_rq_tbl =
    match inv_rq_tbl with
    | [] -> None
    | (inv_rq : inv_rq) :: tl ->
        if inv_rq.target = v_name then Some inv_rq else helper tl
  in
  return (helper thread.inv_rq_tbl)

let issue_read_rq p_stat n v_name =
  scan_read_rq_tbl p_stat n v_name >>= fun read_rq_opt ->
  match read_rq_opt with
  | None ->
      add_read_rq_to_read_rq_tbl p_stat n
        { target = v_name; is_obtained = false; responses = 0 }
      >>= fun p_stat -> send_read_request p_stat v_name n
      (* значит запрос на чтении этой переменной уже послан, надо ожидать ответа других кэшей *)
  | Some _ -> return p_stat

let issue_inv_rq p_stat n v_name =
  scan_inv_rq_tbl p_stat n v_name >>= fun inv_rq_opt ->
  match inv_rq_opt with
  | None ->
      add_inv_rq_to_inv_rq_tbl p_stat n { target = v_name; responses = 0 }
      >>= fun p_stat -> send_invalidate_request p_stat v_name n
      (* запрос на инвалидацию этой переменной уже послан, надо ожидать ответа всех других кэшей *)
  | Some _ -> return p_stat

let rec find (list : (string * int) list) (var : string) =
  match list with
  | [] -> None
  | h :: tl -> (
      match h with
      | v_name, value -> if v_name = var then Some value else find tl var)

let add_entry_to_cache p_stat n name value =
  get_thread p_stat n >>= fun thread ->
  let cache = thread.cache in
  match find_cache_line cache name with
  | Some c_line -> (
      match c_line.mesi_state with
      | Invalidated ->
          get_pos_of_cache_line thread.cache name >>= fun pos ->
          let cache = set { name; value; mesi_state = Exclusive } pos cache in
          let thread = { thread with cache } in
          let threads = set thread n p_stat.threads in
          return { p_stat with threads }
      | _ -> error "tried to add cache line that was already in cache")
  | None ->
      let cache = cache @ [ { name; value; mesi_state = Exclusive } ] in
      let thread = { thread with cache } in
      let threads = set thread n p_stat.threads in
      return { p_stat with threads }

let store_to_cache p_stat n name value =
  get_thread p_stat n >>= fun local_thread ->
  let local_cache = local_thread.cache in

  process_inv_q p_stat n name >>= fun p_stat ->
  check_cache_hit local_cache name >>= fun is_hit ->
  match is_hit with
  | true -> (
      match find_cache_line local_cache name with
      | None -> error "cache hit but variable is absent in cache"
      | Some c_line -> (
          match c_line.mesi_state with
          | Modified ->
              change_value_of_cache_line p_stat n name value
              (* update_cache_line local_cache name value *)
          | Exclusive ->
              change_value_of_cache_line p_stat n name value >>= fun p_stat ->
              change_mesi_state_of_cache_line p_stat n name Modified
              (* update_cache_line local_cache name value; *)
              (* change_mesi_state local_cache name Modified *)
          | Shared ->
              (* помещаем запись в буфер_записей,
                 посылаем запрос на инвалидацию дригим кэшам *)
              buffer_store p_stat n { name; value } >>= fun p_stat ->
              issue_inv_rq p_stat n name
              (* send_invalidate_request p_stat n name *)
          | Invalidated ->
              error "store_to_cache: cache hit of line in Invalidated state"))
  | false ->
      (* можно ли помещать в буфер_записей запись в кэш-линию в состоянии Invalidated?  *)
      (* предположим, что это можно делать *)
      buffer_store p_stat n { name; value } >>= fun p_stat ->
      issue_read_rq p_stat n name >>= fun p_stat -> issue_inv_rq p_stat n name

let load_to_cache_from_ram p_stat n name =
  let init_var p_stat var =
    match find p_stat.ram var with
    | Some _ -> error ("variable @" ^ var ^ " already initialized")
    | None ->
        let ram = p_stat.ram @ [ (name, 0) ] in
        return { p_stat with ram }
  in
  match find p_stat.ram name with
  | Some value -> add_entry_to_cache p_stat n name value
  | None -> (
      init_var p_stat name >>= fun p_stat ->
      match find p_stat.ram name with
      | None -> error "var initialized but absent in ram"
      | Some value -> add_entry_to_cache p_stat n name value)

let calc_entries_in_store_buf name (st_buf : store_op list) =
  List.fold_left
    (fun accu (store_op : store_op) ->
      if store_op.name = name then accu + 1 else accu)
    0 st_buf

let calc_entries_in_inv_q name inv_q =
  List.fold_left
    (fun accu (inv : invalidation) ->
      if inv.target = name then accu + 1 else accu)
    0 inv_q

(* получить последнее значение записанное в переменную name и
   находящееся в буфере записи *)
let store_forwarding (name : string) (st_buf : store_op list) =
  let n = calc_entries_in_store_buf name st_buf in
  if n = 0 then None
  else
    let last_buffered_store_to_name_value =
      List.fold_left
        (fun accu (store_op : store_op) ->
          if store_op.name = name then store_op.value else accu)
        0 st_buf
    in
    Some last_buffered_store_to_name_value

let load_from_cache_opt p_stat n name =
  get_thread p_stat n >>= fun local_thread ->
  let local_cache = local_thread.cache in
  match store_forwarding name local_thread.st_buf with
  | Some v ->
      let thread = { local_thread with loaded = Some v } in
      let threads = set thread n p_stat.threads in
      return { p_stat with threads }
  | None -> (
      check_cache_hit local_cache name >>= fun is_hit ->
      match is_hit with
      | true -> (
          match find_cache_line local_cache name with
          | None -> error "pk0omo0"
          | Some c_line ->
              let thread = { local_thread with loaded = Some c_line.value } in
              let threads = set thread n p_stat.threads in
              return { p_stat with threads })
      | false ->
          (* send ReadRq to other caches and leave method
             (to await other caches or ram supply us with "cache line" (variable)) *)
          issue_read_rq p_stat n name >>= fun p_stat ->
          get_thread p_stat n >>= fun local_thread ->
          let local_thread = { local_thread with loaded = None } in
          let threads = set local_thread n p_stat.threads in
          return { p_stat with threads })

let eval_int c t_num p_stat =
  get_thread p_stat t_num >>= fun t_stat ->
  let t_stat' = { t_stat with last_eval_res = c } in
  return { p_stat with threads = set t_stat' t_num p_stat.threads }

let rec eval_expr n p_stat = function
  | INT value -> eval_int value n p_stat
  | VAR_NAME var -> (
      load_from_cache_opt p_stat n var >>= fun p_stat ->
      get_thread p_stat n >>= fun local_thread ->
      match local_thread.loaded with
      | Some value -> eval_int value n p_stat
      (* надо ожидать поступления значения из других кешей или основной памяти.
             Плюс надо факт такого ожидания отметить в p_stat или t_stat
             Когда данные придут, то передающий их кэш или основная память должны
             изменить значение флага pending_load на false *)
      | None -> await_pending_load_in_thread n p_stat var)
  | REGISTER r -> (
      get_thread p_stat n >>= fun thread ->
      match find thread.registers r with
      | None ->
          let registers = replace thread.registers r 0 in
          let thread = { thread with registers } in
          let threads = set thread n p_stat.threads in
          let p_stat = { p_stat with threads } in
          eval_int 0 n p_stat
      | Some value -> eval_int value n p_stat
      (* failwith "reads from registers not impl yet" *))
  | PLUS (l, r) -> (
      eval_expr n p_stat l >>= fun p_stat1 ->
      get_thread p_stat1 n >>= fun t_stat1 ->
      match t_stat1.pending_load.is_pending with
      | true -> return p_stat1
      | false -> (
          eval_expr n p_stat r >>= fun p_stat2 ->
          get_thread p_stat2 n >>= fun t_stat2 ->
          match t_stat2.pending_load.is_pending with
          | false ->
              eval_int (t_stat1.last_eval_res + t_stat2.last_eval_res) n p_stat2
          | true -> return p_stat2))
  | SUB (l, r) -> (
      eval_expr n p_stat l >>= fun p_stat1 ->
      get_thread p_stat1 n >>= fun t_stat1 ->
      match t_stat1.pending_load.is_pending with
      | true -> return p_stat1
      | false -> (
          eval_expr n p_stat r >>= fun p_stat2 ->
          get_thread p_stat2 n >>= fun t_stat2 ->
          match t_stat2.pending_load.is_pending with
          | false ->
              eval_int (t_stat1.last_eval_res - t_stat2.last_eval_res) n p_stat2
          | true -> return p_stat2))
  | MUL (l, r) -> (
      eval_expr n p_stat l >>= fun p_stat1 ->
      get_thread p_stat1 n >>= fun t_stat1 ->
      match t_stat1.pending_load.is_pending with
      | true -> return p_stat1
      | false -> (
          eval_expr n p_stat r >>= fun p_stat2 ->
          get_thread p_stat2 n >>= fun t_stat2 ->
          match t_stat2.pending_load.is_pending with
          | false ->
              eval_int (t_stat1.last_eval_res * t_stat2.last_eval_res) n p_stat2
          | true -> return p_stat2))
  | DIV (l, r) -> (
      eval_expr n p_stat l >>= fun p_stat1 ->
      get_thread p_stat1 n >>= fun t_stat1 ->
      match t_stat1.pending_load.is_pending with
      | true -> return p_stat1
      | false -> (
          eval_expr n p_stat r >>= fun p_stat2 ->
          get_thread p_stat2 n >>= fun t_stat2 ->
          match t_stat2.pending_load.is_pending with
          | false ->
              if t_stat2.last_eval_res = 0 then error "div by zero"
              else
                eval_int
                  (t_stat1.last_eval_res / t_stat2.last_eval_res)
                  n p_stat2
          | true -> return p_stat2))

let eval_assign n p_stat l r =
  eval_expr n p_stat r >>= fun p_stat ->
  get_thread p_stat n >>= fun t_stat ->
  if t_stat.pending_load.is_pending then return p_stat
  else
    match l with
    | VAR_NAME v ->
        store_to_cache p_stat n v t_stat.last_eval_res >>= fun p_stat ->
        return p_stat
    | REGISTER reg ->
        let registers = replace t_stat.registers reg t_stat.last_eval_res in
        let t_stat = { t_stat with registers } in
        let threads = set t_stat n p_stat.threads in
        return { p_stat with threads }
        (* failwith "assignment to register is not implemented" *)
        (* Hashtbl.replace ctx.regs reg value;
           p_stat *)
    | _ -> error "assignment allowed only to variable and register"

let init_thread_stat t =
  match t with
  | THREAD (n, stmt_list) ->
      {
        stmts = stmt_list;
        counters = [ 0 ];
        length = List.length stmt_list;
        number = n;
        branch_exprs = [];
        last_eval_res = 0;
        cache = [];
        registers = [];
        cache_request_queue = [];
        cache_ack_queue = [];
        st_buf = [];
        inv_q = [];
        pending_load = { is_pending = false; v_name = "" };
        read_rq_tbl = [];
        inv_rq_tbl = [];
        is_waiting_on_wmb = false;
        loaded = None;
        st_buf_is_flushed = true;
      }

let init_prog_stat p =
  let threads =
    match p with PROG threads -> List.map init_thread_stat threads
  in
  { threads; ram = []; trace = []; depth = 0 }

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
  return
    {
      p_stat with
      threads =
        List.mapi
          (fun i t_stat -> if i = n then enter_block t_stat v else t_stat)
          p_stat.threads;
    }

let get_stmt p_stat cur_t_num =
  get_thread p_stat cur_t_num >>= fun t_stat ->
  let rec helper stmts counts lvl =
    stmts >>= fun stmts ->
    match counts with
    | [ n ] -> return (List.nth stmts n)
    | n :: tl ->
        helper
          (match List.nth stmts n with
          | IF (_, stmt_list) ->
              if List.nth t_stat.branch_exprs lvl <> 0 then return stmt_list
              else error "try enter if-block when condition is false"
          | IF_ELSE (_, bk1, bk2) ->
              if List.nth t_stat.branch_exprs lvl <> 0 then return bk1
              else return bk2
          | WHILE (_, block) ->
              if List.nth t_stat.branch_exprs lvl <> 0 then return block
              else error "try enter while-loop when condition is false"
          | _ ->
              error
                ("this stmt is not compound: " ^ show_stmt (List.nth stmts n)))
          tl (lvl + 1)
    | _ -> error "invalid list of counters"
  in
  helper (return t_stat.stmts) t_stat.counters 0

let peek_while t_stat counters =
  let rec helper stmts counts lvl =
    stmts >>= fun stmts ->
    match counts with
    | [ n ] -> (
        let stmt = List.nth stmts n in
        match stmt with WHILE (_, _) -> return true | _ -> return false)
    | n :: tl ->
        helper
          (match List.nth stmts n with
          | IF (_, stmt_list) ->
              if List.nth t_stat.branch_exprs lvl <> 0 then return stmt_list
              else error "try enter if-block when condition is false"
          | IF_ELSE (_, bk1, bk2) ->
              if List.nth t_stat.branch_exprs lvl <> 0 then return bk1
              else return bk2
          | WHILE (_, bk) ->
              if List.nth t_stat.branch_exprs lvl <> 0 then return bk
              else error "try enter while-block when condition is false"
          | _ -> error "this stmt is not compound (peek_while")
          tl (lvl + 1)
    | _ -> error "invalid list of counters (counts)"
  in
  helper (return t_stat.stmts) counters 0

let check p_stat n =
  try match get_stmt p_stat n with _ -> true with Failure _ -> false

let reduce ls = ls |> List.rev |> List.tl |> List.rev

let thread_stat_inc t_stat = { t_stat with counters = inc_last t_stat.counters }

let prog_stat_inc p_stat n =
  let rec helper p_stat n =
    get_thread p_stat n >>= fun t_stat ->
    let t_stat' = thread_stat_inc t_stat in
    let threads' = set t_stat' n p_stat.threads in
    let p_stat' = { p_stat with threads = threads' } in
    if List.length t_stat'.counters = 1 || check p_stat' n then return p_stat'
    else
      (* leave block *)
      let t_stat2 =
        {
          t_stat' with
          counters = reduce t_stat'.counters;
          branch_exprs = reduce t_stat'.branch_exprs;
        }
      in
      let threads2 = set t_stat2 n p_stat'.threads in
      let p_stat2 = { p_stat' with threads = threads2 } in
      peek_while t_stat2 t_stat2.counters >>= fun is_peeked ->
      if is_peeked then return p_stat2 else helper p_stat2 n
  in
  helper p_stat n

let process_smp_wmb p_stat n =
  get_thread p_stat n >>= fun t_stat ->
  match t_stat.is_waiting_on_wmb with
  | false ->
      (* print_endline "init write mem bar"; *)
      let t_stat' = { t_stat with is_waiting_on_wmb = true } in
      let threads = set t_stat' n p_stat.threads in
      return { p_stat with threads }
  | true -> (
      match List.length t_stat.st_buf = 0 with
      | false ->
          (* error "write mem bar works not like i want"  *)
          return p_stat
      | true ->
          let t_stat' = { t_stat with is_waiting_on_wmb = false } in
          let threads = set t_stat' n p_stat.threads in
          let p_stat' = { p_stat with threads } in
          prog_stat_inc p_stat' n)

let update_trace p_stat n step' =
  let step = (n, step') in
  { p_stat with trace = p_stat.trace @ [ step ] }

let exec_single_stmt_in_thread n p_stat =
  (* print_endline @@ "exec_stmt in thread " ^ string_of_int n; *)
  get_stmt p_stat n >>= function
  | WHILE (e, _) -> (
      return (update_trace p_stat n (INSTR (WHILE (e, [])))) >>= fun p_stat ->
      eval_expr n p_stat e >>= fun p_stat' ->
      get_thread p_stat' n >>= fun t_stat' ->
      match t_stat'.pending_load.is_pending with
      | false ->
          if t_stat'.last_eval_res = 0 then prog_stat_inc p_stat' n
          else enter_block_in_thread n p_stat' t_stat'.last_eval_res
      | true -> return p_stat')
  | IF (e, _) -> (
      return (update_trace p_stat n (INSTR (IF (e, [])))) >>= fun p_stat ->
      eval_expr n p_stat e >>= fun p_stat' ->
      get_thread p_stat' n >>= fun t_stat' ->
      match t_stat'.pending_load.is_pending with
      | false ->
          if t_stat'.last_eval_res = 0 then prog_stat_inc p_stat' n
          else enter_block_in_thread n p_stat' t_stat'.last_eval_res
      | true -> return p_stat')
  | IF_ELSE (e, _, _) -> (
      return (update_trace p_stat n (INSTR (IF_ELSE (e, [], []))))
      >>= fun p_stat ->
      eval_expr n p_stat e >>= fun p_stat' ->
      get_thread p_stat' n >>= fun t_stat' ->
      match t_stat'.pending_load.is_pending with
      | false -> enter_block_in_thread n p_stat' t_stat'.last_eval_res
      | true -> return p_stat'
      (* enter_block_in_thread n p_stat (eval_expr n p_stat e) *))
  | NO_OP ->
      return (update_trace p_stat n (INSTR NO_OP)) >>= fun p_stat ->
      (* print_endline "no_op"; *)
      prog_stat_inc p_stat n
  | ASSIGN (l, r) -> (
      (* print_endline "assign"; *)
      return (update_trace p_stat n (INSTR (ASSIGN (l, r))))
      >>= fun p_stat ->
      eval_assign n p_stat l r >>= fun p_stat' ->
      get_thread p_stat' n >>= fun t_stat' ->
      match t_stat'.pending_load.is_pending with
      | true -> return p_stat'
      | false -> prog_stat_inc p_stat' n
      (* prog_stat_inc (eval_assign n p_stat l r) n *))
  | ASSERT e -> (
      return (update_trace p_stat n (INSTR (ASSERT e))) >>= fun p_stat ->
      eval_expr n p_stat e >>= fun p_stat' ->
      get_thread p_stat' n >>= fun t_stat' ->
      match t_stat'.pending_load.is_pending with
      | false ->
          if t_stat'.last_eval_res = 0 then error "assertation fails"
          else prog_stat_inc p_stat' n
      | true -> return p_stat')
  | SMP_RMB ->
      return (update_trace p_stat n (INSTR SMP_RMB)) >>= fun p_stat ->
      process_whole_inv_q p_stat n >>= fun p_stat -> prog_stat_inc p_stat n
  | SMP_WMB ->
      return (update_trace p_stat n (INSTR SMP_WMB)) >>= fun p_stat ->
      get_thread p_stat n >>= fun thread ->
      (* print_endline (string_of_int (List.length thread.st_buf)); *)
      process_smp_wmb p_stat n
  | SMP_MB -> (
      return (update_trace p_stat n (INSTR SMP_MB)) >>= fun p_stat ->
      get_thread p_stat n >>= fun t_stat ->
      match t_stat.is_waiting_on_wmb with
      | false ->
          let t_stat' = { t_stat with is_waiting_on_wmb = true } in
          let threads = set t_stat' n p_stat.threads in
          return { p_stat with threads }
      | true -> (
          match List.length t_stat.st_buf = 0 with
          | false ->
              (* error "works not like i want"  *)
              return p_stat
          | true ->
              let t_stat' = { t_stat with is_waiting_on_wmb = false } in
              process_whole_inv_q p_stat n >>= fun p_stat ->
              let threads = set t_stat' n p_stat.threads in
              let p_stat' = { p_stat with threads } in
              prog_stat_inc p_stat' n))

let thread_is_not_finished t_stat =
  if List.length t_stat.counters = 0 then failwith "bug"
  else if
    List.hd t_stat.counters < t_stat.length
    || List.length t_stat.cache_ack_queue <> 0
    || List.length t_stat.cache_request_queue <> 0
  then true
  else false

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

let process_rq_in_thread n p_stat =
  (* print_endline @@ "process_rq_in_thread " ^ string_of_int n; *)
  get_thread p_stat n >>= fun local_thread ->
  (* match Queue.peek_opt local_thread.cache_request_queue with *)
  match List.nth_opt local_thread.cache_request_queue 0 with
  | None ->
      (* error
         "tried to process requests when they don't exist" *)
      return p_stat
  | Some rq -> (
      match rq with
      | ReadRq (name, src) ->
          return (update_trace p_stat n (CACHE_PROC (ReadRq (name, src))))
          >>= fun p_stat -> process_read_request p_stat n
      | Invalidate (target, src) ->
          return (update_trace p_stat n (CACHE_PROC (ReadRq (target, src))))
          >>= fun p_stat -> speculativly_process_invalidate_request p_stat n
      | _ -> error "processing of this rq is not impl")

let process_read_resp_in_thread n p_stat v_name value =
  get_thread p_stat n >>= fun local_thread ->
  scan_read_rq_tbl p_stat n v_name >>= fun read_rq_opt ->
  match read_rq_opt with
  | None ->
      error
        ("thread that issued ReadRq must put in his read_rq_tbl pair of key = \
          v_name; value = (false, 0). v_name = " ^ v_name)
  | Some read_rq -> (
      if read_rq.is_obtained = false && read_rq.responses = 0 then
        (* это первый поступивший ответ на запрос чтения *)
        match value with
        | None ->
            update_read_rq_in_read_rq_tbl p_stat n
              { target = v_name; is_obtained = false; responses = 1 }
            (* Hashtbl.replace read_rq_tbl v_name (false, 1); *)
            (* p_stat *)
        | Some v ->
            (* add to our cache *)
            add_entry_to_cache p_stat n v_name v >>= fun p_stat ->
            (* так как значение получили от других кешей, то наша кэш линия
               должна быть в состоянии Shared *)
            change_mesi_state_of_cache_line p_stat n v_name Shared
            >>= fun p_stat ->
            update_read_rq_in_read_rq_tbl p_stat n
              { target = v_name; is_obtained = true; responses = 1 }
            >>= fun p_stat ->
            (* change_mesi_state local_thread.cache v_name Shared; *)
            (* Hashtbl.replace read_rq_tbl v_name (true, 1); *)
            if v_name = local_thread.pending_load.v_name then
              finish_pending_load_in_thread n p_stat
            else return p_stat
      else
        let cnt' = read_rq.responses + 1 in
        match read_rq.is_obtained with
        | true ->
            update_read_rq_in_read_rq_tbl p_stat n
              { target = v_name; is_obtained = true; responses = cnt' }
            (* Hashtbl.replace read_rq_tbl v_name (true, cnt');
               p_stat *)
        | false -> (
            match value with
            | None ->
                update_read_rq_in_read_rq_tbl p_stat n
                  { target = v_name; is_obtained = false; responses = cnt' }
                (* Hashtbl.replace read_rq_tbl v_name (false, cnt');
                   p_stat *)
            | Some v ->
                (* add to our cache *)
                add_entry_to_cache p_stat n v_name v >>= fun p_stat ->
                update_read_rq_in_read_rq_tbl p_stat n
                  { target = v_name; is_obtained = true; responses = cnt' }
                >>= fun p_stat ->
                (* add_entry_to_cache local_thread.cache v_name v;
                   Hashtbl.replace read_rq_tbl v_name (true, cnt'); *)
                if v_name = local_thread.pending_load.v_name then
                  finish_pending_load_in_thread n p_stat
                else return p_stat))

let process_inv_ack_in_thread n p_stat v_name =
  scan_inv_rq_tbl p_stat n v_name >>= fun inv_rq_opt ->
  match inv_rq_opt with
  | None -> error "invalidating thread must put inv_rq in his table"
  | Some inv_rq ->
      get_pos_of_inv_rq p_stat n inv_rq.target >>= fun pos ->
      replace_inv_rq p_stat n pos
        { target = v_name; responses = inv_rq.responses + 1 }

(* match Hashtbl.find_opt inv_rq_tbl v_name with
   | None -> add_inv_rq_to_inv_rq_tbl p_stat n {target = v_name; responses = 1}
     (* Hashtbl.add inv_rq_tbl v_name 1 *)
   | Some cnt -> Hashtbl.replace inv_rq_tbl v_name (cnt + 1) *)

let add_or_modify_cache_line p_stat n name value =
  get_thread p_stat n >>= fun thread ->
  match find_cache_line thread.cache name with
  | Some c_line ->
      get_pos_of_cache_line thread.cache name >>= fun pos ->
      let cache =
        set { c_line with mesi_state = Modified; value } pos thread.cache
      in
      let thread = { thread with cache } in
      let threads = set thread n p_stat.threads in
      return { p_stat with threads }
      (* Hashtbl.replace cache name { state = Modified; value } *)
  | None -> add_entry_to_cache p_stat n name value

(* Hashtbl.add cache name { state = Exclusive; value } *)
let process_ack_in_thread n p_stat =
  (* print_endline @@ "process_ack_in_thread " ^ string_of_int n; *)
  get_thread p_stat n >>= fun local_thread ->
  let num_of_caches = List.length p_stat.threads in
  (* match Queue.take_opt local_thread.cache_ack_queue with *)
  match List.nth_opt local_thread.cache_ack_queue 0 with
  | None ->
      (* error "tried to process acks when they don't exist"  *)
      return p_stat
  | Some ack -> (
      (* снимаем один элемент *)
      pop_cache_ack_queue p_stat n >>= fun p_stat ->
      match ack with
      | ReadResponse (v_name, value, responder_cache_state) -> (
          return
            (update_trace p_stat n
               (CACHE_PROC (ReadResponse (v_name, value, responder_cache_state))))
          >>= fun p_stat ->
          process_read_resp_in_thread n p_stat v_name value >>= fun p_stat ->
          scan_read_rq_tbl p_stat n v_name >>= fun read_rq_opt ->
          match read_rq_opt with
          | None -> error "mne tak kazetsya"
          | Some read_rq ->
              if read_rq.responses = num_of_caches - 1 then
                remove_read_rq_from_read_rq_tbl p_stat n v_name
                >>= fun p_stat ->
                if not read_rq.is_obtained then
                  load_to_cache_from_ram p_stat n v_name >>= fun p_stat ->
                  if v_name = local_thread.pending_load.v_name then
                    finish_pending_load_in_thread n p_stat
                  else return p_stat
                else return p_stat
              else return p_stat)
      | InvalidateAcknowledge (v_name, responder_t_num) -> (
          return
            (update_trace p_stat n
               (CACHE_PROC (InvalidateAcknowledge (v_name, responder_t_num))))
          >>= fun p_stat ->
          process_inv_ack_in_thread n p_stat v_name >>= fun p_stat ->
          scan_inv_rq_tbl p_stat n v_name >>= fun inv_rq_opt ->
          match inv_rq_opt with
          | None -> error "1234"
          | Some inv_rq ->
              let num_of_resps = inv_rq.responses in

              if num_of_resps = num_of_caches - 1 then
                remove_inv_rq_from_read_rq_tbl p_stat n v_name >>= fun p_stat ->
                (* move store from st_buf to cache; change cache line state *)
                match List.nth_opt local_thread.st_buf 0 with
                (* match Queue.peek_opt local_thread.st_buf with *)
                | None ->
                    error
                      "we received all inv_acks but there is no store in \
                       store_buffer"
                | Some store ->
                    if store.name = v_name then
                      add_or_modify_cache_line p_stat n v_name store.value
                      >>= fun p_stat ->
                      pop_st_buf p_stat n >>= fun p_stat ->
                      get_thread p_stat n >>= fun thread ->
                      let thread =
                        if List.length thread.st_buf = 0 then
                          { thread with st_buf_is_flushed = true }
                        else thread
                      in
                      let threads = set thread n p_stat.threads in
                      return { p_stat with threads }
                    else
                      error
                        ("we received all inv_acks but first entry in st_buf \
                          is a store to a location different from " ^ v_name)
              else return p_stat)
      | _ -> error "process_ack_in_thread: processing of this ack is not impl")

let rec insert_wmb_in_compound_stmt compound_stmt =
  match compound_stmt with
  | IF (e, stmt_list) -> IF (e, insert_wmb_before_assignments stmt_list)
  | IF_ELSE (e, stmts1, stmts2) ->
      IF_ELSE
        ( e,
          insert_wmb_before_assignments stmts1,
          insert_wmb_before_assignments stmts2 )
  | WHILE (e, stmt_list) -> WHILE (e, insert_wmb_before_assignments stmt_list)
  | _ -> failwith "not compound stmt"

and insert_wmb_before_assignments stmt_list =
  let rec helper stmts acc =
    match stmts with
    | [] -> acc
    | stmt :: tl when List.length acc > 0 -> (
        match stmt with
        | ASSIGN (_, _) -> helper tl (acc @ [ SMP_WMB; stmt ])
        | IF (_, _) | WHILE (_, _) | IF_ELSE (_, _, _) ->
            helper tl (acc @ [ insert_wmb_in_compound_stmt stmt ])
        | _ -> helper tl (acc @ [ stmt ]))
    | stmt :: tl -> (
        match stmt with
        | IF (_, _) | WHILE (_, _) | IF_ELSE (_, _, _) ->
            helper tl (acc @ [ insert_wmb_in_compound_stmt stmt ])
        | _ -> helper tl (acc @ [ stmt ]))
  in
  helper stmt_list []

let insert_wmb_to_thread_for_tso thread =
  match thread with
  | THREAD (n, stmt_list) -> THREAD (n, insert_wmb_before_assignments stmt_list)

let insert_wmb_to_prog_for_tso p =
  match p with
  | PROG thread_list ->
      let threads = List.map insert_wmb_to_thread_for_tso thread_list in
      PROG threads

let rec expr_has_loads_from_vars = function
  | INT _ -> false
  | VAR_NAME _ -> true
  | REGISTER _ -> false
  | PLUS (l, r) -> expr_has_loads_from_vars l || expr_has_loads_from_vars r
  | SUB (l, r) -> expr_has_loads_from_vars l || expr_has_loads_from_vars r
  | MUL (l, r) -> expr_has_loads_from_vars l || expr_has_loads_from_vars r
  | DIV (l, r) -> expr_has_loads_from_vars l || expr_has_loads_from_vars r

let rec insert_rmb_in_compound_stmt compound_stmt =
  match compound_stmt with
  | IF (e, stmt_list) -> IF (e, insert_rmb stmt_list)
  | IF_ELSE (e, stmts1, stmts2) ->
      IF_ELSE (e, insert_rmb stmts1, insert_rmb stmts2)
  | WHILE (e, stmt_list) -> WHILE (e, insert_rmb stmt_list)
  | _ -> failwith "not compound stmt"

and insert_rmb stmt_list =
  let rec helper stmts acc =
    match stmts with
    | [] -> acc
    | stmt :: tl when List.length acc > 0 -> (
        match stmt with
        | ASSERT _ -> helper tl (acc @ [ SMP_RMB; stmt ])
        | IF (_, _) | WHILE (_, _) | IF_ELSE (_, _, _) ->
            helper tl (acc @ [ SMP_RMB; insert_rmb_in_compound_stmt stmt ])
        | ASSIGN (_, r) -> (
            match expr_has_loads_from_vars r with
            | true -> helper tl (acc @ [ SMP_RMB; stmt ])
            | false -> helper tl (acc @ [ stmt ]))
        | _ -> helper tl (acc @ [ stmt ]))
    | stmt :: tl -> (
        match stmt with
        | IF (_, _) | WHILE (_, _) | IF_ELSE (_, _, _) ->
            helper tl (acc @ [ insert_rmb_in_compound_stmt stmt ])
        | _ -> helper tl (acc @ [ stmt ]))
  in
  helper stmt_list []

let insert_rmb_to_thread_for_tso thread =
  match thread with THREAD (n, stmt_list) -> THREAD (n, insert_rmb stmt_list)

let insert_rmb_to_prog_for_tso p =
  match p with
  | PROG thread_list ->
      let threads = List.map insert_rmb_to_thread_for_tso thread_list in
      PROG threads

let insert_barriers_for_tso p =
  p |> insert_rmb_to_prog_for_tso |> insert_wmb_to_prog_for_tso

let get_available_actions_for_thread p_stat n =
  let acc = [] in
  get_thread p_stat n >>= fun t_stat ->
  (if
   List.hd t_stat.counters < t_stat.length
   && (not t_stat.pending_load.is_pending)
   && not (t_stat.is_waiting_on_wmb && not t_stat.st_buf_is_flushed)
  then return (exec_single_stmt_in_thread :: acc)
  else return acc)
  >>= fun acc ->
  (if List.length t_stat.cache_ack_queue <> 0 then
   return (process_ack_in_thread :: acc)
  else return acc)
  >>= fun acc ->
  if List.length t_stat.cache_request_queue <> 0 then
    return (process_rq_in_thread :: acc)
  else return acc

let get_actions_for_thread p_stat n =
  let t_stat = List.nth p_stat.threads n in
  let acc = [] in
  let acc =
    if
      List.hd t_stat.counters < t_stat.length
      && (not t_stat.pending_load.is_pending)
      && not (t_stat.is_waiting_on_wmb && not t_stat.st_buf_is_flushed)
    then exec_single_stmt_in_thread :: acc
    else acc
  in
  let acc =
    if List.length t_stat.cache_ack_queue <> 0 then process_ack_in_thread :: acc
    else acc
  in
  let acc =
    if List.length t_stat.cache_request_queue <> 0 then
      process_rq_in_thread :: acc
    else acc
  in
  acc

let exec_stmt_and_process_cache p_stat n =
  get_thread p_stat n >>= fun t_stat ->
  if List.hd t_stat.counters < t_stat.length then
    exec_single_stmt_in_thread n p_stat >>= fun p_stat ->
    process_rq_in_thread n p_stat >>= fun p_stat ->
    process_ack_in_thread n p_stat >>= fun p_stat ->
    return { p_stat with depth = p_stat.depth + 1 }
  else
    process_rq_in_thread n p_stat >>= fun p_stat ->
    process_ack_in_thread n p_stat >>= fun p_stat ->
    return { p_stat with depth = p_stat.depth + 1 }

let exec_prog_in_tso p =
  let p = insert_barriers_for_tso p in
  let p_stat = init_prog_stat p in
  let rec helper p_stat =
    if prog_is_not_finished p_stat then
      let n = choose_not_finished_thread p_stat in

      (if Random.int 1000 = 0 then process_one_element_of_inv_q p_stat n
      else return p_stat)
      >>= fun p_stat ->
      (* exec_stmt_and_process_cache p_stat n >>= fun p_stat -> helper p_stat *)
      get_available_actions_for_thread p_stat n >>= fun actions ->
      let len = List.length actions in
      if len = 0 then helper p_stat
      else
        let f = List.nth actions (Random.int len) in
        f n p_stat >>= fun p_stat -> helper p_stat
    else return p_stat
  in
  let res_p_stat = helper p_stat in
  (* flush_all_caches res_p_stat; *)
  res_p_stat

let exec_next_action_in_thread p_stat n =
  let f_list = get_actions_for_thread p_stat n in
  let p_stats = List.map (fun f -> f n p_stat) f_list in
  p_stats

let exec_next_action p_stat =
  let max_depth = 9 in
  if p_stat.depth < max_depth then
    let p_stat = { p_stat with depth = p_stat.depth + 1 } in
    let len = get_thread_number p_stat in
    let nums = List.init len (fun i -> i) in
    let p_stats = nums >>== fun i -> exec_next_action_in_thread p_stat i in
    p_stats
  else [ error "execution is too long" ]

let not_finished_threads p_stat =
  let rec helper threads acc =
    match threads with
    | [] -> acc
    | thread :: tl ->
        if thread_is_not_finished thread then helper tl (thread.number :: acc)
        else helper tl acc
  in
  helper p_stat.threads []

let exec_next_instr p_stat =
  let max_depth = 16 in
  if p_stat.depth < max_depth then
    let p_stat = { p_stat with depth = p_stat.depth + 1 } in
    let nums = not_finished_threads p_stat in
    List.map (fun t_num -> exec_stmt_and_process_cache p_stat t_num) nums
  else [ error "execution is too long" ]

let exec_prog_in_tso_monad_list p =
  let p = insert_barriers_for_tso p in
  let p_stat = init_prog_stat p in
  let rec helper p_stats_results =
    if
      List.exists
        (fun p_stat_res ->
          match p_stat_res with
          | Error _ -> false
          | Ok p_stat -> prog_is_not_finished p_stat)
        p_stats_results
    then
      helper
        ( p_stats_results >>== fun p_stat_res ->
          match p_stat_res with
          | Error _ -> [ p_stat_res ]
          | Ok p_stat when prog_is_not_finished p_stat ->
              (* exec_next_action  *)
              exec_next_instr p_stat
          | Ok p_stat -> [ return p_stat ] )
    else p_stats_results
  in
  helper [ return p_stat ]

let show_executions p_stats_results =
  List.iteri
    (fun i p_stat_res ->
      print_endline ("\t" ^ "execution " ^ string_of_int (i + 1));
      match p_stat_res with
      | Error msg ->
          print_endline msg;
          print_endline "<><><><><><><><><><><><><><><><><><>"
      | Ok p_stat ->
          print_p_stat_briefly p_stat;
          (* let ram = show_ram p_stat.ram in
             let reg_sets =
               List.map (fun t -> show_regs t.registers) p_stat.threads
             in
             print_endline ("ram: " ^ ram);
             print_endline "regs:";
             List.iter (fun s -> print_endline ("\t" ^ s)) reg_sets;
             print_endline "trace:";
             show_trace p_stat; *)
          print_endline "<><><><><><><><><><><><><><><><><><>")
    p_stats_results
