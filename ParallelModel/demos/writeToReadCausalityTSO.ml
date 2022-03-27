open Parallelmodel_lib.Ast
open Parallelmodel_lib.Parser
open Parallelmodel_lib.Interpret.TSO

let p1 =
  parse_prog {|
x<-1   ||| r1 <- x ||| r2 <- y
       ||| y <- r1 ||| r3 <- x
|}

let max_depth = 15

let check p_stat =
  let r2 =
    snd
      (List.find (fun (s, _) -> s = "r2") (List.nth p_stat.threads 2).registers)
  in
  let r3 =
    snd
      (List.find (fun (s, _) -> s = "r3") (List.nth p_stat.threads 2).registers)
  in

  r2 = 1 && r3 = 0

let executions = exec_prog_in_tso_monad_list p1 max_depth

let () =
  show_execution_statistics executions check
    "fails Write-to-Read Causality litmus test"

let () = show_executions executions
