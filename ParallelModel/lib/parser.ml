open Angstrom
open Ast

let splitter s = Str.split (Str.regexp "|||") (String.concat "" [ " "; s; " " ])

let split_on_parts s =
  let lines = String.split_on_char '\n' (String.trim s) in
  List.map splitter lines
;;

let get_threads_number s = split_on_parts s |> List.hd |> List.length
let trim_list list = List.map String.trim list

let empty_str_to_no_op list =
  List.map
    (fun s ->
      match s with
      | "" -> "no_op"
      | _ -> s)
    list
;;

let concat_list = String.concat " ||| "
let concat_lines = String.concat "\n"

let preprocess input =
  (split_on_parts input
  |> List.map trim_list
  |> List.map empty_str_to_no_op
  |> List.map concat_list
  |> String.concat "\n")
  ^ "\n"
;;

let reserved =
  [ "smp_rmb"; "smp_wmb"; "smp_mb"; "if"; "assert"; "while"; "else"; "no_op" ]
;;

let is_whitespace = function
  | ' ' | '\n' | '\r' | '\t' -> true
  | _ -> false
;;

let space =
  let is_space = function
    | ' ' | '\t' -> true
    | _ -> false
  in
  take_while is_space
;;

let is_end_of_line = function
  | '\n' | '\r' -> true
  | _ -> false
;;

let is_not_end_of_line c = not @@ is_end_of_line @@ c
let token s = space *> string s

let is_digit = function
  | '0' .. '9' -> true
  | _ -> false
;;

let parse p s = parse_string ~consume:All p (preprocess s)
let parse_unproc p s = parse_string ~consume:All p s
let skip_rest_of_line = take_while (fun c -> c <> '\n') *> string "\n"

let cross_thread_delim =
  take_till (function
      | '|' | '\n' | '\r' -> true
      | _ -> false)
  *> token "|||"
;;

let cross_n_delims n = count n cross_thread_delim

let number =
  let digits = space *> take_while1 is_digit in
  digits >>= fun s -> return @@ INT (int_of_string s)
;;

let addition =
  number >>= fun e1 -> token "+" *> number >>= fun e2 -> return @@ PLUS (e1, e2)
;;

let add = token "+" *> return (fun e1 e2 -> PLUS (e1, e2))
let sub = token "-" *> return (fun e1 e2 -> SUB (e1, e2))
let mul = token "*" *> return (fun e1 e2 -> MUL (e1, e2))
let div = token "/" *> return (fun e1 e2 -> DIV (e1, e2))

let is_big_letter = function
  | 'A' .. 'Z' -> true
  | _ -> false
;;

let registers = [ "EAX"; "EBX"; "r1"; "r2"; "r3"; "r4" ]
let is_register name = List.mem name registers

let reg =
  let is_allowed_var_name_char = function
    | 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' -> true
    | _ -> false
  in
  space *> take_while1 is_allowed_var_name_char
  >>= fun s ->
  match is_register s with
  | true -> return @@ REGISTER s
  | false -> fail "No register with such name"
;;

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
  space *> peek_char
  >>= function
  | Some c when is_allowed_fst_char c ->
    take_while is_allowed_var_name_char
    >>= fun var_name ->
    if is_allowed_var_name var_name
    then return @@ VAR_NAME var_name
    else fail "Variable's name is key word or register name"
  | _ -> fail "invalid variable name"
;;

let parens p = token "(" *> p <* token ")"

let chainl1 x op =
  let rec loop a = op >>= (fun f -> x >>= fun b -> loop (f a b)) <|> return a in
  x >>= loop
;;

let factop = mul <|> div <?> "'*' or '/' expected" <* space
let termop = add <|> sub <?> "'+' or '-' expected" <* space

let expr =
  fix (fun expr ->
      let value = choice [ number; reg; var_name ] in
      let parentheses =
        let helper =
          space *> peek_char_fail
          >>= function
          | '(' -> parens expr
          | _ -> value
        in
        choice [ helper; value ]
      in
      let term1 = chainl1 parentheses factop in
      let arexpr = chainl1 term1 termop in
      let newexpr = fix (fun newexpr -> arexpr <|> parens newexpr) in
      newexpr)
;;

let end_of_instr = choice [ token "\n"; token "|||" *> skip_rest_of_line ]

let mem_barrier thread_num =
  let smp_mb = token "smp_mb" *> return SMP_MB in
  cross_n_delims thread_num *> smp_mb <* end_of_instr
;;

let assignment thread_num =
  cross_n_delims thread_num *> (reg <|> var_name)
  >>= fun named_loc ->
  token "<-" *> expr <* end_of_instr >>= fun e -> return @@ ASSIGN (named_loc, e)
;;

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
         [ token "}"; skip_rest_of_line *> cross_n_delims thread_number *> token "}" ]
    *> end_of_instr
    *> return [ NO_OP ]
  in
  let correct_block =
    token "{" *> skip_rest_of_line *> many1 stmt_parser
    <* cross_n_delims thread_number
    <* token "}"
    <* end_of_instr
    >>= fun stmt_list -> return @@ stmt_list
  in
  choice [ correct_block; empty_block ]
;;

let if_stmt stmt_parser thread_number =
  cross_n_delims thread_number *> token "if" *> token "(" *> expr
  <* token ")"
  >>= fun e -> block stmt_parser thread_number >>= fun block -> return @@ IF (e, block)
;;

let if_else_stmt stmt_parser thread_number =
  cross_n_delims thread_number *> token "if" *> token "(" *> expr
  <* token ")"
  >>= fun e ->
  block stmt_parser thread_number
  >>= fun bk1 ->
  cross_n_delims thread_number *> token "else" *> block stmt_parser thread_number
  >>= fun bk2 -> return @@ IF_ELSE (e, bk1, bk2)
;;

let no_op thread_num =
  cross_n_delims thread_num *> token "no_op" *> end_of_instr >>= fun _ -> return NO_OP
;;

let stmt thread_number =
  fix (fun stmt ->
      if_else_stmt stmt thread_number
      <|> if_stmt stmt thread_number
      <|> assignment thread_number
      <|> mem_barrier thread_number
      <|> no_op thread_number)
;;

let thread n = many (stmt n) >>= fun stmts -> return @@ THREAD (n, stmts)

let parse_prog s =
  let n = get_threads_number s in
  let nums = List.init n (fun x -> x) in
  let parse_thread k = parse (thread k) s in
  let results = List.map parse_thread nums in
  let oks = List.map Result.get_ok results in
  PROG oks
;;
