open Parallelmodel_lib.Ast
open Parallelmodel_lib.Parser

let p =
  prog
    {|
EAX <- 6                ||| x <- 1     ||| y <- 1
res <- 1                |||            |||
while (EAX) {           ||| EAX <- y   ||| EBX <- x
    res <- res * EAX    |||            |||
    EAX <- EAX - 1      |||            |||
}                       |||            |||
|}

let () = print_string (show_prog p)
