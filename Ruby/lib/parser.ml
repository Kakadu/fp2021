open Ast
open Angstrom

(*          *)
(* Checkers *)
(*          *)

let is_reserved = function
  | "__ENCODING__" | "__LINE__" | "__FILE__" | "BEGIN" | "END" | "alias" | "and"
  | "begin" | "break" | "case" | "class" | "def" | "do" | "else" | "elsif"
  | "end" | "ensure" | "false" | "for" | "if" | "in" | "module" | "next" | "nil"
  | "not" | "return" | "self" | "super" | "or" | "then" | "true" | "undef"
  | "unless" | "until" | "when" | "while" | "yield" | "retry" | "redo"
  | "resque" | "lambda" ->
      true
  | _ -> false

let is_digit = function '0' .. '9' -> true | _ -> false
let is_sign = function '+' | '-' -> true | _ -> false
let is_point = function '.' -> true | _ -> false
let is_quote = function '\"' -> true | _ -> false
let is_whitespace = function ' ' | '\t' -> true | _ -> false
let is_eol = function '\r' | '\n' -> true | _ -> false

(*              *)
(* Parser parts *)
(*              *)

(* Number parser *)
let number_parser =
  let sign =
    peek_char >>= function
    | Some s when is_sign s -> advance 1 >>| fun () -> Char.escaped s
    | Some d when is_digit d -> return ""
    | _ -> fail "Error: sign or digit was expected"
  in

  let integer_part = take_while1 is_digit in

  let is_float =
    peek_char >>= function
    | Some p when is_point p -> advance 1 >>| fun () -> true
    | _ -> return false
  in

  take_while is_whitespace *> sign >>= fun sign ->
  integer_part >>= fun integer_part ->
  is_float >>= function
  | false -> return (Constant (Int (int_of_string (sign ^ integer_part))))
  | true ->
      take_while1 is_digit <* take_while is_whitespace
      >>= fun fractional_part ->
      return
        (Constant
           (Float
              (float_of_string (sign ^ integer_part ^ "." ^ fractional_part))))

(* String parser *)
let string_parser =
  let str = take_till is_quote >>= fun s -> return s in
  char '\"' *> str <* char '\"' >>= fun str -> return (Constant (String str))

(* Identifier parser *)
(* Something parser *)
(* Something parser *)
(* Something parser *)
(* Something parser *)
(* Something parser *)

(*        *)
(* Parser *)
(*        *)

(* parser goes here *)

(*       *)
(* Tests *)
(*       *)

let parse p s = parse_string ~consume:All p s

(* Number parser *)
let%test _ = parse number_parser "420" = Ok (Constant (Int 420))
let%test _ = parse number_parser "-420" = Ok (Constant (Int (-420)))
let%test _ = parse number_parser "420.69" = Ok (Constant (Float 420.69))
let%test _ = parse number_parser "-420.69" = Ok (Constant (Float (-420.69)))

(* String parser *)
let%test _ =
  parse string_parser "\"tasuketekudasai\""
  = Ok (Constant (String "tasuketekudasai"))

(* Something parser *)
(* Something parser *)
