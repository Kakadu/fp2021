open Parallelmodel_lib.Ast
open Parallelmodel_lib.Parser
open Parallelmodel_lib.Interpret.COPYPASTE
open Parallelmodel_lib.Interpret.SequentialConsistency

let s =
  {|
x<-1          
if (x) {      
  r1<-1       
  if (y) {    
    r2<-2     
  }           
  else {      
    r3<-3     
  }           
  r4<-4       
}             
|}
;;

let p1 = parse_prog s
let max_depth = 15

let check p_stat =
  let r1 = get_reg_val p_stat 0 "r1" in
  let r3 = get_reg_val p_stat 0 "r3" in
  let r4 = get_reg_val p_stat 0 "r4" in
  r1 = 1 && r3 = 3 && r4 = 4
;;

let executions = exec_prog_in_seq_cons_monad_list p1 max_depth
let () = show_execution_statistics executions check "pass compound stmts test" s
let () = show_executions executions
