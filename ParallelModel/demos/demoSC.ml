open Parallelmodel_lib.Ast
open Parallelmodel_lib.Parser
open Parallelmodel_lib.Interpret.SequentialConsistency

let p = parse_prog {|
 x <- 1     ||| y <- 1
 EAX <- y   ||| EBX <- x
|}

let () =
  let p_stat = exec_prog_in_cs p in
  let eax = Hashtbl.find (get_thread p_stat 0).registers "EAX" in
  let ebx = Hashtbl.find (get_thread p_stat 1).registers "EBX" in
  List.map string_of_int [ eax; ebx ] |> String.concat ", " |> print_string
