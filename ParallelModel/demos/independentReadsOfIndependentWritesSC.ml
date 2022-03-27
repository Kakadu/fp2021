open Parallelmodel_lib.Ast
open Parallelmodel_lib.Parser
open Parallelmodel_lib.Interpret.SequentialConsistency

let p1 =
  parse_prog {|
x<-1   ||| y<-1
EAX<-x ||| EAX <-y 
EBX<-y ||| EBX <-x 
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
  r1 = 1 && r2 = 0 && r3 = 1 && r4 = 0

let executions = exec_prog_in_seq_cons_monad_list p1 max_depth

let () =
  show_execution_statistics executions check
    "fails Independent Reads of Independent Writes litmus test"

let () = show_executions executions
