open Parallelmodel_lib.Ast
open Parallelmodel_lib.Parser
open Parallelmodel_lib.Interpret.SequentialConsistency

let p1 = parse_prog {|
x<-1   ||| EAX<-f
f<-1   ||| EBX<-x
|}

let max_depth = 15

let check p_stat =
  let eax =
    snd
      (List.find
         (fun (s, _) -> s = "EAX")
         (List.nth p_stat.threads 1).registers)
  in
  let ebx =
    snd
      (List.find
         (fun (s, _) -> s = "EBX")
         (List.nth p_stat.threads 1).registers)
  in
  eax = 1 && ebx = 0

let executions = exec_prog_in_seq_cons_monad_list p1 max_depth

let () = show_execution_statistics executions check "EAX = 1 and EBX = 0"

let () = show_executions executions
