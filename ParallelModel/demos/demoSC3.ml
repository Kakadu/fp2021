open Parallelmodel_lib.Ast
open Parallelmodel_lib.Parser
open Parallelmodel_lib.Interpret.SequentialConsistency

let p3 =
  parse_prog
    {|
 data <- 1   ||| while (flag - 1) {}
 flag <- 1   ||| assert(data)
|}

let () = exec_prog_in_seq_cons_monad_list p3 |> show_executions
