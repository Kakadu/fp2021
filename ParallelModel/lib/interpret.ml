open Ast

module type MONAD = sig
  type ('a, 'b) t = ('a list, 'b) result

  val return : 'a -> ('a, 'b) t
  val ( >>= ) : ('a, 'b) t -> ('a -> ('c, 'b) t) -> ('c, 'b) t
end

module type MONADERROR = sig
  include MONAD

  val error : 'a -> ('b, 'a) result
end

exception Impossible_case of string

module ResultMonad = struct
  type ('a, 'b) t = ('a list, 'b) result

  let return x = Result.ok [ x ]
  let error = Result.error

  let ( >>= ) xs f =
    match xs with
    | Error e -> error e
    | Ok list ->
      let llist = List.map f list in
      let is_error = function
        | Error _ -> true
        | Ok _ -> false
      in
      (match List.find_opt is_error llist with
      | Some err ->
        (match err with
        | Error e -> error e
        | _ -> raise (Impossible_case "variable could be only Error, not Ok"))
      | None ->
        let concat_list =
          List.concat_map
            (function
              | Ok list -> list
              | _ ->
                raise
                  (Impossible_case "Allready checked that all elements of lists are Ok-s"))
            llist
        in
        Result.ok concat_list)
  ;;
end

module BasicFunctions = struct
  let show_execution_statistics result check_property descr code =
    match result with
    | Error e -> print_endline ("Execution crushed with error: " ^ e)
    | Ok p_stat_list ->
      let good_execs =
        List.fold_left
          (fun cnt p_stat -> if check_property p_stat then cnt + 1 else cnt)
          0
          p_stat_list
      in
      let bad_execs = List.length p_stat_list - good_execs in
      print_endline "Code:";
      print_endline code;
      print_endline "\tEXECUTION STATISTICS";
      print_endline
        (String.concat
           ""
           [ string_of_int good_execs
           ; " executions finished and have following behavior: "
           ; descr
           ]);
      print_endline
        (String.concat
           ""
           [ string_of_int bad_execs
           ; " executions finished but don't have following behavior: "
           ; descr
           ])
  ;;

  let reduce = List.tl

  let inc_fst = function
    | [] -> []
    | h :: tl -> (h + 1) :: tl
  ;;

  let set v' n = List.mapi (fun i v -> if i = n then v' else v)
  let last ls = List.nth ls (List.length ls - 1)

  let rec find (list : (string * int) list) (var : string) =
    match list with
    | [] -> None
    | h :: tl ->
      (match h with
      | v_name, value -> if v_name = var then Some value else find tl var)
  ;;

  let remove list name = List.filter (fun (v_name, _) -> v_name <> name) list

  let rec replace list name value =
    match
      List.find_opt
        (function
          | v_name, _ -> v_name = name)
        list
    with
    | None -> (name, value) :: list
    | Some x ->
      (match x with
      | v_name, _ ->
        let list = remove list v_name in
        (name, value) :: list)
  ;;
end

module BaseDefs = struct
  include BasicFunctions

  type memory = (string * int) list [@@deriving show { with_path = false }]

  type thread_stat =
    { stmts : stmt list
    ; counters : int list
    ; length : int
    ; branch_exprs : int list
    ; number : int
    ; registers : memory
    ; st_buf : memory
    }
  [@@deriving show { with_path = false }]

  let init_thread_stat t =
    let t_info =
      match t with
      | THREAD (n, stmt_list) -> n, stmt_list
    in
    { stmts = snd t_info
    ; counters = [ 0 ]
    ; length = List.length (snd t_info)
    ; branch_exprs = []
    ; number = fst t_info
    ; registers = []
    ; st_buf = []
    }
  ;;

  let enter_block t_stat v =
    { t_stat with
      counters = 0 :: t_stat.counters
    ; branch_exprs = v :: t_stat.branch_exprs
    }
  ;;

  let thread_stat_inc t_stat = { t_stat with counters = inc_fst t_stat.counters }
  let thread_is_not_finished t_stat = last t_stat.counters < t_stat.length
end

module type TRACE_MODULE = sig
  type trace_step [@@deriving show]

  val print_trace : trace_step list -> unit
  val update_trace : trace_step list -> trace_step -> trace_step list
  val update_last_in_trace : trace_step list -> trace_step -> trace_step list
end

module TRACE_SC : TRACE_MODULE with type trace_step = int * stmt = struct
  type trace_step = int * stmt [@@deriving show]

  let print_trace trace =
    List.iter (fun step -> print_endline ("\t" ^ show_trace_step step)) (List.rev trace)
  ;;

  let update_trace trace step = step :: trace
  let update_last_in_trace trace step' = step' :: List.tl trace
end

type step' =
  | STMT of stmt
  | PUSH_STORE of (string * int)
  | FENCE of (string * int) list
[@@deriving show { with_path = false }]

module TRACE_TSO : TRACE_MODULE with type trace_step = int * step' = struct
  type trace_step = int * step' [@@deriving show { with_path = false }]

  let print_trace trace =
    List.iter (fun step -> print_endline ("\t" ^ show_trace_step step)) (List.rev trace)
  ;;

  let update_trace trace step = step :: trace
  let update_last_in_trace trace step' = step' :: List.tl trace
end

module SequentialConsistency = struct
  include ResultMonad
  include BaseDefs
  include TRACE_SC

  type prog_stat =
    { threads : thread_stat list
    ; ram : memory
    ; trace : trace_step list
    ; loaded : int
    ; depth : int
    }
  [@@deriving show { with_path = false }]

  let get_thread p_stat n =
    let rec helper = function
      | [] -> error ("program doesn't have thread with num " ^ string_of_int n)
      | t_stat :: tl -> if t_stat.number = n then return t_stat else helper tl
    in
    helper p_stat.threads
  ;;

  let init_var p_stat var =
    match find p_stat.ram var with
    | Some _ -> error (String.concat "" [ "variable @"; var; " already initialized" ])
    | None -> return { p_stat with ram = (var, 0) :: p_stat.ram }
  ;;

  let load_from_ram p_stat var =
    match find p_stat.ram var with
    | Some value -> return { p_stat with loaded = value }
    | None ->
      (* p_stat updated so we need to return it *)
      init_var p_stat var
      >>= fun p_stat ->
      (match find p_stat.ram var with
      | None ->
        error
          (String.concat "" [ "variable "; var; " was initialized but not found in ram" ])
      | Some value -> return { p_stat with loaded = value })
  ;;

  let store_to_var p_stat v_name value =
    let ram = replace p_stat.ram v_name value in
    return { p_stat with ram }
  ;;

  let store_to_reg p_stat n r_name value =
    get_thread p_stat n
    >>= fun thread ->
    let registers = replace thread.registers r_name value in
    let thread = { thread with registers } in
    let threads = set thread n p_stat.threads in
    return { p_stat with threads }
  ;;

  let add_to_regs p_stat n r_name value =
    get_thread p_stat n
    >>= fun thread ->
    let registers = (r_name, value) :: thread.registers in
    let thread = { thread with registers } in
    let threads = set thread n p_stat.threads in
    return { p_stat with threads }
  ;;

  let load_from_regs p_stat n r_name =
    get_thread p_stat n
    >>= fun t_stat ->
    match find t_stat.registers r_name with
    | None ->
      add_to_regs p_stat n r_name 0 >>= fun p_stat -> return { p_stat with loaded = 0 }
    | Some v -> return { p_stat with loaded = v }
  ;;

  (* n - is a thread number where expression is evaluated *)
  let rec eval_expr n p_stat = function
    | INT c -> return c
    | VAR_NAME var -> load_from_ram p_stat var >>= fun p_stat -> return p_stat.loaded
    | REGISTER r_name ->
      load_from_regs p_stat n r_name >>= fun p_stat -> return p_stat.loaded
    | PLUS (l, r) ->
      eval_expr n p_stat l
      >>= fun e1 -> eval_expr n p_stat r >>= fun e2 -> return (e1 + e2)
    | SUB (l, r) ->
      eval_expr n p_stat l
      >>= fun e1 -> eval_expr n p_stat r >>= fun e2 -> return (e1 - e2)
    | MUL (l, r) ->
      eval_expr n p_stat l
      >>= fun e1 -> eval_expr n p_stat r >>= fun e2 -> return (e1 * e2)
    | DIV (l, r) ->
      eval_expr n p_stat r
      >>= fun e2 ->
      if e2 = 0
      then error "division by zero"
      else eval_expr n p_stat l >>= fun e1 -> return (e1 / e2)
  ;;

  let eval_assign n p_stat l r =
    eval_expr n p_stat r
    >>= fun value ->
    match l with
    | VAR_NAME var -> store_to_var p_stat var value
    | REGISTER reg -> store_to_reg p_stat n reg value
    | _ -> error "assignment allowed only to variable and register"
  ;;

  let init_prog_stat p =
    let t_stats =
      match p with
      | PROG threads -> List.map init_thread_stat threads
    in
    { threads = t_stats; ram = []; trace = []; loaded = 0; depth = 0 }
  ;;

  let enter_block_in_thread n p_stat v =
    { p_stat with
      threads =
        List.mapi
          (fun i t_stat -> if i = n then enter_block t_stat v else t_stat)
          p_stat.threads
    }
  ;;

  let get_stmt p_stat cur_t_num =
    get_thread p_stat cur_t_num
    >>= fun t_stat ->
    let length = List.length t_stat.branch_exprs in
    let rec helper stmts counts lvl =
      stmts
      >>= fun stmts ->
      match counts with
      | [ n ] -> return (List.nth stmts n)
      | n :: tl ->
        helper
          (match List.nth stmts n with
          | IF (_, stmt_list) ->
            if List.nth t_stat.branch_exprs (length - 1 - lvl) <> 0
            then return stmt_list
            else error "try enter if-block when condition is false"
          | IF_ELSE (_, bk1, bk2) ->
            if List.nth t_stat.branch_exprs (length - 1 - lvl) <> 0
            then return bk1
            else return bk2
          | _ -> error ("this stmt is not compound: " ^ show_stmt (List.nth stmts n)))
          tl
          (lvl + 1)
      | _ -> error "invalid list of counters"
    in
    helper (return t_stat.stmts) (List.rev t_stat.counters) 0
  ;;

  let check p_stat n =
    try
      match get_stmt p_stat n with
      | _ -> true
    with
    | Failure _ -> false
  ;;

  let prog_stat_inc p_stat n =
    let rec helper p_stat n =
      get_thread p_stat n
      >>= fun t_stat ->
      let t_stat' = thread_stat_inc t_stat in
      let threads' = set t_stat' n p_stat.threads in
      let p_stat' = { p_stat with threads = threads' } in
      if List.length t_stat'.counters = 1 || check p_stat' n
      then return p_stat'
      else (
        (* leave block *)
        let t_stat2 =
          { t_stat' with
            counters = reduce t_stat'.counters
          ; branch_exprs = reduce t_stat'.branch_exprs
          }
        in
        let threads2 = set t_stat2 n p_stat'.threads in
        let p_stat2 = { p_stat' with threads = threads2 } in
        helper p_stat2 n)
    in
    helper p_stat n
  ;;

  let set_updated_trace p_stat trace_step =
    let trace = update_trace p_stat.trace trace_step in
    { p_stat with trace }
  ;;

  let exec_single_stmt_in_thread n p_stat =
    get_stmt p_stat n
    >>= function
    | IF (e, _) ->
      let p_stat = set_updated_trace p_stat (n, IF (e, [])) in
      eval_expr n p_stat e
      >>= fun e ->
      if e = 0 then prog_stat_inc p_stat n else return (enter_block_in_thread n p_stat e)
    | IF_ELSE (e, _, _) ->
      let p_stat = set_updated_trace p_stat (n, IF_ELSE (e, [], [])) in
      eval_expr n p_stat e >>= fun e -> return @@ enter_block_in_thread n p_stat e
    | NO_OP ->
      let p_stat = set_updated_trace p_stat (n, NO_OP) in
      prog_stat_inc p_stat n
    | ASSIGN (l, r) ->
      let p_stat = set_updated_trace p_stat (n, ASSIGN (l, r)) in
      eval_assign n p_stat l r >>= fun p_stat -> prog_stat_inc p_stat n
    | SMP_MB ->
      let p_stat = set_updated_trace p_stat (n, SMP_MB) in
      prog_stat_inc p_stat n
  ;;

  let prog_is_not_finished p_stat =
    List.exists (fun x -> x = true) (List.map thread_is_not_finished p_stat.threads)
  ;;

  let not_finished_threads p_stat =
    List.filter_map
      (fun t -> if thread_is_not_finished t then Some t.number else None)
      p_stat.threads
  ;;

  let exec_next_instr p_stat max_depth =
    if p_stat.depth < max_depth
    then (
      let p_stat = { p_stat with depth = p_stat.depth + 1 } in
      let nums = not_finished_threads p_stat in
      Result.ok nums >>= fun num -> exec_single_stmt_in_thread num p_stat)
    else error "execution is too long"
  ;;

  let show_executions = function
    | Error e -> print_endline e
    | Ok p_stat_list ->
      List.iteri
        (fun i p_stat ->
          print_endline (String.concat "" [ "\t"; "execution "; string_of_int (i + 1) ]);
          let ram = show_memory p_stat.ram in
          let reg_sets = List.map (fun t -> show_memory t.registers) p_stat.threads in
          print_endline ("ram: " ^ ram);
          print_endline "regs:";
          List.iter (fun s -> print_endline ("\t" ^ s)) reg_sets;
          print_endline "trace:";
          print_trace p_stat.trace;
          print_endline "<><><><><><><><><><><><><><><><><><>")
        p_stat_list
  ;;

  let exec_prog_in_seq_cons_monad_list p max_depth =
    let p_stat = init_prog_stat p in
    let rec helper (res : (prog_stat list, 'b) result) =
      res
      >>= fun p_stat ->
      if prog_is_not_finished p_stat
      then helper (exec_next_instr p_stat max_depth)
      else return p_stat
    in
    helper (return p_stat)
  ;;

  let get_reg_val p_stat n r_name =
    snd (List.find (fun (s, _) -> s = r_name) (List.nth p_stat.threads n).registers)
  ;;
end

module TSO = struct
  include ResultMonad
  include BaseDefs
  include TRACE_TSO

  type prog_stat =
    { threads : thread_stat list
    ; ram : memory
    ; trace : trace_step list
    ; loaded : int
    ; depth : int
    }
  [@@deriving show { with_path = false }]

  let get_thread p_stat n =
    let rec helper = function
      | [] -> error ("program doesn't have thread with num " ^ string_of_int n)
      | t_stat :: tl -> if t_stat.number = n then return t_stat else helper tl
    in
    helper p_stat.threads
  ;;

  let init_var p_stat var =
    match find p_stat.ram var with
    | Some _ -> error (String.concat "" [ "variable @"; var; " already initialized" ])
    | None -> return { p_stat with ram = (var, 0) :: p_stat.ram }
  ;;

  let load_from_ram p_stat var =
    match find p_stat.ram var with
    | Some value -> return { p_stat with loaded = value }
    | None ->
      (* p_stat updated so we need to return it *)
      init_var p_stat var
      >>= fun p_stat ->
      (match find p_stat.ram var with
      | None ->
        error
          (String.concat
             ""
             [ "variable @"; var; " was initialized but not found in ram" ])
      | Some value -> return { p_stat with loaded = value })
  ;;

  let update_p_stat p_stat new_thread new_t_num =
    let threads = set new_thread new_t_num p_stat.threads in
    { p_stat with threads }
  ;;

  let store_to_var p_stat n v_name value =
    get_thread p_stat n
    >>= fun t ->
    let st_buf = t.st_buf @ [ v_name, value ] in
    let t = { t with st_buf } in
    return (update_p_stat p_stat t n)
  ;;

  let store_to_reg p_stat n r_name value =
    get_thread p_stat n
    >>= fun thread ->
    let registers = replace thread.registers r_name value in
    let thread = { thread with registers } in
    let threads = set thread n p_stat.threads in
    return { p_stat with threads }
  ;;

  let add_to_regs p_stat n r_name value =
    get_thread p_stat n
    >>= fun thread ->
    let registers = (r_name, value) :: thread.registers in
    let thread = { thread with registers } in
    let threads = set thread n p_stat.threads in
    return { p_stat with threads }
  ;;

  let load_from_regs p_stat n r_name =
    get_thread p_stat n
    >>= fun t_stat ->
    match find t_stat.registers r_name with
    | None ->
      add_to_regs p_stat n r_name 0 >>= fun p_stat -> return { p_stat with loaded = 0 }
    | Some v -> return { p_stat with loaded = v }
  ;;

  let scan_store_buffer p_stat n var =
    get_thread p_stat n
    >>= fun thread ->
    match List.find_opt (fun (v_name, _) -> v_name = var) thread.st_buf with
    | None -> return None
    | Some (_, value) -> return (Some value)
  ;;

  let load_var p_stat n var =
    scan_store_buffer p_stat n var
    >>= function
    | Some value -> return { p_stat with loaded = value }
    | None -> load_from_ram p_stat var
  ;;

  (* n - is a thread number where expression is evaluated *)
  let rec eval_expr n p_stat = function
    | INT c -> return c
    | VAR_NAME var ->
      (* load_from_ram p_stat var  *)
      load_var p_stat n var >>= fun p_stat -> return p_stat.loaded
    | REGISTER r_name ->
      load_from_regs p_stat n r_name >>= fun p_stat -> return p_stat.loaded
    | PLUS (l, r) ->
      eval_expr n p_stat l
      >>= fun e1 -> eval_expr n p_stat r >>= fun e2 -> return (e1 + e2)
    | SUB (l, r) ->
      eval_expr n p_stat l
      >>= fun e1 -> eval_expr n p_stat r >>= fun e2 -> return (e1 - e2)
    | MUL (l, r) ->
      eval_expr n p_stat l
      >>= fun e1 -> eval_expr n p_stat r >>= fun e2 -> return (e1 * e2)
    | DIV (l, r) ->
      eval_expr n p_stat r
      >>= fun e2 ->
      if e2 = 0
      then error "division by zero"
      else eval_expr n p_stat l >>= fun e1 -> return (e1 / e2)
  ;;

  let eval_assign n p_stat l r =
    eval_expr n p_stat r
    >>= fun value ->
    match l with
    | VAR_NAME var -> store_to_var p_stat n var value
    | REGISTER reg -> store_to_reg p_stat n reg value
    | _ -> error "assignment allowed only to variable and register"
  ;;

  let init_prog_stat p =
    let t_stats =
      match p with
      | PROG threads -> List.map init_thread_stat threads
    in
    { threads = t_stats; ram = []; trace = []; loaded = 0; depth = 0 }
  ;;

  let enter_block_in_thread n p_stat v =
    { p_stat with
      threads =
        List.mapi
          (fun i t_stat -> if i = n then enter_block t_stat v else t_stat)
          p_stat.threads
    }
  ;;

  let get_stmt p_stat cur_t_num =
    get_thread p_stat cur_t_num
    >>= fun t_stat ->
    let length = List.length t_stat.branch_exprs in
    let rec helper stmts counts lvl =
      stmts
      >>= fun stmts ->
      match counts with
      | [ n ] -> return (List.nth stmts n)
      | n :: tl ->
        helper
          (match List.nth stmts n with
          | IF (_, stmt_list) ->
            if List.nth t_stat.branch_exprs (length - 1 - lvl) <> 0
            then return stmt_list
            else error "try enter if-block when condition is false"
          | IF_ELSE (_, bk1, bk2) ->
            if List.nth t_stat.branch_exprs (length - 1 - lvl) <> 0
            then return bk1
            else return bk2
          | _ -> error ("this stmt is not compound: " ^ show_stmt (List.nth stmts n)))
          tl
          (lvl + 1)
      | _ -> error "invalid list of counters"
    in
    helper (return t_stat.stmts) (List.rev t_stat.counters) 0
  ;;

  let check p_stat n =
    try
      match get_stmt p_stat n with
      | _ -> true
    with
    | Failure _ -> false
  ;;

  let prog_stat_inc p_stat n =
    let rec helper p_stat n =
      get_thread p_stat n
      >>= fun t_stat ->
      let t_stat' = thread_stat_inc t_stat in
      let threads' = set t_stat' n p_stat.threads in
      let p_stat' = { p_stat with threads = threads' } in
      if List.length t_stat'.counters = 1 || check p_stat' n
      then return p_stat'
      else (
        (* leave block *)
        let t_stat2 =
          { t_stat' with
            counters = reduce t_stat'.counters
          ; branch_exprs = reduce t_stat'.branch_exprs
          }
        in
        let threads2 = set t_stat2 n p_stat'.threads in
        let p_stat2 = { p_stat' with threads = threads2 } in
        helper p_stat2 n)
    in
    helper p_stat n
  ;;

  let set_updated_trace p_stat trace = { p_stat with trace }

  let push_store_to_ram p_stat n =
    get_thread p_stat n
    >>= fun t ->
    match List.nth_opt t.st_buf 0 with
    | None -> error "trying to pop store from empty st_buf"
    | Some (v_name, value) ->
      let p_stat =
        set_updated_trace p_stat ((n, PUSH_STORE (v_name, value)) :: p_stat.trace)
      in
      (* remove store from buffer *)
      let st_buf = List.tl t.st_buf in
      let t = { t with st_buf } in
      let p_stat = update_p_stat p_stat t n in
      (* put store to ram *)
      let ram = replace p_stat.ram v_name value in
      return { p_stat with ram }
  ;;

  let push_store_to_ram_trace_disabled p_stat n =
    get_thread p_stat n
    >>= fun t ->
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
  ;;

  let st_buf_is_empty thread = thread.st_buf = []

  let rec flush_st_buf p_stat n =
    get_thread p_stat n
    >>= fun t ->
    if st_buf_is_empty t
    then return p_stat
    else
      push_store_to_ram_trace_disabled p_stat n
      >>= fun p_stat ->
      (* show_trace p_stat; *)
      let step = snd (List.hd p_stat.trace) in
      let step =
        match step with
        | FENCE list ->
          let store = List.hd t.st_buf in
          list @ [ store ]
        | _ -> raise @@ Impossible_case "impossible case in flush_st_buf"
      in
      let p_stat =
        let trace = update_last_in_trace p_stat.trace (n, FENCE step) in
        set_updated_trace p_stat trace
      in
      flush_st_buf p_stat n
  ;;

  let exec_single_stmt_in_thread n p_stat =
    get_stmt p_stat n
    >>= function
    | IF (e, _) ->
      let p_stat =
        let trace = update_trace p_stat.trace (n, STMT (IF (e, []))) in
        set_updated_trace p_stat trace
      in
      eval_expr n p_stat e
      >>= fun e ->
      if e = 0 then prog_stat_inc p_stat n else return (enter_block_in_thread n p_stat e)
    | IF_ELSE (e, _, _) ->
      let p_stat =
        let trace = update_trace p_stat.trace (n, STMT (IF_ELSE (e, [], []))) in
        set_updated_trace p_stat trace
      in
      eval_expr n p_stat e >>= fun e -> return @@ enter_block_in_thread n p_stat e
    | NO_OP ->
      let p_stat =
        let trace = update_trace p_stat.trace (n, STMT NO_OP) in
        set_updated_trace p_stat trace
      in
      prog_stat_inc p_stat n
    | ASSIGN (l, r) ->
      let p_stat =
        let trace = update_trace p_stat.trace (n, STMT (ASSIGN (l, r))) in
        set_updated_trace p_stat trace
      in
      eval_assign n p_stat l r >>= fun p_stat -> prog_stat_inc p_stat n
    | SMP_MB ->
      let p_stat = set_updated_trace p_stat ((n, FENCE []) :: p_stat.trace) in
      flush_st_buf p_stat n >>= fun p_stat -> prog_stat_inc p_stat n
  ;;

  let prog_is_not_finished p_stat =
    List.exists (fun x -> x = true) (List.map thread_is_not_finished p_stat.threads)
  ;;

  let not_finished_threads p_stat =
    List.filter_map
      (fun t -> if thread_is_not_finished t then Some t.number else None)
      p_stat.threads
  ;;

  let threads_with_not_empty_st_buf p_stat =
    let rec helper threads acc =
      match threads with
      | [] -> acc
      | thread :: tl ->
        if st_buf_is_empty thread then helper tl acc else helper tl (thread.number :: acc)
    in
    helper p_stat.threads []
  ;;

  let exec_next_instr p_stat max_depth =
    if p_stat.depth < max_depth
    then (
      let p_stat = { p_stat with depth = p_stat.depth + 1 } in
      let nums1 = not_finished_threads p_stat in
      let nums2 = threads_with_not_empty_st_buf p_stat in
      let res1 = Result.ok nums1 >>= fun num -> exec_single_stmt_in_thread num p_stat in
      let res2 = Result.ok nums2 >>= fun num -> push_store_to_ram p_stat num in
      match res1 with
      | Error e -> error e
      | Ok list1 ->
        (match res2 with
        | Error e -> error e
        | Ok list2 -> Result.ok (list1 @ list2)))
    else error "execution is too long"
  ;;

  let show_executions = function
    | Error e -> print_endline e
    | Ok p_stat_list ->
      List.iteri
        (fun i p_stat ->
          print_endline (String.concat "" [ "\t"; "execution "; string_of_int (i + 1) ]);
          let ram = show_memory p_stat.ram in
          let reg_sets = List.map (fun t -> show_memory t.registers) p_stat.threads in
          print_endline ("ram: " ^ ram);
          print_endline "regs:";
          List.iter (fun s -> print_endline ("\t" ^ s)) reg_sets;
          print_endline "trace:";
          print_trace p_stat.trace;
          print_endline "<><><><><><><><><><><><><><><><><><>")
        p_stat_list
  ;;

  let exec_prog_in_tso_monad_list p max_depth =
    let p_stat = init_prog_stat p in
    let rec helper (res : (prog_stat list, 'b) result) =
      res
      >>= fun p_stat ->
      if prog_is_not_finished p_stat
      then helper (exec_next_instr p_stat max_depth)
      else return p_stat
    in
    helper (return p_stat)
  ;;

  let get_reg_val p_stat n r_name =
    snd (List.find (fun (s, _) -> s = r_name) (List.nth p_stat.threads n).registers)
  ;;
end
