open Parallelmodel_lib.Ast
open Parallelmodel_lib.Parser
open Parallelmodel_lib.Interpret.TSO

let p1 =
  parse_prog {|
x<-1   ||| x<-2
EAX<-x ||| EAX <-x 
EBX<-x ||| EBX <-x 
|}

let max_depth = 15

let check p_stat =
  let r1 =
    snd
      (List.find
         (fun (s, _) -> s = "EAX")
         (List.nth p_stat.threads 0).registers)
  in
  let r3 =
    snd
      (List.find
         (fun (s, _) -> s = "EAX")
         (List.nth p_stat.threads 1).registers)
  in
  let r2 =
    snd
      (List.find
         (fun (s, _) -> s = "EBX")
         (List.nth p_stat.threads 0).registers)
  in
  let r4 =
    snd
      (List.find
         (fun (s, _) -> s = "EBX")
         (List.nth p_stat.threads 1).registers)
  in
  (r1 = 1 && r2 = 2 && r3 = 2 && r4 = 1)
  || (r1 = 2 && r2 = 1 && r3 = 1 && r4 = 2)

let executions = exec_prog_in_tso_monad_list p1 max_depth

let () =
  show_execution_statistics executions check
    "fails Coherence of Read-Read litmus test"

let () = show_executions executions
