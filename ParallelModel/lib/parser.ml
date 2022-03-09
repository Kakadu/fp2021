open Angstrom
open Ast

let is_whitespace = function ' ' | '\n' | '\r' | '\t' -> true | _ -> false

(* string t - значит string parser. t это основной тип Angstrom *)
let whitespace = take_while is_whitespace

let is_end_of_line = function '\n' | '\r' -> true | _ -> false

let is_not_end_of_line c = not @@ is_end_of_line @@ c

let token s = whitespace *> string s

let is_digit = function '0' .. '9' -> true | _ -> false

let parse p s = parse_string ~consume:All p s

let jump_to_new_line = take_till is_end_of_line *> take_while is_end_of_line

let cross_thread_delim = take_till (fun c -> c = '|') *> token "|||"

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
      return @@ VAR_NAME var_name
  | _ -> fail "invalid variable name"

let left_of p1 p = p <* whitespace <* p1

let right_of p1 p = p1 *> whitespace *> p

let between p1 p2 p = left_of p2 (right_of p1 p)

let parens p = between (token "(") (token ")") p

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

(* let mem_barrier = token "smp_rmb" <|> token "smp_wmb" *)

let mem_barrier =
  let smp_rmb = token "smp_rmb" *> return SMP_RMB in
  let smp_wmb = token "smp_wmb" *> return SMP_WMB in
  let smp_mb = token "smp_mb" *> return SMP_MB in
  smp_rmb <|> smp_wmb <|> smp_mb

let assignment =
  reg <|> var_name >>= fun named_loc ->
  token "<-" *> expr >>= fun e -> return @@ ASSIGN (named_loc, e)

let del_space_newline =
  take_while (fun c -> is_whitespace c || is_end_of_line c)

let block stmt_parser =
  del_space_newline *> token "{"
  *> many1 (del_space_newline *> stmt_parser <* del_space_newline)
  <* token "}"
  >>= fun stmt_list -> del_space_newline *> (return @@ BLOCK stmt_list)

let if_stmt stmt_parser =
  token "if" *> token "(" *> expr <* token ")" >>= fun e ->
  block stmt_parser >>= fun block -> return @@ IF (e, block)

let stmt = fix (fun stmt -> if_stmt stmt <|> assignment <|> mem_barrier)

(* let thread = many stmt >>= fun stmts -> return @@ THREAD stmts *)

let thread id = 3

(* f : string -> string list
   split : string list -> string list list*)
(* let rec split list f = match list with h :: tl -> f h :: split tl f | _ -> []

   let splitter s = Str.split (Str.regexp "|||") (s ^ " ")

   let nth n list = List.nth list n

   let split_on_parts s =
     let lines = String.split_on_char '\n' (String.trim s) in
     split lines splitter

   let separate_thread n input =
     let lines = String.split_on_char '\n' (String.trim input) in
     let parts = split lines splitter in
     List.map (nth n) parts |> String.concat "\n" |> String.trim

   let get_code_of_thread n input =
     try separate_thread n input with Failure "nth" -> ""

   let thread_number s = split_on_parts s |> List.hd |> List.length *)
