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

type thread = THREAD of stmt list

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

let thread n = many (stmt n) >>= fun stmts -> return @@ THREAD stmts

(* let prog =  *)
