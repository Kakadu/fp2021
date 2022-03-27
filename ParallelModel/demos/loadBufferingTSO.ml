open Parallelmodel_lib.Ast
open Parallelmodel_lib.Parser
open Parallelmodel_lib.Interpret.TSO

let p1 = parse_prog {|
EAX<-x ||| EBX<-y
y<-1   ||| x<-1
|}

let max_depth = 15

let check p_stat =
  let eax =
    snd
      (List.find
         (fun (s, _) -> s = "EAX")
         (List.nth p_stat.threads 0).registers)
  in
  let ebx =
    snd
      (List.find
         (fun (s, _) -> s = "EBX")
         (List.nth p_stat.threads 1).registers)
  in
  eax = 1 && ebx = 1

let executions = exec_prog_in_tso_monad_list p1 max_depth

let () = show_execution_statistics executions check "EAX = 1 and EBX = 1"

let () = show_executions executions
