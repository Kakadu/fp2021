open HaskellADT_lib.Interpreter
open HaskellADT_lib.Parser

(* let x = Var "a" *)
let () = print_endline "REPL not implemented"

let code = {|
let x = 2 + 5
let f x y = x + y
let p = f 5 10
let b = (True && (5 > 4))
let xs = [1,2,3,4]
let x = "Hello" <> "Hello"
|}

let funct code = 
  match run_interpret code with
  | Ok ok -> (Caml.Format.printf "%a\n" pp_interpret_ok ok) 
  | Error err -> (Caml.Format.printf "%a\n" pp_interpret_err err)
;;

(* let rez = funct code;; *)

(* parse_or_error {|let f x = case x of 0 -> True 
                                     1 -> False|} *)