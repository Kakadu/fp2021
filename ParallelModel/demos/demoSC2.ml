open Parallelmodel_lib.Ast
open Parallelmodel_lib.Parser
open Parallelmodel_lib.Interpret.SequentialConsistency

let p2 = parse_prog {|
 x <- 1      ||| y <- 1
 assert(y)   ||| assert(x)
|}

let () = exec_prog_in_seq_cons_monad_list p2 |> show_executions
