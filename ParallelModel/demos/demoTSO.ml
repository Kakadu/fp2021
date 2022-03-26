open Parallelmodel_lib.Ast
open Parallelmodel_lib.Parser
open Parallelmodel_lib.Interpret.TSO

let s2 = {|
   x<-1   ||| y<-1
   EAX <- y ||| EBX <- x
   |}

let p = parse_prog s2

let max_depth = 20

let () = try_all_executions p max_depth prepare_for_test2 both_regs_are_zero
