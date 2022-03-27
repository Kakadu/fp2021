open Parallelmodel_lib.Ast
open Parallelmodel_lib.Parser
open Parallelmodel_lib.Interpret.SequentialConsistency

let p1 = parse_prog {|
x<-1   ||| y<-1
r1<-y  ||| r2<-x
|}

let p2 = parse_prog {|
x<-1   ||| y<-1
smp_mb ||| smp_mb
r1<-y  ||| r2<-x
|}

let max_depth = 15

let check p_stat =
  let r1 =
    snd
      (List.find (fun (s, _) -> s = "r1") (List.nth p_stat.threads 0).registers)
  in
  let r2 =
    snd
      (List.find (fun (s, _) -> s = "r2") (List.nth p_stat.threads 1).registers)
  in
  r1 = 0 && r2 = 0

let executions = exec_prog_in_seq_cons_monad_list p1 max_depth

let executions2 = exec_prog_in_seq_cons_monad_list p2 max_depth

let () = print_endline "WITHOUT MEMORY BARRIER"

let () = show_execution_statistics executions check "r1 = 0 and r2 = 0"

let () = show_executions executions

let () = print_endline "WITH MEMORY BARRIER"

let () = show_execution_statistics executions2 check "r1 = 0 and r2 = 0"

let () = show_executions executions2
