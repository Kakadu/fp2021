open Parallelmodel_lib.Ast
open Parallelmodel_lib.Parser
open Parallelmodel_lib.Interpret.SequentialConsistency

let p1 = parse_prog {|
 x <- 1     ||| y <- 1
 EAX <- y   ||| EBX <- x
|}

let () = exec_prog_in_seq_cons_monad_list p1 |> show_executions
