open Parallelmodel_lib.Parser
open Parallelmodel_lib.Interpret.COPYPASTE
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
;;

let s_better_x86 =
  {|
x<-1   ||| y<-1 ||| r1<-x  ||| r3 <-y 
       |||      ||| r2<-y  ||| r4 <-x 
|}
;;

let p1_better_x86_mem_model_version = parse_prog s_better_x86
let max_depth = 15

let check_moiseenko_version p_stat =
  let r1 = get_reg_val p_stat 0 "r1" in
  let r2 = get_reg_val p_stat 0 "r2" in
  let r3 = get_reg_val p_stat 1 "r3" in
  let r4 = get_reg_val p_stat 1 "r4" in
  r1 = 1 && r2 = 0 && r3 = 1 && r4 = 0
;;

let check_better_x86_ver p_stat =
  let r1 = get_reg_val p_stat 2 "r1" in
  let r2 = get_reg_val p_stat 2 "r2" in
  let r3 = get_reg_val p_stat 3 "r3" in
  let r4 = get_reg_val p_stat 3 "r4" in
  r1 = 1 && r2 = 0 && r3 = 1 && r4 = 0
;;

let executions = exec_prog_in_tso_monad_list p1_better_x86_mem_model_version max_depth

let () =
  show_execution_statistics
    executions
    check_better_x86_ver
    "fails Independent Reads of Independent Writes litmus test"
    s_better_x86
;;
(* печать всех трасс отключил, так как там порядка 100_000 исполнений и печатать их все очень долго *)
(* let () = show_executions executions *)
