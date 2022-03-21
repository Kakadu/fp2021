open Ast

module SequentialConsistency = struct
  type ram = (string, int) Hashtbl.t

  type regs = (string, int) Hashtbl.t

  type thread_stat = {
    stmts : stmt list;
    counters : int list;
    length : int;
    branch_exprs : int list;
    number : int;
    (* is_in_while : bool; *)
    registers : regs;
  }

  type prog_stat = { threads : thread_stat list; ram : ram }

  let set v' n = List.mapi (fun i v -> if i = n then v' else v)

  let print_ht =
    Hashtbl.iter (fun v_name value ->
        print_endline ("\t" ^ v_name ^ " = " ^ string_of_int value))

  let get_thread p_stat n =
    let rec helper t_stats =
      match t_stats with
      | [] ->
          failwith ("program doesn't have thread with num " ^ string_of_int n)
      | t_stat :: tl -> if t_stat.number = n then t_stat else helper tl
    in
    helper p_stat.threads

  let init_var memory var =
    match Hashtbl.find_opt memory var with
    | Some _ -> failwith ("variable @" ^ var ^ " already initialized")
    | None -> Hashtbl.add memory var 0

  let load_from_ram p_stat var =
    match Hashtbl.find_opt p_stat.ram var with
    | Some value -> value
    | None ->
        (* Вернуть ноль *)
        init_var p_stat.ram var;
        Hashtbl.find p_stat.ram var

  let store_to_var ram v_name value = Hashtbl.replace ram v_name value

  let store_to_reg regs r_name value = Hashtbl.replace regs r_name value

  let load_from_regs p_stat n r_name =
    let regs = (get_thread p_stat n).registers in
    match Hashtbl.find_opt regs r_name with
    | None ->
        Hashtbl.add regs r_name 0;
        0
    | Some v -> v

  (* n - is a thread number where expression is evaluated *)
  let rec eval_expr n p_stat = function
    | INT c -> c
    | VAR_NAME var -> load_from_ram p_stat var
    | REGISTER r_name -> load_from_regs p_stat n r_name
    | PLUS (l, r) -> eval_expr n p_stat l + eval_expr n p_stat r
    | SUB (l, r) -> eval_expr n p_stat l - eval_expr n p_stat r
    | MUL (l, r) -> eval_expr n p_stat l * eval_expr n p_stat r
    | DIV (l, r) ->
        let r_exp = eval_expr n p_stat r in
        if r_exp = 0 then failwith "div by zero"
        else eval_expr n p_stat l / r_exp

  let eval_assert n p_stat e =
    let value = eval_expr n p_stat e in
    if value = 0 then failwith "assertation fails (arg = 0)" else p_stat

  let eval_assign n p_stat l r =
    let value = eval_expr n p_stat r in
    match l with
    | VAR_NAME v_name ->
        store_to_var p_stat.ram v_name value;
        p_stat
    | REGISTER r_name ->
        let regs = (get_thread p_stat n).registers in
        store_to_reg regs r_name value;
        p_stat
    | _ -> failwith "assignment allowed only to variable and register"

  let print_t_stat t_stat =
    print_string ("thread " ^ string_of_int t_stat.number ^ ":\n");
    print_string "counters: ";
    List.iter (fun x -> print_string @@ string_of_int x ^ "; ") t_stat.counters;
    print_string "\n";
    print_ht t_stat.registers

  let print_p_stat p_stat =
    List.iter print_t_stat p_stat.threads;
    print_string "ram: ";
    print_ht p_stat.ram

  let init_thread_stat t =
    let t_info = match t with THREAD (n, stmt_list) -> (n, stmt_list) in
    {
      stmts = snd t_info;
      counters = [ 0 ];
      length = List.length (snd t_info);
      branch_exprs = [];
      number = fst t_info;
      (* is_in_while = false; *)
      registers = Hashtbl.create 4;
    }

  let init_prog_stat p =
    let t_stats =
      match p with PROG threads -> List.map init_thread_stat threads
    in
    { threads = t_stats; ram = Hashtbl.create 16 }

  let inc_last ls =
    let len = List.length ls in
    List.mapi (fun i x -> if i = len - 1 then x + 1 else x) ls

  let last ls = List.nth ls (List.length ls - 1)

  let enter_block t_stat v =
    {
      t_stat with
      counters = t_stat.counters @ [ 0 ];
      branch_exprs = t_stat.branch_exprs @ [ v ] (* is_in_while; *);
    }

  let enter_block_in_thread n p_stat v =
    {
      p_stat with
      threads =
        List.mapi
          (fun i t_stat -> if i = n then enter_block t_stat v else t_stat)
          p_stat.threads;
    }

  let get_stmt p_stat cur_t_num =
    let t_stat = List.nth p_stat.threads cur_t_num in
    let rec helper stmts counts lvl =
      match counts with
      | [ n ] -> List.nth stmts n
      | n :: tl ->
          helper
            (match List.nth stmts n with
            | IF (_, stmt_list) ->
                if List.nth t_stat.branch_exprs lvl <> 0 then stmt_list
                else failwith "try enter if-block when condition is false"
            | IF_ELSE (_, bk1, bk2) ->
                if List.nth t_stat.branch_exprs lvl <> 0 then bk1 else bk2
            | WHILE (_, block) ->
                if List.nth t_stat.branch_exprs lvl <> 0 then block
                else failwith "try enter while-loop when condition is false"
            | _ -> failwith "this stmt is not compound")
            tl (lvl + 1)
      | _ -> failwith "invalid list of counters (counts)"
    in
    helper t_stat.stmts t_stat.counters 0

  let peek_while t_stat counters =
    let rec helper stmts counts lvl =
      match counts with
      | [ n ] -> (
          let stmt = List.nth stmts n in
          match stmt with WHILE (_, _) -> true | _ -> false)
      | n :: tl ->
          helper
            (match List.nth stmts n with
            | IF (_, stmt_list) ->
                if List.nth t_stat.branch_exprs lvl <> 0 then stmt_list
                else failwith "try enter if-block when condition is false"
            | IF_ELSE (_, bk1, bk2) ->
                if List.nth t_stat.branch_exprs lvl <> 0 then bk1 else bk2
            | WHILE (_, bk) ->
                if List.nth t_stat.branch_exprs lvl <> 0 then bk
                else failwith "try enter while-block when condition is false"
            | _ -> failwith "this stmt is not compound (peek_while")
            tl (lvl + 1)
      | _ -> failwith "invalid list of counters (counts)"
    in
    helper t_stat.stmts counters 0

  let check p_stat n =
    try match get_stmt p_stat n with _ -> true with Failure _ -> false

  let reduce ls = ls |> List.rev |> List.tl |> List.rev

  let thread_stat_inc t_stat =
    { t_stat with counters = inc_last t_stat.counters }

  let prog_stat_inc p_stat n =
    let rec helper p_stat n =
      let t_stat = get_thread p_stat n in
      let t_stat' = thread_stat_inc t_stat in
      let threads' = set t_stat' n p_stat.threads in
      let p_stat' = { p_stat with threads = threads' } in
      if List.length t_stat'.counters = 1 || check p_stat' n then p_stat'
      else
        (* leave block *)
        let t_stat2 =
          {
            t_stat' with
            counters = reduce t_stat'.counters;
            branch_exprs = reduce t_stat'.branch_exprs;
          }
        in
        let threads2 = set t_stat2 n p_stat'.threads in
        let p_stat2 = { p_stat' with threads = threads2 } in
        if peek_while t_stat2 t_stat2.counters then p_stat2
        else helper p_stat2 n
    in
    helper p_stat n

  let exec_single_stmt_in_thread n p_stat =
    match get_stmt p_stat n with
    | WHILE (e, _) ->
        if eval_expr n p_stat e = 0 then prog_stat_inc p_stat n
        else enter_block_in_thread n p_stat (eval_expr n p_stat e)
    | IF (e, _) ->
        if eval_expr n p_stat e = 0 then
          (* skip full if-stmt *)
          prog_stat_inc p_stat n
        else
          (* enter if-block, save this fact in t_stat,  *)
          enter_block_in_thread n p_stat (eval_expr n p_stat e)
    | IF_ELSE (e, _, _) -> enter_block_in_thread n p_stat (eval_expr n p_stat e)
    | NO_OP -> prog_stat_inc p_stat n
    | ASSIGN (l, r) -> prog_stat_inc (eval_assign n p_stat l r) n
    | ASSERT e -> prog_stat_inc (eval_assert n p_stat e) n
    | SMP_RMB | SMP_WMB | SMP_MB -> prog_stat_inc p_stat n

  let thread_is_not_finished t_stat =
    if List.hd t_stat.counters < t_stat.length then true else false

  let prog_is_not_finished p_stat =
    List.exists
      (fun x -> x = true)
      (List.map thread_is_not_finished p_stat.threads)

  let choose_not_finished_thread p_stat =
    let len = List.length p_stat.threads in
    let rec helper p_stat n i =
      if List.nth p_stat.threads i |> thread_is_not_finished then i
      else helper p_stat n (Random.int len)
    in
    helper p_stat len (Random.int len)

  let exec_prog_in_cs p =
    let p_stat = init_prog_stat p in
    let rec helper p_stat =
      if prog_is_not_finished p_stat then
        helper
          (exec_single_stmt_in_thread
             (choose_not_finished_thread p_stat)
             p_stat)
      else p_stat
    in
    helper p_stat
end
