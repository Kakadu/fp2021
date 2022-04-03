open Parallelmodel_lib.Ast
open Parallelmodel_lib.Parser
open Parallelmodel_lib.Interpret.COPYPASTE
open Parallelmodel_lib.Interpret.SequentialConsistency

let s = {|
x<-1   ||| r1<-f
f<-1   ||| r2<-x
|}

let p1 = parse_prog s
let max_depth = 15

let check p_stat =
  let r1 = get_reg_val p_stat 1 "r1" in
  let r2 = get_reg_val p_stat 1 "r2" in
  r1 = 1 && r2 = 0
;;

let executions = exec_prog_in_seq_cons_monad_list p1 max_depth
let () = show_execution_statistics executions check "r1 = 1 and r2 = 0" s
let () = show_executions executions
