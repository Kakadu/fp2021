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

let if_reserved identifier =
  match is_reserved identifier with
  | true -> fail "Error: using reserved words is prohibited"
  | false -> return identifier

let is_allowed_identifier_char = function
  | 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' -> true
  | _ -> false

let is_variable_first_char = function 'a' .. 'z' | '_' -> true | _ -> false
let is_class_first_char = function 'A' .. 'Z' | '_' -> true | _ -> false

(*                *)
(* Parser helpers *)
(*                *)

let token t = take_while is_whitespace *> t

let between p1 p2 p =
  p1 *> take_while is_whitespace *> p <* take_while is_whitespace <* p2

let take_from _ = function
  | "left" -> return fst
  | "right" -> return snd
  | _ -> fail "Error: unknown side"

let between_brackets brackets_type p =
  let brackets =
    match brackets_type with
    | "rb" -> return ("(", ")")
    | "sb" -> return ("[", "]")
    | "cb" -> return ("{", "}")
    | "vb" -> return ("|", "|")
    | _ ->
        fail
          "Error: only round, square or curly brackets OR vertical bars are \
           allowed"
  in
  return
    (* (take_from brackets "left" *> take_while is_whitespace *> p
       <* take_while is_whitespace <* take_from brackets "right") *)
    (((between (take_from brackets "left")) (take_from brackets "right")) p)

(*              *)
(* Parser parts *)
(*              *)

(* Number parser *)
let sign =
  peek_char >>= function
  | Some s when is_sign s -> take 1 >>= fun s -> return s
  | _ -> return String.empty

let integer_part = take_while1 is_digit

let is_float =
  peek_char >>= function
  | Some p when is_point p -> advance 1 >>| fun () -> true
  (* | Some p when is_point p -> return true *)
  | _ -> return false

let number_parser =
  take_while is_whitespace *> sign >>= function
  | sign -> (
      integer_part >>= function
      | integer_part -> (
          is_float >>= function
          | true -> (
              take_while1 is_digit <* take_while is_whitespace >>= function
              | fractional_part ->
                  return
                    (Constant
                       (Float
                          (float_of_string
                             (sign ^ integer_part ^ "." ^ fractional_part)))))
          | false ->
              return (Constant (Int (int_of_string (sign ^ integer_part))))))

(* String parser *)
let string_parser =
  char '\"' *> take_till is_quote <* char '\"' >>= function
  | str -> return (Constant (String str))

(* Identifiers parser *)
let identifier_parser allowed_first_char =
  take_while is_whitespace *> peek_char >>= function
  | Some c when allowed_first_char c -> (
      take_while is_allowed_identifier_char >>= function
      | identifier -> if_reserved identifier)
  | _ -> fail "Error: wrong identifier naming"

let variable_identifier_parser = identifier_parser is_variable_first_char
let method_identifier_parser = identifier_parser is_variable_first_char
let class_identifier_parser = identifier_parser is_class_first_char

(* Something parser *)
(* Something parser *)
(* Something parser *)
(* Something parser *)
(* Something parser *)

(*        *)
(* Parser *)
(*        *)

let parse p s = parse_string ~consume:All p s

(* Stand-alone parser goes here *)

(*       *)
(* Tests *)
(*       *)

(* Number parser *)
let%test _ = parse number_parser "420" = Ok (Constant (Int 420))
let%test _ = parse number_parser "-420" = Ok (Constant (Int (-420)))
let%test _ = parse number_parser "420.69" = Ok (Constant (Float 420.69))
let%test _ = parse number_parser "-420.69" = Ok (Constant (Float (-420.69)))

(* String parser *)
let%test _ =
  parse string_parser "\"tasuketekudasai\""
  = Ok (Constant (String "tasuketekudasai"))

(* Variables identifier parser *)
let%test _ = parse variable_identifier_parser "x" = Ok "x"

let%test _ =
  parse variable_identifier_parser "X"
  = Error ": Error: wrong identifier naming"

let%test _ =
  parse variable_identifier_parser "1"
  = Error ": Error: wrong identifier naming"

(* Methods identifier parser *)
let%test _ = parse method_identifier_parser "calc" = Ok "calc"

let%test _ =
  parse method_identifier_parser "Calc"
  = Error ": Error: wrong identifier naming"

(* Classes identifier parser *)
let%test _ = parse class_identifier_parser "Vehicle" = Ok "Vehicle"

let%test _ =
  parse class_identifier_parser "vehicle"
  = Error ": Error: wrong identifier naming"
