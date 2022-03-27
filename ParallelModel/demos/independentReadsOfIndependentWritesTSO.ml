open Parallelmodel_lib.Parser
open Parallelmodel_lib.Interpret.TSO

(* Если брать тест, как он описан в магистрской работе Евгения Моисеенко, то в нем у меня
   существует некоторое количество поведений, которые мы запрещаем. Если же взять этот тест так, как
   он описан в "A better x86 memory model: x86-TSO (extended version)" https://www.cl.cam.ac.uk/techreports/UCAM-CL-TR-745.pdf
   то он у меня успешно проходит, т.е. недопустимых поведений нет *)
let p1_moiseenko_version =
  parse_prog {|
x<-1   ||| y<-1
r1<-x  ||| r3 <-y 
r2<-y  ||| r4 <-x 
|}

let p1_better_x86_mem_model_version =
  parse_prog
    {|
x<-1   ||| y<-1 ||| r1<-x  ||| r3 <-y 
       |||      ||| r2<-y  ||| r4 <-x 
|}

let max_depth = 15

let check_moiseenko_version p_stat =
  let r1 =
    snd
      (List.find (fun (s, _) -> s = "r1") (List.nth p_stat.threads 0).registers)
  in
  let r3 =
    snd
      (List.find (fun (s, _) -> s = "r3") (List.nth p_stat.threads 1).registers)
  in
  let r2 =
    snd
      (List.find (fun (s, _) -> s = "r2") (List.nth p_stat.threads 0).registers)
  in
  let r4 =
    snd
      (List.find (fun (s, _) -> s = "r4") (List.nth p_stat.threads 1).registers)
  in
  r1 = 1 && r2 = 0 && r3 = 1 && r4 = 0

let check_better_x86_ver p_stat =
  let r1 =
    snd
      (List.find (fun (s, _) -> s = "r1") (List.nth p_stat.threads 2).registers)
  in
  let r3 =
    snd
      (List.find (fun (s, _) -> s = "r3") (List.nth p_stat.threads 3).registers)
  in
  let r2 =
    snd
      (List.find (fun (s, _) -> s = "r2") (List.nth p_stat.threads 2).registers)
  in
  let r4 =
    snd
      (List.find (fun (s, _) -> s = "r4") (List.nth p_stat.threads 3).registers)
  in
  r1 = 1 && r2 = 0 && r3 = 1 && r4 = 0

let executions =
  exec_prog_in_tso_monad_list p1_better_x86_mem_model_version max_depth

let () =
  show_execution_statistics executions check_better_x86_ver
    "fails Independent Reads of Independent Writes litmus test"
(* печать всех трасс отключил, так как там порядка 100_000 исполнений и печатать их все очень долго *)
(* let () = show_executions executions *)
