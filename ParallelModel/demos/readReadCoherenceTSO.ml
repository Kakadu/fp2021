open Parallelmodel_lib.Ast
open Parallelmodel_lib.Parser
open Parallelmodel_lib.Interpret.COPYPASTE
open Parallelmodel_lib.Interpret.TSO

let s = {|
x<-1  ||| x<-2
r1<-x ||| r3 <-x 
r2<-x ||| r4 <-x 
|}

let p1 = parse_prog s
let max_depth = 15

let check p_stat =
  let r1 = get_reg_val p_stat 0 "r1" in
  let r2 = get_reg_val p_stat 0 "r2" in
  let r3 = get_reg_val p_stat 1 "r3" in
  let r4 = get_reg_val p_stat 1 "r4" in
  (r1 = 1 && r2 = 2 && r3 = 2 && r4 = 1) || (r1 = 2 && r2 = 1 && r3 = 1 && r4 = 2)
;;

let executions = exec_prog_in_tso_monad_list p1 max_depth

let () =
  show_execution_statistics executions check "fails Coherence of Read-Read litmus test" s
;;

let () = show_executions executions
