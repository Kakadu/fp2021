open Ast
open Angstrom

module SequentialConsistency = struct
  (* return для монады list *)
  let l_return x = [ x ]

  (* bind для монады list *)
  let ( >>== ) xs f = List.concat (List.map f xs)

  let ( >>= ) = Result.bind

  let return = Result.ok

  let error = Result.error

  (* type ram = (string, int) Hashtbl.t

     type regs = (string, int) Hashtbl.t *)

  type ram = (string * int) list [@@deriving show { with_path = false }]

  type regs = ram [@@deriving show { with_path = false }]

  type thread_stat = {
    stmts : stmt list;
    counters : int list;
    length : int;
    branch_exprs : int list;
    number : int;
    registers : regs;
  }
  [@@deriving show { with_path = false }]

  type step = int * stmt [@@deriving show { with_path = false }]

  type prog_stat = {
    threads : thread_stat list;
    ram : ram;
    trace : step list;
    loaded : int;
    depth : int;
  }
  [@@deriving show { with_path = false }]

  let show_trace p_stat =
    let trace = p_stat.trace in
    List.iter (fun step -> print_endline ("\t" ^ show_step step)) trace

  let set v' n = List.mapi (fun i v -> if i = n then v' else v)

  let print_ht =
    Hashtbl.iter (fun v_name value ->
        print_endline ("\t" ^ v_name ^ " = " ^ string_of_int value))

  let get_thread p_stat n =
    let rec helper t_stats =
      match t_stats with
      | [] -> error ("program doesn't have thread with num " ^ string_of_int n)
      | t_stat :: tl -> if t_stat.number = n then return t_stat else helper tl
    in
    helper p_stat.threads

  let rec find (list : (string * int) list) (var : string) =
    match list with
    | [] -> None
    | h :: tl -> (
        match h with
        | v_name, value -> if v_name = var then Some value else find tl var)

  let init_var p_stat var =
    match find p_stat.ram var with
    | Some _ -> error ("variable @" ^ var ^ " already initialized")
    | None -> return { p_stat with ram = (var, 0) :: p_stat.ram }

  let load_from_ram p_stat var =
    match find p_stat.ram var with
    | Some value -> return { p_stat with loaded = value }
    | None -> (
        (* p_stat updated so we need to return it *)
        init_var p_stat var
        >>= fun p_stat ->
        match find p_stat.ram var with
        | None ->
            error ("variable " ^ var ^ " was initialized but not found in ram")
        | Some value -> return { p_stat with loaded = value })

  let remove list name = List.filter (fun (v_name, _) -> v_name <> name) list

  let rec replace list name value =
    match
      List.find_opt (fun x -> match x with v_name, _ -> v_name = name) list
    with
    | None -> (name, value) :: list
    | Some x -> (
        match x with
        | v_name, _ ->
            let list = remove list v_name in
            (name, value) :: list)

  let store_to_var p_stat v_name value =
    let ram = replace p_stat.ram v_name value in
    return { p_stat with ram }

  let store_to_reg p_stat n r_name value =
    get_thread p_stat n >>= fun thread ->
    return (replace thread.registers r_name value) >>= fun regs ->
    return { thread with registers = regs } >>= fun thread ->
    return (set thread n p_stat.threads) >>= fun threads ->
    return { p_stat with threads }

  let add_to_regs p_stat n r_name value =
    get_thread p_stat n >>= fun t_stat ->
    return ((r_name, value) :: t_stat.registers) >>= fun regs ->
    return { t_stat with registers = regs } >>= fun t_stat ->
    return (set t_stat n p_stat.threads) >>= fun threads ->
    return { p_stat with threads }

  let load_from_regs p_stat n r_name =
    get_thread p_stat n >>= fun t_stat ->
    match find t_stat.registers r_name with
    | None ->
        add_to_regs p_stat n r_name 0 >>= fun p_stat ->
        return { p_stat with loaded = 0 }
    | Some v -> return { p_stat with loaded = v }

  (* n - is a thread number where expression is evaluated *)
  let rec eval_expr n p_stat = function
    | INT c -> return c
    | VAR_NAME var ->
        load_from_ram p_stat var >>= fun p_stat -> return p_stat.loaded
    | REGISTER r_name ->
        load_from_regs p_stat n r_name >>= fun p_stat -> return p_stat.loaded
    | PLUS (l, r) ->
        eval_expr n p_stat l >>= fun e1 ->
        eval_expr n p_stat r >>= fun e2 -> return (e1 + e2)
    | SUB (l, r) ->
        eval_expr n p_stat l >>= fun e1 ->
        eval_expr n p_stat r >>= fun e2 -> return (e1 - e2)
    | MUL (l, r) ->
        eval_expr n p_stat l >>= fun e1 ->
        eval_expr n p_stat r >>= fun e2 -> return (e1 * e2)
    | DIV (l, r) ->
        eval_expr n p_stat r >>= fun e2 ->
        if e2 = 0 then error "division by zero"
        else eval_expr n p_stat l >>= fun e1 -> return (e1 / e2)

  let eval_assert n p_stat e =
    eval_expr n p_stat e >>= fun value ->
    if value = 0 then error ("assertation failed: " ^ show_expr e)
    else return p_stat

  let eval_assign n p_stat l r =
    eval_expr n p_stat r >>= fun value ->
    match l with
    | VAR_NAME var ->
        store_to_var p_stat var value >>= fun p_stat -> return p_stat
    | REGISTER reg ->
        store_to_reg p_stat n reg value >>= fun p_stat -> return p_stat
    | _ -> error "assignment allowed only to variable and register"

  (* let print_t_stat t_stat =
       print_string ("thread " ^ string_of_int t_stat.number ^ ":\n");
       print_string "counters: ";
       List.iter (fun x -> print_string @@ string_of_int x ^ "; ") t_stat.counters;
       print_string "\n";
       print_ht t_stat.registers

     let print_p_stat p_stat =
       List.iter print_t_stat p_stat.threads;
       print_string "ram: ";
       print_ht p_stat.ram *)

  let init_thread_stat t =
    let t_info = match t with THREAD (n, stmt_list) -> (n, stmt_list) in
    {
      stmts = snd t_info;
      counters = [ 0 ];
      length = List.length (snd t_info);
      branch_exprs = [];
      number = fst t_info;
      registers = [];
    }

  let init_prog_stat p =
    let t_stats =
      match p with PROG threads -> List.map init_thread_stat threads
    in
    { threads = t_stats; ram = []; trace = []; loaded = 0; depth = 0 }

  let inc_last ls =
    let len = List.length ls in
    List.mapi (fun i x -> if i = len - 1 then x + 1 else x) ls

  let last ls = List.nth ls (List.length ls - 1)

  let enter_block t_stat v =
    {
      t_stat with
      counters = t_stat.counters @ [ 0 ];
      branch_exprs = t_stat.branch_exprs @ [ v ];
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
    get_thread p_stat cur_t_num >>= fun t_stat ->
    let rec helper stmts counts lvl =
      stmts >>= fun stmts ->
      match counts with
      | [ n ] -> return (List.nth stmts n)
      | n :: tl ->
          helper
            (match List.nth stmts n with
            | IF (_, stmt_list) ->
                if List.nth t_stat.branch_exprs lvl <> 0 then return stmt_list
                else error "try enter if-block when condition is false"
            | IF_ELSE (_, bk1, bk2) ->
                if List.nth t_stat.branch_exprs lvl <> 0 then return bk1
                else return bk2
            (* | WHILE (_, block) ->
                if List.nth t_stat.branch_exprs lvl <> 0 then return block
                else error "try enter while-loop when condition is false" *)
            | _ ->
                error
                  ("this stmt is not compound: " ^ show_stmt (List.nth stmts n)))
            tl (lvl + 1)
      | _ -> error "invalid list of counters"
    in
    helper (return t_stat.stmts) t_stat.counters 0

  (* let peek_while t_stat counters =
     let rec helper stmts counts lvl =
       stmts >>= fun stmts ->
       match counts with
       | [ n ] -> (
           let stmt = List.nth stmts n in
           match stmt with WHILE (_, _) -> return true | _ -> return false)
       | n :: tl ->
           helper
             (match List.nth stmts n with
             | IF (_, stmt_list) ->
                 if List.nth t_stat.branch_exprs lvl <> 0 then return stmt_list
                 else error "try enter if-block when condition is false"
             | IF_ELSE (_, bk1, bk2) ->
                 if List.nth t_stat.branch_exprs lvl <> 0 then return bk1
                 else return bk2
             | WHILE (_, bk) ->
                 if List.nth t_stat.branch_exprs lvl <> 0 then return bk
                 else error "try enter while-block when condition is false"
             | _ -> error "this stmt is not compound (peek_while")
             tl (lvl + 1)
       | _ -> error "invalid list of counters (counts)"
     in
     helper (return t_stat.stmts) counters 0 *)

  let check p_stat n =
    try match get_stmt p_stat n with _ -> true with Failure _ -> false

  let reduce ls = ls |> List.rev |> List.tl |> List.rev

  let thread_stat_inc t_stat =
    { t_stat with counters = inc_last t_stat.counters }

  let prog_stat_inc p_stat n =
    let rec helper p_stat n =
      get_thread p_stat n >>= fun t_stat ->
      let t_stat' = thread_stat_inc t_stat in
      let threads' = set t_stat' n p_stat.threads in
      let p_stat' = { p_stat with threads = threads' } in
      if List.length t_stat'.counters = 1 || check p_stat' n then return p_stat'
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
        (* peek_while t_stat2 t_stat2.counters >>= fun is_peeked ->
           if is_peeked then return p_stat2 else *)
        helper p_stat2 n
    in
    helper p_stat n

  let update_trace p_stat n stmt =
    let step = (n, stmt) in
    { p_stat with trace = p_stat.trace @ [ step ] }

  let exec_single_stmt_in_thread n p_stat =
    get_stmt p_stat n >>= function
    (* | WHILE (e, _) ->
        let p_stat = update_trace p_stat n (WHILE (e, [])) in
        eval_expr n p_stat e >>= fun e ->
        if e = 0 then prog_stat_inc p_stat n
        else return (enter_block_in_thread n p_stat e) *)
    | IF (e, _) ->
        let p_stat = update_trace p_stat n (IF (e, [])) in
        eval_expr n p_stat e >>= fun e ->
        if e = 0 then prog_stat_inc p_stat n
        else return (enter_block_in_thread n p_stat e)
    | IF_ELSE (e, _, _) ->
        let p_stat = update_trace p_stat n (IF_ELSE (e, [], [])) in
        eval_expr n p_stat e >>= fun e ->
        return @@ enter_block_in_thread n p_stat e
    | NO_OP ->
        let p_stat = update_trace p_stat n NO_OP in
        prog_stat_inc p_stat n
    | ASSIGN (l, r) ->
        let p_stat = update_trace p_stat n (ASSIGN (l, r)) in
        eval_assign n p_stat l r >>= fun p_stat -> prog_stat_inc p_stat n
    (* | ASSERT e ->
        let p_stat = update_trace p_stat n (ASSERT e) in
        eval_assert n p_stat e >>= fun p_stat -> prog_stat_inc p_stat n *)
    | SMP_MB ->
        let p_stat = update_trace p_stat n SMP_MB in
        prog_stat_inc p_stat n
  (* error "you can't use memory barriers in Sequential Consistency" *)

  let thread_is_not_finished t_stat =
    if List.hd t_stat.counters < t_stat.length then true else false

  let prog_is_not_finished p_stat =
    List.exists
      (fun x -> x = true)
      (List.map thread_is_not_finished p_stat.threads)

  (* let choose_not_finished_thread p_stat =
     let len = List.length p_stat.threads in
     let rec helper p_stat n i =
       if List.nth p_stat.threads i |> thread_is_not_finished then i
       else helper p_stat n (Random.int len)
     in
     helper p_stat len (Random.int len) *)

  (* let exec_prog_in_seq_cons p =
     let p_stat = init_prog_stat p in
     let rec helper p_stat =
       if prog_is_not_finished p_stat then
         exec_single_stmt_in_thread (choose_not_finished_thread p_stat) p_stat
         >>= fun p_stat -> helper p_stat
       else return p_stat
     in
     helper p_stat *)

  let not_finished_threads p_stat =
    let rec helper threads acc =
      match threads with
      | [] -> acc
      | thread :: tl ->
          if thread_is_not_finished thread then helper tl (thread.number :: acc)
          else helper tl acc
    in
    helper p_stat.threads []

  let exec_next_instr p_stat max_depth =
    if p_stat.depth < max_depth then
      let p_stat = { p_stat with depth = p_stat.depth + 1 } in
      let nums = not_finished_threads p_stat in
      List.map (fun t_num -> exec_single_stmt_in_thread t_num p_stat) nums
    else l_return (error "execution is too long")

  let show_executions p_stats_results =
    List.iteri
      (fun i p_stat_res ->
        print_endline ("\t" ^ "execution " ^ string_of_int (i + 1));
        match p_stat_res with
        | Error msg ->
            print_endline msg;
            print_endline "<><><><><><><><><><><><><><><><><><>"
        | Ok p_stat ->
            let ram = show_ram p_stat.ram in
            let reg_sets =
              List.map (fun t -> show_regs t.registers) p_stat.threads
            in
            print_endline ("ram: " ^ ram);
            print_endline "regs:";
            List.iter (fun s -> print_endline ("\t" ^ s)) reg_sets;
            print_endline "trace:";
            show_trace p_stat;
            print_endline "<><><><><><><><><><><><><><><><><><>")
      p_stats_results

  let show_execution_statistics results check_property descr code =
    print_endline "Code:";
    print_endline code;
    let rec helper results checker errors oks not_oks =
      if List.length results = 0 then [ errors; oks; not_oks ]
      else
        let res = List.hd results in
        match res with
        | Error _ -> helper (List.tl results) checker (errors + 1) oks not_oks
        | Ok p_stat ->
            if checker p_stat then
              helper (List.tl results) checker errors (oks + 1) not_oks
            else helper (List.tl results) checker errors oks (not_oks + 1)
    in
    let stats = helper results check_property 0 0 0 in
    print_endline "\tEXECUTION STATISTICS";
    let errors = List.nth stats 0 in
    print_endline (string_of_int errors ^ " executions crushed");
    let oks = List.nth stats 1 in
    print_endline
      (string_of_int oks ^ " executions finished and have following behavior: "
     ^ descr);
    let not_oks = List.nth stats 2 in
    print_endline
      (string_of_int not_oks
     ^ " executions finished but don't have following behavior: " ^ descr)

  let exec_prog_in_seq_cons_monad_list p max_depth =
    let p_stat = init_prog_stat p in
    let rec helper p_stats_results =
      if
        List.exists
          (fun p_stat_res ->
            match p_stat_res with
            | Error _ -> false
            | Ok p_stat -> prog_is_not_finished p_stat)
          p_stats_results
      then
        helper
          ( p_stats_results >>== fun p_stat_res ->
            match p_stat_res with
            | Error _ -> [ p_stat_res ]
            | Ok p_stat when prog_is_not_finished p_stat ->
                exec_next_instr p_stat max_depth
            | Ok p_stat -> [ return p_stat ] )
      else p_stats_results
    in
    helper [ return p_stat ]

  let get_reg_val p_stat n r_name =
    snd
      (List.find
         (fun (s, _) -> s = r_name)
         (List.nth p_stat.threads n).registers)
end

module TSO = struct
  (* return для монады list *)
  let l_return x = [ x ]

  (* bind для монады list *)
  let ( >>== ) xs f = List.concat (List.map f xs)

  let ( >>= ) = Result.bind

  let return = Result.ok

  let error = Result.error

  type memory = (string * int) list [@@deriving show { with_path = false }]

  type ram = memory [@@deriving show { with_path = false }]

  type regs = memory [@@deriving show { with_path = false }]

  type thread_stat = {
    stmts : stmt list;
    counters : int list;
    length : int;
    branch_exprs : int list;
    number : int;
    registers : regs;
    st_buf : memory;
  }
  [@@deriving show { with_path = false }]

  type step' =
    | STMT of stmt
    | PUSH_STORE of (string * int)
    | FENCE of (string * int) list
  [@@deriving show { with_path = false }]

  type step = int * step' [@@deriving show { with_path = false }]

  type prog_stat = {
    threads : thread_stat list;
    ram : ram;
    trace : step list;
    loaded : int;
    depth : int;
  }
  [@@deriving show { with_path = false }]

  let show_trace p_stat =
    let trace = p_stat.trace in
    List.iter (fun step -> print_endline ("\t" ^ show_step step)) trace

  let set v' n = List.mapi (fun i v -> if i = n then v' else v)

  let print_ht =
    Hashtbl.iter (fun v_name value ->
        print_endline ("\t" ^ v_name ^ " = " ^ string_of_int value))

  let get_thread p_stat n =
    let rec helper t_stats =
      match t_stats with
      | [] -> error ("program doesn't have thread with num " ^ string_of_int n)
      | t_stat :: tl -> if t_stat.number = n then return t_stat else helper tl
    in
    helper p_stat.threads

  let rec find (list : (string * int) list) (var : string) =
    match list with
    | [] -> None
    | h :: tl -> (
        match h with
        | v_name, value -> if v_name = var then Some value else find tl var)

  let init_var p_stat var =
    match find p_stat.ram var with
    | Some _ -> error ("variable @" ^ var ^ " already initialized")
    | None -> return { p_stat with ram = (var, 0) :: p_stat.ram }

  let load_from_ram p_stat var =
    match find p_stat.ram var with
    | Some value -> return { p_stat with loaded = value }
    | None -> (
        (* p_stat updated so we need to return it *)
        init_var p_stat var
        >>= fun p_stat ->
        match find p_stat.ram var with
        | None ->
            error ("variable " ^ var ^ " was initialized but not found in ram")
        | Some value -> return { p_stat with loaded = value })

  let remove list name =
    let rec helper list name acc =
      match list with
      | [] -> acc
      | h :: tl -> (
          match h with
          | v_name, _ ->
              if v_name = name then helper tl name acc
              else helper tl name (h :: acc))
    in
    helper list name []

  let rec replace list name value =
    match
      List.find_opt (fun x -> match x with v_name, _ -> v_name = name) list
    with
    | None -> (name, value) :: list
    | Some x -> (
        match x with
        | v_name, _ ->
            let list = remove list v_name in
            (name, value) :: list)

  let update_p_stat p_stat new_thread new_t_num =
    let threads = set new_thread new_t_num p_stat.threads in
    { p_stat with threads }

  let store_to_var p_stat n v_name value =
    (* let ram = replace p_stat.ram v_name value in
       return { p_stat with ram } *)
    get_thread p_stat n >>= fun t ->
    let st_buf = t.st_buf @ [ (v_name, value) ] in
    let t = { t with st_buf } in
    return (update_p_stat p_stat t n)

  let store_to_reg p_stat n r_name value =
    get_thread p_stat n >>= fun thread ->
    return (replace thread.registers r_name value) >>= fun regs ->
    return { thread with registers = regs } >>= fun thread ->
    return (set thread n p_stat.threads) >>= fun threads ->
    return { p_stat with threads }

  let add_to_regs p_stat n r_name value =
    get_thread p_stat n >>= fun t_stat ->
    return ((r_name, value) :: t_stat.registers) >>= fun regs ->
    return { t_stat with registers = regs } >>= fun t_stat ->
    return (set t_stat n p_stat.threads) >>= fun threads ->
    return { p_stat with threads }

  let load_from_regs p_stat n r_name =
    get_thread p_stat n >>= fun t_stat ->
    match find t_stat.registers r_name with
    | None ->
        add_to_regs p_stat n r_name 0 >>= fun p_stat ->
        return { p_stat with loaded = 0 }
    | Some v -> return { p_stat with loaded = v }

  let scan_store_buffer p_stat n var =
    get_thread p_stat n >>= fun thread ->
    match List.find_opt (fun (v_name, _) -> v_name = var) thread.st_buf with
    | None -> return None
    | Some (_, value) -> return (Some value)

  let load_var p_stat n var =
    scan_store_buffer p_stat n var >>= function
    | Some value -> return { p_stat with loaded = value }
    | None -> load_from_ram p_stat var

  (* n - is a thread number where expression is evaluated *)
  let rec eval_expr n p_stat = function
    | INT c -> return c
    | VAR_NAME var ->
        (* load_from_ram p_stat var  *)
        load_var p_stat n var >>= fun p_stat -> return p_stat.loaded
    | REGISTER r_name ->
        load_from_regs p_stat n r_name >>= fun p_stat -> return p_stat.loaded
    | PLUS (l, r) ->
        eval_expr n p_stat l >>= fun e1 ->
        eval_expr n p_stat r >>= fun e2 -> return (e1 + e2)
    | SUB (l, r) ->
        eval_expr n p_stat l >>= fun e1 ->
        eval_expr n p_stat r >>= fun e2 -> return (e1 - e2)
    | MUL (l, r) ->
        eval_expr n p_stat l >>= fun e1 ->
        eval_expr n p_stat r >>= fun e2 -> return (e1 * e2)
    | DIV (l, r) ->
        eval_expr n p_stat r >>= fun e2 ->
        if e2 = 0 then error "division by zero"
        else eval_expr n p_stat l >>= fun e1 -> return (e1 / e2)

  let eval_assert n p_stat e =
    eval_expr n p_stat e >>= fun value ->
    if value = 0 then error ("assertation failed: " ^ show_expr e)
    else return p_stat

  let eval_assign n p_stat l r =
    eval_expr n p_stat r >>= fun value ->
    match l with
    | VAR_NAME var -> store_to_var p_stat n var value
    | REGISTER reg ->
        store_to_reg p_stat n reg value >>= fun p_stat -> return p_stat
    | _ -> error "assignment allowed only to variable and register"

  (* let print_t_stat t_stat =
       print_string ("thread " ^ string_of_int t_stat.number ^ ":\n");
       print_string "counters: ";
       List.iter (fun x -> print_string @@ string_of_int x ^ "; ") t_stat.counters;
       print_string "\n";
       print_ht t_stat.registers

     let print_p_stat p_stat =
       List.iter print_t_stat p_stat.threads;
       print_string "ram: ";
       print_ht p_stat.ram *)

  let init_thread_stat t =
    let t_info = match t with THREAD (n, stmt_list) -> (n, stmt_list) in
    {
      stmts = snd t_info;
      counters = [ 0 ];
      length = List.length (snd t_info);
      branch_exprs = [];
      number = fst t_info;
      registers = [];
      st_buf = [];
    }

  let init_prog_stat p =
    let t_stats =
      match p with PROG threads -> List.map init_thread_stat threads
    in
    { threads = t_stats; ram = []; trace = []; loaded = 0; depth = 0 }

  let inc_last ls =
    let len = List.length ls in
    List.mapi (fun i x -> if i = len - 1 then x + 1 else x) ls

  let last ls = List.nth ls (List.length ls - 1)

  let enter_block t_stat v =
    {
      t_stat with
      counters = t_stat.counters @ [ 0 ];
      branch_exprs = t_stat.branch_exprs @ [ v ];
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
    get_thread p_stat cur_t_num >>= fun t_stat ->
    let rec helper stmts counts lvl =
      stmts >>= fun stmts ->
      match counts with
      | [ n ] -> return (List.nth stmts n)
      | n :: tl ->
          helper
            (match List.nth stmts n with
            | IF (_, stmt_list) ->
                if List.nth t_stat.branch_exprs lvl <> 0 then return stmt_list
                else error "try enter if-block when condition is false"
            | IF_ELSE (_, bk1, bk2) ->
                if List.nth t_stat.branch_exprs lvl <> 0 then return bk1
                else return bk2
            (* | WHILE (_, block) ->
                if List.nth t_stat.branch_exprs lvl <> 0 then return block
                else error "try enter while-loop when condition is false" *)
            | _ ->
                error
                  ("this stmt is not compound: " ^ show_stmt (List.nth stmts n)))
            tl (lvl + 1)
      | _ -> error "invalid list of counters"
    in
    helper (return t_stat.stmts) t_stat.counters 0

  (* let peek_while t_stat counters =
     let rec helper stmts counts lvl =
       stmts >>= fun stmts ->
       match counts with
       | [ n ] -> (
           let stmt = List.nth stmts n in
           match stmt with WHILE (_, _) -> return true | _ -> return false)
       | n :: tl ->
           helper
             (match List.nth stmts n with
             | IF (_, stmt_list) ->
                 if List.nth t_stat.branch_exprs lvl <> 0 then return stmt_list
                 else error "try enter if-block when condition is false"
             | IF_ELSE (_, bk1, bk2) ->
                 if List.nth t_stat.branch_exprs lvl <> 0 then return bk1
                 else return bk2
             | WHILE (_, bk) ->
                 if List.nth t_stat.branch_exprs lvl <> 0 then return bk
                 else error "try enter while-block when condition is false"
             | _ -> error "this stmt is not compound (peek_while")
             tl (lvl + 1)
       | _ -> error "invalid list of counters (counts)"
     in
     helper (return t_stat.stmts) counters 0 *)

  let check p_stat n =
    try match get_stmt p_stat n with _ -> true with Failure _ -> false

  let reduce ls = ls |> List.rev |> List.tl |> List.rev

  let thread_stat_inc t_stat =
    { t_stat with counters = inc_last t_stat.counters }

  let prog_stat_inc p_stat n =
    let rec helper p_stat n =
      get_thread p_stat n >>= fun t_stat ->
      let t_stat' = thread_stat_inc t_stat in
      let threads' = set t_stat' n p_stat.threads in
      let p_stat' = { p_stat with threads = threads' } in
      if List.length t_stat'.counters = 1 || check p_stat' n then return p_stat'
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
        (* peek_while t_stat2 t_stat2.counters >>= fun is_peeked ->
           if is_peeked then return p_stat2 else *)
        helper p_stat2 n
    in
    helper p_stat n

  let update_trace p_stat n step' =
    let step = (n, step') in
    { p_stat with trace = p_stat.trace @ [ step ] }

  let update_last_in_trace p_stat n step' =
    let step = (n, step') in
    { p_stat with trace = reduce p_stat.trace @ [ step ] }

  let push_store_to_ram p_stat n =
    get_thread p_stat n >>= fun t ->
    match List.nth_opt t.st_buf 0 with
    | None -> error "trying to pop store from empty st_buf"
    | Some (v_name, value) ->
        let p_stat = update_trace p_stat n (PUSH_STORE (v_name, value)) in
        (* remove store from buffer *)
        let st_buf = List.tl t.st_buf in
        let t = { t with st_buf } in
        let p_stat = update_p_stat p_stat t n in
        (* put store to ram *)
        let ram = replace p_stat.ram v_name value in
        return { p_stat with ram }

  let push_store_to_ram_trace_disabled p_stat n =
    get_thread p_stat n >>= fun t ->
    match List.nth_opt t.st_buf 0 with
    | None -> error "trying to pop store from empty st_buf"
    | Some (v_name, value) ->
        (* remove store from buffer *)
        let st_buf = List.tl t.st_buf in
        let t = { t with st_buf } in
        let p_stat = update_p_stat p_stat t n in
        (* put store to ram *)
        let ram = replace p_stat.ram v_name value in
        return { p_stat with ram }

  let st_buf_is_empty thread = List.length thread.st_buf = 0

  let rec flush_st_buf p_stat n =
    get_thread p_stat n >>= fun t ->
    if st_buf_is_empty t then return p_stat
    else
      push_store_to_ram_trace_disabled p_stat n >>= fun p_stat ->
      (* show_trace p_stat; *)
      let step = snd (last p_stat.trace) in
      let step =
        match step with
        | FENCE list ->
            let store = List.hd t.st_buf in
            list @ [ store ]
      in

      let p_stat = update_last_in_trace p_stat n (FENCE step) in

      flush_st_buf p_stat n

  let exec_single_stmt_in_thread n p_stat =
    get_stmt p_stat n >>= function
    (* | WHILE (e, _) ->
        let p_stat = update_trace p_stat n (STMT (WHILE (e, []))) in
        eval_expr n p_stat e >>= fun e ->
        if e = 0 then prog_stat_inc p_stat n
        else return (enter_block_in_thread n p_stat e) *)
    | IF (e, _) ->
        let p_stat = update_trace p_stat n (STMT (IF (e, []))) in
        eval_expr n p_stat e >>= fun e ->
        if e = 0 then prog_stat_inc p_stat n
        else return (enter_block_in_thread n p_stat e)
    | IF_ELSE (e, _, _) ->
        let p_stat = update_trace p_stat n (STMT (IF_ELSE (e, [], []))) in
        eval_expr n p_stat e >>= fun e ->
        return @@ enter_block_in_thread n p_stat e
    | NO_OP ->
        let p_stat = update_trace p_stat n (STMT NO_OP) in
        prog_stat_inc p_stat n
    | ASSIGN (l, r) ->
        let p_stat = update_trace p_stat n (STMT (ASSIGN (l, r))) in
        eval_assign n p_stat l r >>= fun p_stat -> prog_stat_inc p_stat n
    (* | ASSERT e ->
        let p_stat = update_trace p_stat n (STMT (ASSERT e)) in
        eval_assert n p_stat e >>= fun p_stat -> prog_stat_inc p_stat n *)
    | SMP_MB ->
        let p_stat = update_trace p_stat n (FENCE []) in
        flush_st_buf p_stat n >>= fun p_stat -> prog_stat_inc p_stat n

  let thread_is_not_finished t_stat =
    if List.hd t_stat.counters < t_stat.length then true else false

  let prog_is_not_finished p_stat =
    List.exists
      (fun x -> x = true)
      (List.map thread_is_not_finished p_stat.threads)

  (* let choose_not_finished_thread p_stat =
     let len = List.length p_stat.threads in
     let rec helper p_stat n i =
       if List.nth p_stat.threads i |> thread_is_not_finished then i
       else helper p_stat n (Random.int len)
     in
     helper p_stat len (Random.int len) *)

  (* let exec_prog_in_seq_cons p =
     let p_stat = init_prog_stat p in
     let rec helper p_stat =
       if prog_is_not_finished p_stat then
         exec_single_stmt_in_thread (choose_not_finished_thread p_stat) p_stat
         >>= fun p_stat -> helper p_stat
       else return p_stat
     in
     helper p_stat *)

  let not_finished_threads p_stat =
    let rec helper threads acc =
      match threads with
      | [] -> acc
      | thread :: tl ->
          if thread_is_not_finished thread then helper tl (thread.number :: acc)
          else helper tl acc
    in
    helper p_stat.threads []

  let threads_with_not_empty_st_buf p_stat =
    let rec helper threads acc =
      match threads with
      | [] -> acc
      | thread :: tl ->
          if st_buf_is_empty thread then helper tl acc
          else helper tl (thread.number :: acc)
    in
    helper p_stat.threads []

  let exec_next_instr p_stat max_depth =
    if p_stat.depth < max_depth then
      let p_stat = { p_stat with depth = p_stat.depth + 1 } in
      let nums1 = not_finished_threads p_stat in
      let nums2 = threads_with_not_empty_st_buf p_stat in
      let l1 =
        List.map (fun t_num -> exec_single_stmt_in_thread t_num p_stat) nums1
      in
      let l2 = List.map (fun t_num -> push_store_to_ram p_stat t_num) nums2 in
      List.concat [ l1; l2 ]
    else l_return (error "execution is too long")

  let show_executions p_stats_results =
    List.iteri
      (fun i p_stat_res ->
        print_endline ("\t" ^ "execution " ^ string_of_int (i + 1));
        match p_stat_res with
        | Error msg ->
            print_endline msg;
            print_endline "<><><><><><><><><><><><><><><><><><>"
        | Ok p_stat ->
            let ram = show_ram p_stat.ram in
            let reg_sets =
              List.map (fun t -> show_regs t.registers) p_stat.threads
            in
            print_endline ("ram: " ^ ram);
            print_endline "regs:";
            List.iter (fun s -> print_endline ("\t" ^ s)) reg_sets;
            print_endline "trace:";
            show_trace p_stat;
            print_endline "<><><><><><><><><><><><><><><><><><>")
      p_stats_results

  let show_execution_statistics results check_property descr code =
    print_endline "Code:";
    print_endline code;
    let rec helper results checker errors oks not_oks =
      if List.length results = 0 then [ errors; oks; not_oks ]
      else
        let res = List.hd results in
        match res with
        | Error _ -> helper (List.tl results) checker (errors + 1) oks not_oks
        | Ok p_stat ->
            if checker p_stat then
              helper (List.tl results) checker errors (oks + 1) not_oks
            else helper (List.tl results) checker errors oks (not_oks + 1)
    in
    let stats = helper results check_property 0 0 0 in
    print_endline "\tEXECUTION STATISTICS";
    let errors = List.nth stats 0 in
    print_endline (string_of_int errors ^ " executions crushed");
    let oks = List.nth stats 1 in
    print_endline
      (string_of_int oks ^ " executions finished and have following behavior: "
     ^ descr);
    let not_oks = List.nth stats 2 in
    print_endline
      (string_of_int not_oks
     ^ " executions finished but don't have following behavior: " ^ descr)

  let exec_prog_in_tso_monad_list p max_depth =
    let p_stat = init_prog_stat p in
    let rec helper p_stats_results =
      if
        List.exists
          (fun p_stat_res ->
            match p_stat_res with
            | Error _ -> false
            | Ok p_stat -> prog_is_not_finished p_stat)
          p_stats_results
      then
        helper
          ( p_stats_results >>== fun p_stat_res ->
            match p_stat_res with
            | Error _ -> [ p_stat_res ]
            | Ok p_stat when prog_is_not_finished p_stat ->
                exec_next_instr p_stat max_depth
            | Ok p_stat -> [ return p_stat ] )
      else p_stats_results
    in
    helper [ return p_stat ]

  let get_reg_val p_stat n r_name =
    snd
      (List.find
         (fun (s, _) -> s = r_name)
         (List.nth p_stat.threads n).registers)
end
