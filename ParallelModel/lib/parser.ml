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
  | IF of expr * stmt
  | IF_ELSE of expr * stmt * stmt
  | BLOCK of stmt list
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
  >>= fun stmt_list -> return @@ BLOCK stmt_list

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

type exec_ctx = {
  (* allocated : allocated; *)
  vars : vars;
  regs : vars;
  last_value : int; (* cur_t : types; *)
}

and allocated = (int * int) list

and vars = (string, int) Hashtbl.t

let print_ht =
  Hashtbl.iter (fun v_name value ->
      print_string (v_name ^ " = " ^ string_of_int value ^ "\t"))

let print_ctx ctx =
  print_string "vars: ";
  print_ht ctx.vars;
  print_string "\nregs: ";
  print_ht ctx.regs;
  print_string "\n"

let make_exec_ctx () =
  { vars = Hashtbl.create 16; regs = Hashtbl.create 4; last_value = 0 }

let rec eval_expr ctx = function
  | INT n -> n
  | VAR_NAME var -> (
      match Hashtbl.find_opt ctx.vars var with
      | Some value -> value
      | _ -> 0 (* failwith "read from not init variable" *))
  | REGISTER r -> (
      match Hashtbl.find_opt ctx.regs r with Some n -> n | _ -> 0)
  | PLUS (l, r) -> eval_expr ctx l + eval_expr ctx r
  | SUB (l, r) -> eval_expr ctx l - eval_expr ctx r
  | MUL (l, r) -> eval_expr ctx l * eval_expr ctx r
  | DIV (l, r) ->
      let rr = eval_expr ctx r in
      if rr = 0 then failwith "div by zero" else eval_expr ctx l / rr

let blk s = match s with BLOCK stmts -> stmts | _ -> failwith "not block"

let rec eval_stmt ctx = function
  | ASSIGN (l, r) -> eval_assign ctx l r
  | NO_OP -> ctx
  | IF (e, block) -> eval_if ctx e (blk block)
  | IF_ELSE (e, bk1, bk2) -> eval_if_else ctx e (blk bk1) (blk bk2)
  | _ -> failwith "mem barrier or block"

and eval_if_else ctx e block1 block2 =
  let cond = eval_expr ctx e in
  if cond <> 0 then eval_block ctx block1 else eval_block ctx block2

and eval_if ctx e block =
  let cond = eval_expr ctx e in
  if cond <> 0 then eval_block ctx block else ctx

and eval_block ctx block =
  match block with
  | [] -> ctx
  | stmtt :: tl -> eval_block (eval_stmt ctx stmtt) tl

and eval_assign ctx l r =
  let value = eval_expr ctx r in
  match l with
  | VAR_NAME v ->
      Hashtbl.replace ctx.vars v value;
      ctx
  | REGISTER reg ->
      Hashtbl.replace ctx.regs reg value;
      ctx
  | _ -> failwith "assignment allowed only to variable and register"

type thread_stat = { stmts : stmt list; counter : int; length : int }

type prog_stat = { threads : thread_stat list; ctx : exec_ctx }

let print_t_stat t_stat =
  print_string ("counter: " ^ string_of_int t_stat.counter ^ "\n")

let print_p_stat p_stat =
  List.iter print_t_stat p_stat.threads;
  print_ctx p_stat.ctx;
  print_string "\n"

let init_thread_stat t =
  let ls = match t with THREAD (_, list) -> list in
  { stmts = ls; counter = 0; length = List.length ls }

let init_prog_stat p =
  let t_stats =
    match p with PROG threads -> List.map init_thread_stat threads
  in
  { threads = t_stats; ctx = make_exec_ctx () }

let thread_stat_inc t_stat = { t_stat with counter = t_stat.counter + 1 }

let set v' n = List.mapi (fun i v -> if i = n then v' else v)

(* модифицировать п_стат после исполнения одного стейтмента в потоке н и получения в результате
   контекста ктх' *)
let prog_stat_inc p_stat n ctx' =
  {
    threads = set (thread_stat_inc (List.nth p_stat.threads n)) n p_stat.threads;
    ctx = ctx';
  }

let exec_single_stmt_in_thread n p_stat =
  let t_stat = List.nth p_stat.threads n in
  match List.nth_opt t_stat.stmts t_stat.counter with
  | None -> p_stat
  | Some stmtt -> eval_stmt p_stat.ctx stmtt |> prog_stat_inc p_stat n

let thread_is_not_finished t_stat =
  if t_stat.counter < t_stat.length then true else false

let prog_is_not_finished p_stat =
  List.exists
    (fun x -> x = true)
    (List.map thread_is_not_finished p_stat.threads)

let exec_thread t =
  let t_stat = init_thread_stat t in
  let ctx = make_exec_ctx () in
  let p_stat = { threads = [ t_stat ]; ctx } in
  let rec helper p_stat =
    if p_stat.threads |> List.hd |> thread_is_not_finished then
      helper (exec_single_stmt_in_thread 0 p_stat)
    else p_stat
  in
  helper p_stat

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
        (exec_single_stmt_in_thread (choose_not_finished_thread p_stat) p_stat)
    else p_stat
  in
  helper p_stat

let s =
  "x <- 1            ||| y <- 1\n\
  \  if (y) {          ||| if (x) {\n\
  \    EBX <- 50       |||   EAX <- 50\n\
  \  }                 ||| }\n\
  \  else {            ||| \n\
  \    EBX <- 10       ||| \n\
  \  }                 |||"

let p = prog s
