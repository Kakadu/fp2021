open Parallelmodel_lib.Ast
open Parallelmodel_lib.Parser
open Parallelmodel_lib.Interpret.COPYPASTE
open Parallelmodel_lib.Interpret.SequentialConsistency

let s = {|
r1<-x  ||| r2<-y
y<-1   ||| x<-1
|}

let p1 = parse_prog s
let max_depth = 15

let check p_stat =
  let r1 = get_reg_val p_stat 0 "r1" in
  let r2 = get_reg_val p_stat 1 "r2" in
  r1 = 1 && r2 = 1
;;

let executions = exec_prog_in_seq_cons_monad_list p1 max_depth
let () = show_execution_statistics executions check "r1 = 1 and r2 = 1" s
let () = show_executions executions
