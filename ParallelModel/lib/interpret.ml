open Angstrom
open Ast

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
            | WHILE (_, block) ->
                if List.nth t_stat.branch_exprs lvl <> 0 then return block
                else error "try enter while-loop when condition is false"
            | _ ->
                error
                  ("this stmt is not compound: " ^ show_stmt (List.nth stmts n)))
            tl (lvl + 1)
      | _ -> error "invalid list of counters"
    in
    helper (return t_stat.stmts) t_stat.counters 0

  let peek_while t_stat counters =
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
    helper (return t_stat.stmts) counters 0

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
        peek_while t_stat2 t_stat2.counters >>= fun is_peeked ->
        if is_peeked then return p_stat2 else helper p_stat2 n
    in
    helper p_stat n

  let update_trace p_stat n stmt =
    let step = (n, stmt) in
    { p_stat with trace = p_stat.trace @ [ step ] }

  let exec_single_stmt_in_thread n p_stat =
    get_stmt p_stat n >>= function
    | WHILE (e, _) ->
        let p_stat = update_trace p_stat n (WHILE (e, [])) in
        eval_expr n p_stat e >>= fun e ->
        if e = 0 then prog_stat_inc p_stat n
        else return (enter_block_in_thread n p_stat e)
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
    | ASSERT e ->
        let p_stat = update_trace p_stat n (ASSERT e) in
        eval_assert n p_stat e >>= fun p_stat -> prog_stat_inc p_stat n
    | SMP_RMB | SMP_WMB | SMP_MB ->
        error "you can't use memory barriers in Sequential Consistency"

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

  let exec_next_instr p_stat =
    let max_depth = 8 in
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

  let exec_prog_in_seq_cons_monad_list p =
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
                exec_next_instr p_stat
            | Ok p_stat -> [ return p_stat ] )
      else p_stats_results
    in
    helper [ return p_stat ]
end

(* module TSO = struct
     let set v' n = List.mapi (fun i v -> if i = n then v' else v)

     type store_op = { name : string; value : int }

     let print_store_op op =
       let s = op.name ^ " <- " ^ string_of_int op.value in
       print_endline s

     type invalidation = { target : string }

     let print_inv inv =
       let s = "invalidate " ^ inv.target in
       print_endline s

     type store_buf = store_op Queue.t

     let print_store_buf buf =
       print_endline "store_buf:";
       Queue.iter print_store_op buf

     type inv_queue = invalidation Queue.t

     let print_inv_q q =
       print_endline "inv_q:";
       Queue.iter print_inv q

     let buffer_invalidation inv inv_queue = Queue.add inv inv_queue

     let buffer_store (store : store_op) st_buf = Queue.add store st_buf

     (* посчитать число записей в переменную name ,которые находятся в store buffer-e *)
     let calc_entries_in_store_buf name st_buf =
       Queue.fold
         (fun accu store_op -> if store_op.name = name then accu + 1 else accu)
         0 st_buf

     let calc_entries_in_inv_q name inv_q =
       Queue.fold
         (fun accu inv -> if inv.target = name then accu + 1 else accu)
         0 inv_q

     (* получить последнее значение записанное в переменную name и
        находящееся в буфере записи *)
     let store_forwarding (name : string) (st_buf : store_buf) =
       let n = calc_entries_in_store_buf name st_buf in
       if n = 0 then None
       else
         let last_buffered_store_to_name_value =
           Queue.fold
             (fun accu store_op ->
               if store_op.name = name then store_op.value else accu)
             0 st_buf
         in
         Some last_buffered_store_to_name_value

     type ram = (string, int) Hashtbl.t

     type ram_controller = { load_requests : (string * int) Queue.t }

     type mesi_state = Modified | Exclusive | Shared | Invalidated

     let mesi_state_to_string = function
       | Modified -> "M"
       | Exclusive -> "E"
       | Shared -> "S"
       | Invalidated -> "I"

     type mesi_msg =
       (* какую переменную и от какого потока. номep нужен, чтобы знать кому потом посылать ответ *)
       | ReadRq of (string * int)
       (* имя запрашиваемой переменной, её значение, если присутствует в опрашиваемом кэше и в каком состоянии
          она была в кэше(если была), который отправляет ответ*)
       | ReadResponse of (string * int option * mesi_state option)
       | Invalidate of (string * int)
       (* инвалидэйт акноуледжмент какой кэш линии (переменной) и от процессора с каким номером *)
       | InvalidateAcknowledge of (string * int)
       | ReadInvalidate of string
       | Writeback of string * int

     let print_mesi_msg = function
       | ReadRq (v_name, n) ->
           print_endline ("ReadRq: " ^ v_name ^ " by thread " ^ string_of_int n)
       | ReadResponse (v_name, value, state) -> (
           match value with
           | None -> print_endline ("ReadResp: " ^ v_name ^ " is not in cache")
           | Some v -> (
               match state with
               | None -> failwith "impossible"
               | Some st ->
                   print_endline
                     ("ReadResp: " ^ v_name ^ " = " ^ string_of_int v
                    ^ " was in state " ^ mesi_state_to_string st)))
       | Invalidate (v_name, n) ->
           print_endline ("Invalidate " ^ v_name ^ " by thread " ^ string_of_int n)
       | InvalidateAcknowledge (v_name, n) ->
           print_endline
             ("InvalidateAck " ^ v_name ^ " by thread " ^ string_of_int n)
       | _ -> failwith "ReadInvalidate and Writeback don't printed"

     let print_cache_rq_q = Queue.iter print_mesi_msg

     (* В мою кэш линию влезает лишь одна int переменная
        ключ для таблицы это имя переменной*)
     type cache_line = { state : mesi_state; value : int }

     type cache = (string, cache_line) Hashtbl.t

     let add_entry_to_cache (cache : cache) name value =
       match Hashtbl.find_opt cache name with
       | Some c_line -> (
           match c_line.state with
           | Invalidated -> Hashtbl.replace cache name { state = Exclusive; value }
           | _ -> failwith "tried to add cache line that was already in cache")
       | None -> Hashtbl.add cache name { state = Exclusive; value }

     let add_or_modify_cache_line cache name value =
       match Hashtbl.find_opt cache name with
       | Some _ -> Hashtbl.replace cache name { state = Modified; value }
       | None -> Hashtbl.add cache name { state = Exclusive; value }

     let check_cache_hit cache name =
       let bindings = Hashtbl.find_all cache name in
       if List.length bindings > 1 then
         failwith "variable sits in several cache lines"
       else if List.length bindings = 1 then
         match Hashtbl.find cache name with
         | c_line -> if c_line.state = Invalidated then None else Some c_line
       else None

     type pending_load = { is_pending : bool; v_name : string }

     type thread_stat = {
       stmts : stmt list;
       counters : int list;
       length : int;
       branch_exprs : int list;
       cache : cache;
       cache_request_queue : mesi_msg Queue.t;
       cache_ack_queue : mesi_msg Queue.t;
       st_buf : store_buf;
       inv_q : inv_queue;
       number : int;
       pending_load : pending_load;
       last_eval_res : int;
       read_rq_tbl : (string, bool * int) Hashtbl.t;
       inv_rq_tbl : (string, int) Hashtbl.t;
       is_waiting_on_wmb : bool;
     }

     type prog_stat = {
       threads : thread_stat list;
       ram : ram;
       ram_controller : ram_controller;
     }

     let get_thread p_stat n =
       let rec helper t_stats =
         match t_stats with
         | [] ->
             failwith ("program doesn't have thread with num " ^ string_of_int n)
         | t_stat :: tl -> if t_stat.number = n then t_stat else helper tl
       in
       helper p_stat.threads

     let await_pending_load_in_thread n p_stat v_name =
       let helper t_stat =
         match t_stat.pending_load.is_pending with
         | true -> t_stat
         (* failwith "previous pending_load is not ended" *)
         (* надо ли last_eval_res = None? *)
         | false -> { t_stat with pending_load = { is_pending = true; v_name } }
       in
       let t_stat' = helper (get_thread p_stat n) in
       let t_stats' = set t_stat' n p_stat.threads in
       { p_stat with threads = t_stats' }

     let finish_pending_load_in_thread n p_stat =
       let helper t_stat =
         match t_stat.pending_load.is_pending with
         | true ->
             { t_stat with pending_load = { is_pending = false; v_name = "" } }
         | false -> t_stat
       in
       let t_stat' = helper (get_thread p_stat n) in
       let t_stats' = set t_stat' n p_stat.threads in
       { p_stat with threads = t_stats' }

     (* updates only value of cache line, mesi-state is untouched *)
     let update_cache_line cache name value =
       match Hashtbl.find_opt cache name with
       | None -> failwith "tried to update cache line which is not in cache"
       | Some c_line -> Hashtbl.replace cache name { c_line with value }

     let change_mesi_state cache name new_mesi_state =
       match Hashtbl.find_opt cache name with
       | None ->
           failwith
             "tried to change mesi_state for cache line which is not in cache"
       | Some c_line ->
           Hashtbl.replace cache name { c_line with state = new_mesi_state }

     let invalidate_cache_line name cache =
       match check_cache_hit cache name with
       | None -> ()
       | Some _ -> change_mesi_state cache name Invalidated

     let rec process_inv_q t_stat v_name =
       match calc_entries_in_inv_q v_name t_stat.inv_q with
       | 0 -> ()
       | _ ->
           let invalidation = Queue.take t_stat.inv_q in
           invalidate_cache_line invalidation.target t_stat.cache;
           process_inv_q t_stat v_name

     let process_one_element_of_inv_q t_stat =
       match Queue.take_opt t_stat.inv_q with
       | None -> ()
       | Some invalidation ->
           invalidate_cache_line invalidation.target t_stat.cache

     let rec process_whole_inv_q t_stat =
       match Queue.take_opt t_stat.inv_q with
       | None -> ()
       | Some invalidation ->
           invalidate_cache_line invalidation.target t_stat.cache;
           process_whole_inv_q t_stat

     let write_back_to_ram_from_cache ram cache name =
       match check_cache_hit cache name with
       | None ->
           failwith "tried to write back to ram the variable that is not in cache"
       | Some c_line ->
           let store_to_ram ram (name : string) (value : int) =
             Hashtbl.replace ram name value
           in
           store_to_ram ram name c_line.value

     let flush_cache_to_ram cache ram =
       Hashtbl.iter
         (fun name c_line ->
           match c_line.state with
           | Invalidated -> ()
           | Modified | Exclusive | Shared ->
               write_back_to_ram_from_cache ram cache name)
         cache

     let flush_all_caches p_stat =
       List.iter
         (fun t_stat -> flush_cache_to_ram t_stat.cache p_stat.ram)
         p_stat.threads

     let rec select_other_caches p_stat n =
       let rec helper t_stats acc =
         match t_stats with
         | [] -> acc
         | t_stat :: tl ->
             if t_stat.number = n then helper tl acc
             else helper tl (t_stat.cache :: acc)
       in
       helper p_stat.threads []

     (* послать запрос из потока n на инвалидацию кэш линии (переменной) другим кэшам *)
     let send_invalidate_request p_stat n name =
       List.iter
         (fun t_stat ->
           (* посылаем всем кэшам, можно подумать об отправке только тем, которые содержат name *)
           if t_stat.number <> n then
             Queue.add (Invalidate (name, n)) t_stat.cache_request_queue
           else ())
         p_stat.threads

     (* это метод вызывается, когда у потока в начале очереди cache_request_queue
        находится Invalidate (v_name, n). Наша задача это при наличии в кэше переменной name
        инвалидировать её, а потом положить в очередь cache_ack_queue потока n наш acknowledgment *)
     (* применяя этот метод мы удаляем из очереди первый запрос! *)
     let speculativly_process_invalidate_request p_stat cur_thread_num =
       let local_thread = get_thread p_stat cur_thread_num in
       match Queue.take_opt local_thread.cache_request_queue with
       | None -> failwith "nothing to put in inv_queue"
       | Some request -> (
           match request with
           | Invalidate (v_name, source_t_num) ->
               let requestor_thread = get_thread p_stat source_t_num in
               (* добавляем инвалидацию в свою invalidation_queue *)
               Queue.add { target = v_name } local_thread.inv_q;
               (* отправляем акноуледжмент *)
               Queue.add
                 (InvalidateAcknowledge (v_name, cur_thread_num))
                 requestor_thread.cache_ack_queue;
               p_stat
           | _ ->
               failwith
                 "first element in cache_request_queue isn't an Invalidate request"
           )

     let load_from_ram_request p_stat n name =
       Queue.add (name, n) p_stat.ram_controller.load_requests

     let send_read_request p_stat n name =
       List.iter
         (fun t_stat ->
           if t_stat.number <> n then
             Queue.add (ReadRq (name, n)) t_stat.cache_request_queue
           else ())
         p_stat.threads

     (* применяя этот метод мы удаляем из очереди первый запрос! *)
     let process_read_request p_stat cur_t_num =
       let local_thread = get_thread p_stat cur_t_num in
       match Queue.take_opt local_thread.cache_request_queue with
       | None -> failwith "no (read) requests to process"
       | Some request -> (
           match request with
           | ReadRq (v_name, source_t_num) -> (
               process_inv_q local_thread v_name;

               let requestor_thread = get_thread p_stat source_t_num in
               match check_cache_hit local_thread.cache v_name with
               | None ->
                   Queue.add
                     (ReadResponse (v_name, None, None))
                     requestor_thread.cache_ack_queue;
                   p_stat
               | Some c_line -> (
                   match c_line.state with
                   | Exclusive ->
                       Queue.add
                         (ReadResponse (v_name, Some c_line.value, Some Exclusive))
                         requestor_thread.cache_ack_queue;
                       change_mesi_state local_thread.cache v_name Shared;
                       p_stat
                   | Modified ->
                       write_back_to_ram_from_cache p_stat.ram local_thread.cache
                         v_name;
                       change_mesi_state local_thread.cache v_name Shared;
                       Queue.add
                         (ReadResponse (v_name, Some c_line.value, Some Modified))
                         requestor_thread.cache_ack_queue;
                       p_stat
                   | Shared ->
                       Queue.add
                         (ReadResponse (v_name, Some c_line.value, Some Shared))
                         requestor_thread.cache_ack_queue;
                       p_stat
                   | Invalidated ->
                       failwith
                         "cache hit for line in Invalidated state is an error"))
           | _ -> failwith "fst element in cache_request_queue isn't ReadRq")

     let issue_read_rq p_stat n v_name =
       let local_thread = get_thread p_stat n in
       match Hashtbl.find_opt local_thread.read_rq_tbl v_name with
       | None ->
           Hashtbl.add local_thread.read_rq_tbl v_name (false, 0);
           send_read_request p_stat n v_name
           (* значит запрос на чтении этой переменной уже послан, надо ожидать ответа других кэшей *)
       | Some _ -> ()

     let issue_inv_rq p_stat n v_name =
       let local_thread = get_thread p_stat n in

       (* process_inv_q local_thread v_name; <-------------------------------------------------------------*)
       match Hashtbl.find_opt local_thread.inv_rq_tbl v_name with
       | None ->
           Hashtbl.add local_thread.inv_rq_tbl v_name 0;
           send_invalidate_request p_stat n v_name
           (* запрос на инвалидацию этой переменной уже послан, надо ожидать ответа всех других кэшей *)
       | Some _ -> ()

     let rec store_to_cache p_stat n name value =
       let local_thread = get_thread p_stat n in
       let local_cache = local_thread.cache in

       process_inv_q local_thread name;

       match check_cache_hit local_cache name with
       | Some c_line -> (
           match c_line.state with
           | Modified -> update_cache_line local_cache name value
           | Exclusive ->
               update_cache_line local_cache name value;
               change_mesi_state local_cache name Modified
           | Shared ->
               (* помещаем запись в буфер_записей,
                  посылаем запрос на инвалидацию дригим кэшам *)
               buffer_store { name; value } local_thread.st_buf;

               issue_inv_rq p_stat n name
               (* send_invalidate_request p_stat n name *)
           | Invalidated ->
               failwith "store_to_cache: cache hit of line in Invalidated state")
       | None ->
           (* можно ли помещать в буфер_записей запись в кэш-линию в состоянии Invalidated?  *)
           (* предположим, что это можно делать *)
           buffer_store { name; value } local_thread.st_buf;
           issue_read_rq p_stat n name;
           issue_inv_rq p_stat n name

     and load_to_cache_from_ram p_stat n name =
       let load_from_ram ram var =
         match Hashtbl.find_opt ram var with
         | Some value -> value
         | None ->
             (* Вернуть ноль *)
             let init_var memory var =
               match Hashtbl.find_opt memory var with
               | Some _ -> failwith ("variable @" ^ var ^ " already initialized")
               | None -> Hashtbl.add memory var 0
             in
             init_var ram var;
             Hashtbl.find ram var
       in
       let value = load_from_ram p_stat.ram name in
       add_entry_to_cache (get_thread p_stat n).cache name value

     let load_from_cache_opt p_stat n name =
       let local_thread = get_thread p_stat n in
       let local_cache = local_thread.cache in
       match store_forwarding name local_thread.st_buf with
       | Some v -> Some v (* store forwarding *)
       | None -> (
           match check_cache_hit local_cache name with
           | Some c_line -> Some c_line.value
           | None ->
               (* send ReadRq to other caches and leave method
                  (to await other caches or ram supply us with "cache line" (variable)) *)
               (* send_read_request p_stat n name; *)
               issue_read_rq p_stat n name;
               None)

     let print_ht ht =
       Hashtbl.iter
         (fun v_name value ->
           print_string (v_name ^ " = " ^ string_of_int value ^ "\t"))
         ht;
       print_endline ""

     let print_cache =
       Hashtbl.iter (fun name c_line ->
           print_string
             (name ^ " = " ^ string_of_int c_line.value ^ " in state: "
             ^ mesi_state_to_string c_line.state
             ^ "\n"))

     let eval_int c t_num p_stat =
       let t_stat = get_thread p_stat t_num in
       let t_stat' = { t_stat with last_eval_res = c } in
       { p_stat with threads = set t_stat' t_num p_stat.threads }

     (* n - is a thread number where expression is evaluated *)
     let rec eval_expr n p_stat = function
       | INT value -> eval_int value n p_stat
       | VAR_NAME var -> (
           match load_from_cache_opt p_stat n var with
           | Some value -> eval_int value n p_stat
           (* надо ожидать поступления значения из других кешей или основной памяти.
                  Плюс надо факт такого ожидания отметить в p_stat или t_stat
                  Когда данные придут, то передающий их кэш или основная память должны
                  изменить значение флага pending_load на false *)
           | None -> await_pending_load_in_thread n p_stat var)
       | REGISTER r -> failwith "reads from registers not impl yet"
       | PLUS (l, r) -> (
           let p_stat1 = eval_expr n p_stat l in
           let t_stat1 = get_thread p_stat1 n in
           match t_stat1.pending_load.is_pending with
           | true -> p_stat1
           | false -> (
               let p_stat2 = eval_expr n p_stat r in
               let t_stat2 = get_thread p_stat2 n in
               match t_stat2.pending_load.is_pending with
               | false ->
                   eval_int
                     (t_stat1.last_eval_res + t_stat2.last_eval_res)
                     n p_stat2
               | true -> p_stat2))
       | SUB (l, r) -> (
           let p_stat1 = eval_expr n p_stat l in
           let t_stat1 = get_thread p_stat1 n in
           match t_stat1.pending_load.is_pending with
           | true -> p_stat1
           | false -> (
               let p_stat2 = eval_expr n p_stat r in
               let t_stat2 = get_thread p_stat2 n in
               match t_stat2.pending_load.is_pending with
               | false ->
                   eval_int
                     (t_stat1.last_eval_res - t_stat2.last_eval_res)
                     n p_stat2
               | true -> p_stat2))
       | MUL (l, r) -> (
           let p_stat1 = eval_expr n p_stat l in
           let t_stat1 = get_thread p_stat1 n in
           match t_stat1.pending_load.is_pending with
           | true -> p_stat1
           | false -> (
               let p_stat2 = eval_expr n p_stat r in
               let t_stat2 = get_thread p_stat2 n in
               match t_stat2.pending_load.is_pending with
               | false ->
                   eval_int
                     (t_stat1.last_eval_res * t_stat2.last_eval_res)
                     n p_stat2
               | true -> p_stat2))
       | DIV (l, r) -> (
           let p_stat1 = eval_expr n p_stat l in
           let t_stat1 = get_thread p_stat1 n in
           match t_stat1.pending_load.is_pending with
           | true -> p_stat1
           | false -> (
               let p_stat2 = eval_expr n p_stat r in
               let t_stat2 = get_thread p_stat2 n in
               match t_stat2.pending_load.is_pending with
               | false ->
                   if t_stat2.last_eval_res = 0 then failwith "div by zero"
                   else
                     eval_int
                       (t_stat1.last_eval_res / t_stat2.last_eval_res)
                       n p_stat2
               | true -> p_stat2))

     let eval_assign n p_stat l r =
       let p_stat' = eval_expr n p_stat r in
       let t_stat' = get_thread p_stat' n in
       if t_stat'.pending_load.is_pending then p_stat'
       else
         match l with
         | VAR_NAME v ->
             store_to_cache p_stat' n v t_stat'.last_eval_res;
             p_stat'
         | REGISTER reg ->
             failwith "assignment to register is not implemented"
             (* Hashtbl.replace ctx.regs reg value;
                p_stat *)
         | _ -> failwith "assignment allowed only to variable and register"

     let print_read_rq_tbl =
       Hashtbl.iter (fun v_name pair ->
           print_endline
             (v_name ^ " "
             ^ string_of_bool (fst pair)
             ^ " "
             ^ string_of_int (snd pair)))

     let print_t_stat t_stat =
       print_string ("thread " ^ string_of_int t_stat.number ^ ":\n");

       print_string "counters: ";
       List.iter (fun x -> print_string @@ string_of_int x ^ "; ") t_stat.counters;
       print_string "\n";

       print_cache t_stat.cache;

       (* print_string "\n"; *)
       print_endline "read_rq_tbl: ";
       print_read_rq_tbl t_stat.read_rq_tbl;
       print_endline "inv_rq_tbl: ";
       print_ht t_stat.inv_rq_tbl;

       print_store_buf t_stat.st_buf;
       print_inv_q t_stat.inv_q;

       print_endline "cache_request_queue: ";
       print_cache_rq_q t_stat.cache_request_queue;

       print_endline "cache_ack_queue: ";
       print_cache_rq_q t_stat.cache_ack_queue;

       print_endline "----------------"

     let print_p_stat p_stat =
       List.iter print_t_stat p_stat.threads;
       print_string "\n";
       print_string "ram: ";
       print_ht p_stat.ram;
       print_string "\n"

     let init_thread_stat t =
       let t_info = match t with THREAD (n, stmt_list) -> (n, stmt_list) in
       {
         stmts = snd t_info;
         counters = [ 0 ];
         length = List.length (snd t_info);
         branch_exprs = [];
         cache = Hashtbl.create 8;
         st_buf = Queue.create ();
         inv_q = Queue.create ();
         cache_request_queue = Queue.create ();
         cache_ack_queue = Queue.create ();
         number = fst t_info;
         pending_load = { is_pending = false; v_name = "" };
         last_eval_res = 0;
         read_rq_tbl = Hashtbl.create 32;
         inv_rq_tbl = Hashtbl.create 32;
         is_waiting_on_wmb = false;
       }

     let init_prog_stat p =
       let t_stats =
         match p with PROG threads -> List.map init_thread_stat threads
       in
       {
         threads = t_stats;
         ram = Hashtbl.create 16;
         ram_controller = { load_requests = Queue.create () };
       }

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

     let get_stmt t_stat =
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
               | WHILE (_, bk) ->
                   if List.nth t_stat.branch_exprs lvl <> 0 then bk
                   else failwith "try enter while-loop when condition is false"
               | _ -> failwith "this stmt is not compound")
               tl (lvl + 1)
         | [] -> failwith "invalid list of counters (counts)"
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

     let check t_stat =
       try match get_stmt t_stat with _ -> true with Failure _ -> false

     let reduce ls = ls |> List.rev |> List.tl |> List.rev

     let thread_stat_inc t_stat =
       { t_stat with counters = inc_last t_stat.counters }

     let correct_t_stat_inc t_stat =
       let rec helper t_stat =
         let t_stat' = thread_stat_inc t_stat in
         if List.length t_stat'.counters = 1 || check t_stat' then t_stat'
         else
           let ret_t_stat =
             {
               t_stat' with
               counters = reduce t_stat'.counters;
               branch_exprs = reduce t_stat'.branch_exprs;
             }
           in
           if peek_while ret_t_stat ret_t_stat.counters then
             (* print_endline "peek_while = true"; *)
             ret_t_stat
           else
             (* print_endline "peek_while = false"; *)
             helper
               {
                 t_stat' with
                 counters = reduce t_stat'.counters;
                 branch_exprs = reduce t_stat'.branch_exprs;
               }
       in
       helper t_stat

     let set v' n = List.mapi (fun i v -> if i = n then v' else v)

     let prog_stat_inc p_stat n =
       {
         p_stat with
         threads =
           set (correct_t_stat_inc (List.nth p_stat.threads n)) n p_stat.threads;
       }

     let process_read_resp_in_thread n p_stat v_name value =
       let local_thread = get_thread p_stat n in
       let read_rq_tbl = local_thread.read_rq_tbl in
       match Hashtbl.find_opt read_rq_tbl v_name with
       | None ->
           failwith
             "thread that issued ReadRq must put in his read_rq_tbl pair of key = \
              v_name; value = (false, 0)"
       | Some (is_obtained, cnt) -> (
           if is_obtained = false && cnt = 0 then (
             (* это первый поступивший ответ на запрос чтения *)
             match value with
             | None ->
                 Hashtbl.replace read_rq_tbl v_name (false, 1);
                 p_stat
             | Some v ->
                 (* add to our cache *)
                 add_entry_to_cache local_thread.cache v_name v;

                 (* так как значение получили от других кешей, то наша кэш линия
                    должна быть в состоянии Shared *)
                 change_mesi_state local_thread.cache v_name Shared;
                 Hashtbl.replace read_rq_tbl v_name (true, 1);
                 if v_name = local_thread.pending_load.v_name then
                   finish_pending_load_in_thread n p_stat
                 else p_stat)
           else
             let cnt' = cnt + 1 in
             match is_obtained with
             | true ->
                 Hashtbl.replace read_rq_tbl v_name (true, cnt');
                 p_stat
             | false -> (
                 match value with
                 | None ->
                     Hashtbl.replace read_rq_tbl v_name (false, cnt');
                     p_stat
                 | Some v ->
                     (* add to our cache *)
                     add_entry_to_cache local_thread.cache v_name v;
                     Hashtbl.replace read_rq_tbl v_name (true, cnt');
                     if v_name = local_thread.pending_load.v_name then
                       finish_pending_load_in_thread n p_stat
                     else p_stat))

     let process_inv_ack_in_thread n p_stat v_name =
       let local_thread = get_thread p_stat n in
       let inv_rq_tbl = local_thread.inv_rq_tbl in
       match Hashtbl.find_opt inv_rq_tbl v_name with
       | None -> Hashtbl.add inv_rq_tbl v_name 1
       | Some cnt -> Hashtbl.replace inv_rq_tbl v_name (cnt + 1)

     (* поток должен уметь принимать акноуледжменты и обрабатывать запросы, которые лежат в очередях
        cache_ack_queue and cache_request_queue
        Для этого нужны отдельные ф-ии *)
     let process_rq_in_thread n p_stat =
       print_endline @@ "process_rq_in_thread " ^ string_of_int n;
       let local_thread = get_thread p_stat n in
       match Queue.peek_opt local_thread.cache_request_queue with
       | None -> p_stat
       | Some rq -> (
           match rq with
           | ReadRq (_, _) -> process_read_request p_stat n
           | Invalidate (_, _) -> speculativly_process_invalidate_request p_stat n
           | _ -> failwith "processing of this rq is not impl")

     let process_ack_in_thread n p_stat =
       print_endline @@ "process_ack_in_thread " ^ string_of_int n;
       let local_thread = get_thread p_stat n in
       let num_of_caches = List.length p_stat.threads in
       match Queue.take_opt local_thread.cache_ack_queue with
       | None -> p_stat
       | Some ack -> (
           match ack with
           | ReadResponse (v_name, value, responder_cache_state) ->
               let p_stat' = process_read_resp_in_thread n p_stat v_name value in
               let read_rq = Hashtbl.find local_thread.read_rq_tbl v_name in
               let is_obtained = fst read_rq in
               let cnt' = snd read_rq in

               if cnt' = num_of_caches - 1 then (
                 Hashtbl.remove local_thread.read_rq_tbl v_name;
                 if not is_obtained then (
                   load_to_cache_from_ram p_stat n v_name;
                   if v_name = local_thread.pending_load.v_name then
                     finish_pending_load_in_thread n p_stat'
                   else p_stat')
                 else p_stat')
               else p_stat'
           | InvalidateAcknowledge (v_name, responder_t_num) ->
               process_inv_ack_in_thread n p_stat v_name;
               let num_of_resps = Hashtbl.find local_thread.inv_rq_tbl v_name in
               let _ =
                 if num_of_resps = num_of_caches - 1 then (
                   Hashtbl.remove local_thread.inv_rq_tbl v_name;
                   (* move store from st_buf to cache; change cache line state *)
                   match Queue.peek_opt local_thread.st_buf with
                   | None ->
                       failwith
                         "we received all inv_acks but there is no store in \
                          store_buffer"
                   | Some store ->
                       if store.name = v_name then (
                         (* add_entry_to_cache local_thread.cache v_name store.value; *)
                         add_or_modify_cache_line local_thread.cache v_name
                           store.value;
                         let _ = Queue.pop local_thread.st_buf in
                         ())
                       else
                         failwith
                           ("we received all inv_acks but first entry in st_buf \
                             is a store to a location different from " ^ v_name))
                 else ()
               in
               p_stat
           | _ ->
               failwith "process_ack_in_thread: processing of this ack is not impl"
           )

     let process_smp_wmb n p_stat =
       let t_stat = get_thread p_stat n in
       match t_stat.is_waiting_on_wmb with
       | false ->
           let t_stat' = { t_stat with is_waiting_on_wmb = true } in
           let threads = set t_stat' n p_stat.threads in
           { p_stat with threads }
       | true -> (
           match Queue.is_empty t_stat.st_buf with
           | false -> p_stat
           | true ->
               let t_stat' = { t_stat with is_waiting_on_wmb = false } in
               let threads = set t_stat' n p_stat.threads in
               let p_stat' = { p_stat with threads } in
               prog_stat_inc p_stat' n)

     let exec_single_stmt_in_thread n p_stat =
       print_endline @@ "exec_stmt in thread " ^ string_of_int n;
       let t_stat = get_thread p_stat n in
       match get_stmt t_stat with
       | WHILE (e, _) -> (
           let p_stat' = eval_expr n p_stat e in
           let t_stat' = get_thread p_stat' n in
           match t_stat'.pending_load.is_pending with
           | false ->
               if t_stat'.last_eval_res = 0 then prog_stat_inc p_stat' n
               else enter_block_in_thread n p_stat' t_stat'.last_eval_res
           | true -> p_stat')
       | IF (e, _) -> (
           let p_stat' = eval_expr n p_stat e in
           let t_stat' = get_thread p_stat' n in
           match t_stat'.pending_load.is_pending with
           | false ->
               if t_stat'.last_eval_res = 0 then prog_stat_inc p_stat' n
               else enter_block_in_thread n p_stat' t_stat'.last_eval_res
           | true -> p_stat')
       | IF_ELSE (e, _, _) -> (
           let p_stat' = eval_expr n p_stat e in
           let t_stat' = get_thread p_stat' n in
           match t_stat'.pending_load.is_pending with
           | false -> enter_block_in_thread n p_stat' t_stat'.last_eval_res
           | true -> p_stat'
           (* enter_block_in_thread n p_stat (eval_expr n p_stat e) *))
       | NO_OP ->
           (* print_endline "no_op"; *)
           prog_stat_inc p_stat n
       | ASSIGN (l, r) -> (
           (* print_endline "assign"; *)
           let p_stat' = eval_assign n p_stat l r in
           let t_stat' = get_thread p_stat' n in
           match t_stat'.pending_load.is_pending with
           | true -> p_stat'
           | false -> prog_stat_inc p_stat' n
           (* prog_stat_inc (eval_assign n p_stat l r) n *))
       | ASSERT e -> (
           let p_stat' = eval_expr n p_stat e in
           let t_stat' = get_thread p_stat' n in
           match t_stat'.pending_load.is_pending with
           | false ->
               if t_stat'.last_eval_res = 0 then (
                 print_endline "*************************";
                 print_endline "state of program before failed";
                 print_p_stat p_stat';
                 failwith "assertation fails")
               else prog_stat_inc p_stat' n
           | true -> p_stat')
       | SMP_RMB ->
           process_whole_inv_q t_stat;
           prog_stat_inc p_stat n
       | SMP_WMB -> process_smp_wmb n p_stat
       | SMP_MB -> (
           let t_stat = get_thread p_stat n in
           match t_stat.is_waiting_on_wmb with
           | false ->
               let t_stat' = { t_stat with is_waiting_on_wmb = true } in
               let threads = set t_stat' n p_stat.threads in
               { p_stat with threads }
           | true -> (
               match Queue.is_empty t_stat.st_buf with
               | false -> p_stat
               | true ->
                   let t_stat' = { t_stat with is_waiting_on_wmb = false } in
                   process_whole_inv_q t_stat';
                   let threads = set t_stat' n p_stat.threads in
                   let p_stat' = { p_stat with threads } in
                   prog_stat_inc p_stat' n))

     (* prog_stat_inc p_stat n *)
     (* failwith "mem bars not impl yet" *)

     let thread_is_not_finished t_stat =
       if
         List.hd t_stat.counters < t_stat.length
         || (not @@ Queue.is_empty t_stat.cache_ack_queue)
         || (not @@ Queue.is_empty t_stat.cache_request_queue)
       then true
       else false

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

     (* let exec_stmt_rq_ack n p_stat =
        let t_stat = get_thread p_stat n in
        if List.hd t_stat.counters < t_stat.length then
          let p_stat1 = exec_single_stmt_in_thread n p_stat in
          let p_stat2 = process_rq_in_thread n p_stat1 in
          process_ack_in_thread n p_stat2
        else
          let p_stat1 = process_rq_in_thread n p_stat in
          process_ack_in_thread n p_stat1 *)

     let exec_stmt_or_process_cache n p_stat =
       let t_stat = get_thread p_stat n in
       match Random.int 3 with
       | 0 ->
           if List.hd t_stat.counters < t_stat.length then
             exec_single_stmt_in_thread n p_stat
           else if not @@ Queue.is_empty t_stat.cache_ack_queue then
             process_ack_in_thread n p_stat
           else if not @@ Queue.is_empty t_stat.cache_request_queue then
             process_rq_in_thread n p_stat
           else (
             print_endline "null 0";
             p_stat)
       | 1 ->
           if not @@ Queue.is_empty t_stat.cache_ack_queue then
             process_ack_in_thread n p_stat
           else (
             print_endline "null 1";
             p_stat)
       | 2 ->
           if not @@ Queue.is_empty t_stat.cache_request_queue then
             process_rq_in_thread n p_stat
           else (
             print_endline "null 2";
             p_stat)
       | _ -> failwith "Random.int works incorrectly :)"

     let rec insert_wmb_in_compound_stmt compound_stmt =
       match compound_stmt with
       | IF (e, stmt_list) -> IF (e, insert_wmb_before_assignments stmt_list)
       | IF_ELSE (e, stmts1, stmts2) ->
           IF_ELSE
             ( e,
               insert_wmb_before_assignments stmts1,
               insert_wmb_before_assignments stmts2 )
       | WHILE (e, stmt_list) -> WHILE (e, insert_wmb_before_assignments stmt_list)
       | _ -> failwith "not compound stmt"

     and insert_wmb_before_assignments stmt_list =
       let rec helper stmts acc =
         match stmts with
         | [] -> acc
         | stmt :: tl when List.length acc > 0 -> (
             match stmt with
             | ASSIGN (_, _) -> helper tl (acc @ [ SMP_WMB; stmt ])
             | IF (_, _) | WHILE (_, _) | IF_ELSE (_, _, _) ->
                 helper tl (acc @ [ insert_wmb_in_compound_stmt stmt ])
             | _ -> helper tl (acc @ [ stmt ]))
         | stmt :: tl -> (
             match stmt with
             | IF (_, _) | WHILE (_, _) | IF_ELSE (_, _, _) ->
                 helper tl (acc @ [ insert_wmb_in_compound_stmt stmt ])
             | _ -> helper tl (acc @ [ stmt ]))
       in
       helper stmt_list []

     let insert_wmb_to_thread_for_tso thread =
       match thread with
       | THREAD (n, stmt_list) ->
           THREAD (n, insert_wmb_before_assignments stmt_list)

     let insert_wmb_to_prog_for_tso p =
       match p with
       | PROG thread_list ->
           let threads = List.map insert_wmb_to_thread_for_tso thread_list in
           PROG threads

     let rec expr_has_loads_from_vars = function
       | INT _ -> false
       | VAR_NAME _ -> true
       | REGISTER _ -> false
       | PLUS (l, r) -> expr_has_loads_from_vars l || expr_has_loads_from_vars r
       | SUB (l, r) -> expr_has_loads_from_vars l || expr_has_loads_from_vars r
       | MUL (l, r) -> expr_has_loads_from_vars l || expr_has_loads_from_vars r
       | DIV (l, r) -> expr_has_loads_from_vars l || expr_has_loads_from_vars r

     let rec insert_rmb_in_compound_stmt compound_stmt =
       match compound_stmt with
       | IF (e, stmt_list) -> IF (e, insert_rmb stmt_list)
       | IF_ELSE (e, stmts1, stmts2) ->
           IF_ELSE (e, insert_rmb stmts1, insert_rmb stmts2)
       | WHILE (e, stmt_list) -> WHILE (e, insert_rmb stmt_list)
       | _ -> failwith "not compound stmt"

     and insert_rmb stmt_list =
       let rec helper stmts acc =
         match stmts with
         | [] -> acc
         | stmt :: tl when List.length acc > 0 -> (
             match stmt with
             | ASSERT _ -> helper tl (acc @ [ SMP_RMB; stmt ])
             | IF (_, _) | WHILE (_, _) | IF_ELSE (_, _, _) ->
                 helper tl (acc @ [ SMP_RMB; insert_rmb_in_compound_stmt stmt ])
             | ASSIGN (_, r) -> (
                 match expr_has_loads_from_vars r with
                 | true -> helper tl (acc @ [ SMP_RMB; stmt ])
                 | false -> helper tl (acc @ [ stmt ]))
             | _ -> helper tl (acc @ [ stmt ]))
         | stmt :: tl -> (
             match stmt with
             | IF (_, _) | WHILE (_, _) | IF_ELSE (_, _, _) ->
                 helper tl (acc @ [ insert_rmb_in_compound_stmt stmt ])
             | _ -> helper tl (acc @ [ stmt ]))
       in
       helper stmt_list []

     let insert_rmb_to_thread_for_tso thread =
       match thread with THREAD (n, stmt_list) -> THREAD (n, insert_rmb stmt_list)

     let insert_rmb_to_prog_for_tso p =
       match p with
       | PROG thread_list ->
           let threads = List.map insert_rmb_to_thread_for_tso thread_list in
           PROG threads

     let insert_barriers_for_tso p =
       p |> insert_rmb_to_prog_for_tso |> insert_wmb_to_prog_for_tso

     let exec_prog_in_tso p =
       let p = insert_barriers_for_tso p in
       let p_stat = init_prog_stat p in
       let rec helper p_stat =
         if prog_is_not_finished p_stat then (
           let n = choose_not_finished_thread p_stat in
           if Random.int 1000 = 0 then
             process_one_element_of_inv_q (get_thread p_stat n)
           else ();

           helper (exec_stmt_or_process_cache n p_stat))
         else p_stat
       in
       let res_p_stat = helper p_stat in
       flush_all_caches res_p_stat;
       res_p_stat

     (* нужно вручную использовать функцию insert_barriers_for_tso при создании p_stat,
        который будет подан на вход этой функции. Иначе встроенных барьеров характерных для TSO
        НЕ БУДЕТ!
        Эта ф-ия применяется, когда перед исполнением нужно задать кэшам определенное состояние, как сделано
        в тестах.
        Наверное можно сделать аргументами программу prog и ф-ию, которая задаст кэшу нужное состояние
     *)
     let exec_prog_stat p_stat =
       let rec helper p_stat =
         if prog_is_not_finished p_stat then (
           let n = choose_not_finished_thread p_stat in
           if Random.int 1000 = 0 then
             process_one_element_of_inv_q (get_thread p_stat n)
           else ();

           helper (exec_stmt_or_process_cache n p_stat))
         else p_stat
       in
       let res_p_stat = helper p_stat in
       flush_all_caches res_p_stat;
       res_p_stat
   end *)

let s1 = {|
a<-1    ||| while (b-1) {}
b<-1    ||| assert(a)
|}

let s2 = {|
x<-1   ||| y<-1
EAX<-y   ||| EBX<-x
|}

(* open Parser
   open TSO

   let p1 = parse_prog s1
   (* |> insert_barriers_for_tso *)

   let p2 = parse_prog s2
   (* |> insert_barriers_for_tso *)

   let prepare_for_test p_stat =
     add_entry_to_cache (get_thread p_stat 0).cache "a" 0;
     add_entry_to_cache (get_thread p_stat 1).cache "a" 0;
     add_entry_to_cache (get_thread p_stat 0).cache "b" 0;
     change_mesi_state (get_thread p_stat 0).cache "a" Shared;
     change_mesi_state (get_thread p_stat 1).cache "a" Shared

   (* для теста на модель TSO, т.е на StoreLoad barrier *)
   let prepare_for_test2 p_stat =
     add_entry_to_cache (get_thread p_stat 0).cache "x" 0;
     add_entry_to_cache (get_thread p_stat 1).cache "x" 0;
     add_entry_to_cache (get_thread p_stat 0).cache "y" 0;
     add_entry_to_cache (get_thread p_stat 1).cache "y" 0;
     change_mesi_state (get_thread p_stat 0).cache "x" Shared;
     change_mesi_state (get_thread p_stat 1).cache "x" Shared;
     change_mesi_state (get_thread p_stat 0).cache "y" Shared;
     change_mesi_state (get_thread p_stat 1).cache "y" Shared

   let test_store_load_barrier () =
     let get_p_stat_for_test2 () =
       let p = insert_barriers_for_tso p2 in
       let p_stat = init_prog_stat p in
       prepare_for_test2 p_stat;
       p_stat
     in
     let i = 0 in
     let cnt = ref i in
     while true do
       print_string @@ "iteration " ^ string_of_int !cnt ^ ": ";
       let res = exec_prog_stat (get_p_stat_for_test2 ()) in
       assert (Hashtbl.find res.ram "a" = 1 || Hashtbl.find res.ram "b" = 1);
       cnt := !cnt + 1;
       print_endline @@ "success"
     done

   let test_wmb_and_rmb () =
     let get_p_stat_for_test () =
       let p = insert_barriers_for_tso p1 in
       let p_stat = init_prog_stat p in
       prepare_for_test p_stat;
       p_stat
     in
     let i = 0 in
     let cnt = ref i in

     while true do
       print_string @@ "iteration " ^ string_of_int !cnt ^ ": ";
       let _ = exec_prog_stat (get_p_stat_for_test ()) in
       cnt := !cnt + 1;
       print_endline @@ "success"
     done *)
