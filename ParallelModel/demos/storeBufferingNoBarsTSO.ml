open Parallelmodel_lib.Ast
open Parallelmodel_lib.Parser
open Parallelmodel_lib.Interpret.COPYPASTE
open Parallelmodel_lib.Interpret.TSO

let s1 = {|
x<-1   ||| y<-1
r1<-y  ||| r2<-x
|}

let p1 = parse_prog s1
let max_depth = 15

let check p_stat =
  let r1 = get_reg_val p_stat 0 "r1" in
  let r2 = get_reg_val p_stat 1 "r2" in
  r1 = 0 && r2 = 0
;;

let executions = exec_prog_in_tso_monad_list p1 max_depth
let () = show_execution_statistics executions check "r1 = 0 and r2 = 0" s1
let () = show_executions executions
