open Parallelmodel_lib.Ast
open Parallelmodel_lib.Parser
open Parallelmodel_lib.Interpret.COPYPASTE
open Parallelmodel_lib.Interpret.TSO

let s = {|
x<-1   ||| r1 <- x ||| r2 <- y
       ||| y <- r1 ||| r3 <- x
|}

let p1 = parse_prog s
let max_depth = 15

let check p_stat =
  let r2 = get_reg_val p_stat 2 "r2" in
  let r3 = get_reg_val p_stat 2 "r3" in
  r2 = 1 && r3 = 0
;;

let executions = exec_prog_in_tso_monad_list p1 max_depth

let () =
  show_execution_statistics executions check "fails Write-to-Read Causality litmus test" s
;;

let () = show_executions executions
