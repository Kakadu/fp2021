open Format
open Parser
open Ast

module type MONADERROR = sig
  include Base.Monad.S2

  val fail : 'e -> ('a, 'e) t
  val ( let* ) : ('a, 'e) t -> ('a -> ('b, 'e) t) -> ('b, 'e) t
end

let cint i = EConst (CInt i)
let cstring s = EConst (CString s)
let cbool b = EConst (CBool b)
let elist lst = EList lst

let pp_bin_op fmt = function
  | Add -> fprintf fmt "+"
  | Sub -> fprintf fmt "-"
  | Mul -> fprintf fmt "*"
  | Div -> fprintf fmt "/"
  | LE -> fprintf fmt "<="
  | LT -> fprintf fmt "<"
  | GE -> fprintf fmt ">"
  | GT -> fprintf fmt "=>"
  | EQ -> fprintf fmt "=="
  | NE -> fprintf fmt "!="
  | _ -> fprintf fmt ""
;;

let rec pp_expr fmt = function
  | EConst c ->
    (match c with
    | CInt i -> fprintf fmt "%d" i
    | CString s -> fprintf fmt "%s" s
    | CBool b -> fprintf fmt (if b then "True" else "False"))
  | ETuple t ->
    fprintf fmt "(%a)" (pp_print_list ~pp_sep:(fun _ _ -> fprintf fmt ", ") pp_expr) t
  | EList l ->
    fprintf fmt "[%a]" (pp_print_list ~pp_sep:(fun _ _ -> fprintf fmt ", ") pp_expr) l
  | EFun _ -> fprintf fmt "<fun>"
  | ECtor (id, value) ->
    let pp_tuple fmt = function
      | ETuple t ->
        fprintf fmt "%a" (pp_print_list ~pp_sep:(fun _ _ -> fprintf fmt " ") pp_expr) t
      | _ -> fprintf fmt "Not Tuple"
    in
    fprintf fmt "(%s %a)" id pp_tuple value
  | EApp (e1, e2) -> fprintf fmt "%a (%a)" pp_expr e1 pp_expr e2
  | EBinOp (op, e1, e2) -> fprintf fmt "(%a %a %a)" pp_expr e1 pp_bin_op op pp_expr e2
  | EVar name -> fprintf fmt "%s" name
  | EIf (cond, then', else') ->
    fprintf fmt "if %a then %a else %a" pp_expr cond pp_expr then' pp_expr else'
  | ENull -> fprintf fmt "[]"
  | Undefined name -> fprintf fmt "Unbound value: %s" name
  | _ -> fprintf fmt "?"
;;

type interpret_err =
  | Division_by_zero
  | Unbound of string
  | Non_exaust
  | Incorrect_eval of expr
  | Application of expr
  | Another of string
[@@deriving eq, show { with_path = false }]

type decl_binding = id * expr [@@deriving eq]
type interpret_ok = decl_binding list [@@deriving eq]

let pp_interpret_err fmt = function
  | Unbound str -> fprintf fmt "Unbound value %s" str
  | Division_by_zero -> fprintf fmt "Division by zero"
  | Incorrect_eval value -> fprintf fmt "Value %a is of incorrect type" pp_expr value
  | Non_exaust -> fprintf fmt "Non-exhaustive patterns in case"
  | Application expr -> fprintf fmt "Application error: %a shoud be function" pp_expr expr
  | Another str -> fprintf fmt "Error: %s" str
;;

let pp_decl_binding fmt (name, value) = fprintf fmt "%s = %a" name pp_expr value
let pp_interpret_ok = pp_print_list ~pp_sep:pp_force_newline pp_decl_binding

module Interpret (M : MONADERROR) : sig
  val run : prog -> (interpret_ok, interpret_err) M.t
end = struct
  open M

  let look_for_bind : env -> id -> (expr, interpret_err) t =
   fun map name ->
    try
      match !(BindsMap.find name map) with
      | Some v -> return v
      | None -> fail (Unbound name)
    with
    | Not_found -> fail (Unbound name)
 ;;

  let get_by_name env name =
    try
      match !(BindsMap.find name env) with
      | Some e -> e
      | None -> Undefined name
    with
    | Not_found -> Undefined name
  ;;

  let id_equal pat expr =
    match pat, expr with
    | PVar p, EVar e -> p = e
    | _ -> false
  ;;

  let print_map (m : 'a option ref BindsMap.t) =
    let string_of_option = function
      | { contents = Some _ } -> "Some"
      | { contents = None } -> "None"
    in
    let print_note key (value : 'a option ref) =
      print_string (key ^ ": " ^ string_of_option value ^ "\n")
    in
    BindsMap.iter print_note m
  ;;

  let extend_env : env -> interpret_ok -> env =
   fun env binds ->
    List.fold_left (fun env (id, v) -> BindsMap.add id (ref (Some v)) env) env binds
 ;;

  let rec pattern_bindings : pat -> id list = function
    | PWild | PNull | PConst _ -> []
    | PVar name -> [ name ]
    | PTuple elems -> List.concat_map (fun x -> pattern_bindings x) elems
    | PCons (l, r) -> pattern_bindings l @ pattern_bindings r
    | PAdt (_, _) -> []
  ;;

  let rec pattern_decl_bindings pattern expr =
    match pattern, expr with
    | PNull, EList [] -> return []
    | PWild, _ -> return []
    | PVar name, v -> return [ name, v ]
    | PConst (CInt c), EConst (CInt v) when c = v -> return []
    | PConst (CInt _), EConst (CInt _) -> fail Non_exaust
    | PConst (CString c), EConst (CString v) when c = v -> return []
    | PConst (CString _), EConst (CString _) -> fail Non_exaust
    | PConst (CBool c), EConst (CBool v) when c = v -> return []
    | PConst (CBool _), EConst (CBool _) -> fail Non_exaust
    | PCons (l, r), EList (hd :: tl) ->
      pattern_decl_bindings l hd
      >>= fun hd_match ->
      pattern_decl_bindings r (EList tl) >>= fun tl_match -> return (hd_match @ tl_match)
    | PTuple elems, ETuple vs ->
      (match elems, vs with
      | [], [] -> return []
      | elems_hd :: elems_tl, vs_hd :: vs_tl ->
        pattern_decl_bindings elems_hd vs_hd
        >>= fun bind_hd ->
        pattern_decl_bindings (PTuple elems_tl) (ETuple vs_tl)
        >>= fun bind_tl -> return (bind_hd @ bind_tl)
      | _ -> fail Non_exaust)
    | PAdt (pid, p), ECtor (vid, v) when pid = vid -> pattern_decl_bindings p v
    | _ -> fail Non_exaust
  ;;

  let rec check_pattern pattern expr =
    match pattern, expr with
    | PVar _, _ -> true
    | PWild, _ -> true
    | PConst (CInt c), EConst (CInt v) -> c = v
    | PConst (CString c), EConst (CString v) -> c = v
    | PConst (CBool c), EConst (CBool v) -> c = v
    | PCons (phd, ptl), EList (vhd :: vtl) ->
      check_pattern phd vhd && check_pattern ptl (EList vtl)
    | PNull, EList [] -> true
    | PTuple p, ETuple v ->
      List.length p = List.length v && List.for_all2 (fun p v -> check_pattern p v) p v
    | PAdt (pid, p), ECtor (vid, v) -> pid = vid && check_pattern p v
    | _ -> false
  ;;

  let calc_bin_op l r op =
    match l, r, op with
    | EConst (CInt x), EConst (CInt y), Add -> return (cint (x + y))
    | EConst (CInt x), EConst (CInt y), Sub -> return (cint (x - y))
    | EConst (CInt x), EConst (CInt y), Mul -> return (cint (x * y))
    | EConst (CInt x), EConst (CInt y), Div ->
      if y = 0 then fail Division_by_zero else return (cint (x / y))
    | EConst (CInt x), EConst (CInt y), EQ -> return (cbool (x = y))
    | EConst (CInt x), EConst (CInt y), NE -> return (cbool (x != y))
    | EConst (CInt x), EConst (CInt y), LE -> return (cbool (x <= y))
    | EConst (CInt x), EConst (CInt y), LT -> return (cbool (x < y))
    | EConst (CInt x), EConst (CInt y), GE -> return (cbool (x >= y))
    | EConst (CInt x), EConst (CInt y), GT -> return (cbool (x > y))
    | EConst (CBool x), EConst (CBool y), And -> return (cbool (x && y))
    | EConst (CBool x), EConst (CBool y), Or -> return (cbool (x || y))
    | EConst (CBool x), EConst (CBool y), EQ -> return (cbool (x = y))
    | EConst (CBool x), EConst (CBool y), NE -> return (cbool (x != y))
    | EConst (CString x), EConst (CString y), EQ -> return (cbool (x = y))
    | EConst (CString x), EConst (CString y), NE -> return (cbool (x <> y))
    | Undefined name, _, _ | _, Undefined name, _ -> fail @@ Unbound name
    | _ -> fail (Incorrect_eval (EBinOp (op, l, r)))
  ;;

  let rec eval : env -> expr -> (expr, interpret_err) t =
   fun env expr ->
    match expr with
    | EVar name -> return (get_by_name env name)
    | EConst c -> return (EConst c)
    | ENull -> return (EList [])
    | EBinOp (op, e1, e2) ->
      let* e1' = eval env e1 in
      let* e2' = eval env e2 in
      calc_bin_op e1' e2' op
    | ETuple t -> all (List.map (fun e -> eval env e) t) >>| etuple
    | EIf (e1, e2, e3) ->
      let* rez = eval env e1 in
      (match rez with
      | EConst (CBool true) -> eval env e2
      | EConst (CBool false) -> eval env e3
      | err -> fail (Incorrect_eval err))
    | EFun (pattern, expr, _) -> return (EFun (pattern, expr, env))
    | ECons (hd, tl) ->
      let* vhd = eval env hd in
      let* vtl = eval env tl in
      (match vtl with
      | EList l -> return (EList (vhd :: l))
      | _ -> fail (Incorrect_eval vtl))
    | EApp _ ->
      let* e = process_application env expr in
      eval env e
    | ELet (binding, expr) ->
      let* env = add_binding binding env in
      eval env expr
    | ECase (expr, cases) ->
      let* value = eval env expr in
      (match List.find_opt (fun (pattern, _) -> check_pattern pattern value) cases with
      | None -> fail Non_exaust
      | Some (pattern, expr) ->
        let* binds = pattern_decl_bindings pattern value in
        eval (extend_env env binds) expr)
    | ECtor (id, expr) ->
      let* value = eval env expr in
      return @@ ector id value
    | EList _ -> fail (Another "EList") (* EList is impossible here *)
    | Undefined name -> fail (Unbound name)

  and add_binding (pattern, expr) env =
    let binds = pattern_bindings pattern in
    let env = List.fold_left (fun env id -> BindsMap.add id (ref None) env) env binds in
    let* value = eval env expr in
    let* binds = pattern_decl_bindings pattern value in
    List.iter (fun (id, value) -> BindsMap.find id env := Some value) binds;
    return env

  and eval_whnf env expr =
    match expr with
    | EVar name -> eval_whnf env (get_by_name env name)
    | EConst c -> return (EConst c)
    | ENull -> return ENull
    | EBinOp (op, e1, e2) ->
      let* value1 = eval_whnf env e1 in
      let* value2 = eval_whnf env e2 in
      calc_bin_op value1 value2 op
    | ETuple t -> return (ETuple t)
    | EList lst -> return (EList lst)
    | EIf (e1, e2, e3) ->
      let* rez = eval_whnf env e1 in
      (match rez with
      | EConst (CBool true) -> eval_whnf env e2
      | EConst (CBool false) -> eval_whnf env e3
      | _ -> fail Non_exaust)
    | EFun _ -> return expr
    | ECons (hd, tl) ->
      (match tl with
      | EList tl -> return (EList (hd :: tl))
      | _ -> fail (Incorrect_eval tl))
    | EApp _ ->
      let* e = process_application env expr in
      eval_whnf env e
    | ECase (expr, cases) ->
      let* value = eval_whnf env expr in
      (match List.find_opt (fun (pattern, _) -> check_pattern pattern value) cases with
      | None -> fail Non_exaust
      | Some (pattern, expr) ->
        let* binds = pattern_decl_bindings pattern value in
        eval_whnf (extend_env env binds) expr)
    | ECtor (id, expr) ->
      let* value = eval_whnf env expr in
      return @@ ector id value
    | _ -> fail (Incorrect_eval expr)

  and repl env pat arg =
    let rec helper expr =
      match expr with
      | EVar _ when id_equal pat expr -> arg
      | EVar v -> EVar v
      | EConst c -> EConst c
      | ENull -> ENull
      | ECons (e1, e2) -> ECons (helper e1, helper e2)
      | ETuple lst -> ETuple (List.map (fun expr -> helper expr) lst)
      | EFun (pat, body, _) -> EFun (pat, helper body, env)
      | ELet (binding, expr) -> ELet (binding, helper expr)
      | EBinOp (op, e1, e2) -> EBinOp (op, helper e1, helper e2)
      | EIf (cond, then', else') ->
        let cond = helper cond in
        let then' = helper then' in
        let else' = helper else' in
        EIf (cond, then', else')
      | EApp (f, args) -> EApp (helper f, helper args)
      | ECase (expr, cases) ->
        let expr' = helper expr in
        let cases' = List.map (fun (pat, expr) -> ccase pat (helper expr)) cases in
        ECase (expr', cases')
      | ECtor (id, expr) -> ECtor (id, helper expr)
      | Undefined id -> Undefined id
      | EList lst -> EList (List.map (fun e -> helper e) lst)
    in
    helper

  and substitute env expr arg =
    match expr with
    | EFun (pat, body, _) ->
      (match pat with
      | PVar _ -> return (repl env pat arg body)
      | _ -> fail (Another "Incorrect pattern"))
    | _ ->
      let* expr' = eval_whnf env expr in
      substitute env expr' arg

  and process_application env expr =
    match expr with
    | EApp (func, arg) ->
      let* lambda =
        match func with
        | EFun _ -> return func
        | EVar id -> return (get_by_name env id)
        | _ -> process_application env func
      in
      substitute env lambda arg
    | EVar id -> return @@ get_by_name env id
    | _ -> fail (Application expr)
  ;;

  let run program =
    let* binds, _ =
      List.fold_left
        (fun acc -> function
          | DAdt _ -> acc
          | DLet binding ->
            let* binds, env = acc in
            let* env = add_binding binding env in
            let pattern, _ = binding in
            let* new_binds =
              all
                (List.map
                   (fun id ->
                     let* value = look_for_bind env id in
                     return (id, value))
                   (pattern_bindings pattern))
            in
            let binds =
              List.fold_left
                (fun binds (id, _) -> List.remove_assq id binds)
                binds
                new_binds
            in
            return (binds @ new_binds, env))
        (return ([], BindsMap.empty))
        program
    in
    return binds
  ;;
end

module InterpretResult = Interpret (struct
  include Base.Result

  let ( let* ) m f = bind m ~f
end)

let run_interpret code = InterpretResult.run (parse_or_error code)

let pp_run_interpret fmt code =
  match run_interpret code with
  | Ok ok -> fprintf fmt "%a\n" pp_interpret_ok ok
  | Error err -> fprintf fmt "%a\n" pp_interpret_err err
;;

let test_interpreter code expected =
  match run_interpret code with
  | Ok ok ->
    let flag =
      List.exists
        (fun needed -> List.for_all (fun x -> equal_decl_binding needed x) ok)
        expected
    in
    (match flag with
    | true -> true
    | false ->
      printf "Error\nExpected:%a\nFound:%a\n" pp_interpret_ok expected pp_interpret_ok ok;
      false)
  | Error err ->
    printf "%a\n" pp_interpret_err err;
    false
;;

let test code expected =
  match run_interpret code with
  | Ok ok ->
    let rec is_equal xs ys =
      match xs, ys with
      | [], [] -> true
      | xh :: xt, yh :: yt -> equal_decl_binding xh yh && is_equal xt yt
      | _ -> false
    in
    (match is_equal ok expected with
    | true -> true
    | false ->
      printf "Error\nExpected:%a\nFound:%a\n" pp_interpret_ok expected pp_interpret_ok ok;
      false)
  | Error err ->
    printf "%a\n" pp_interpret_err err;
    false
;;

let test_err code expected =
  match run_interpret code with
  | Ok _ -> false
  | Error err when equal_interpret_err err expected -> true
  | Error err ->
    printf "Unexpected error: %a" pp_interpret_err err;
    false
;;

let%test _ = test {|
y = 20
x = 10
|} [ "y", cint 20; "x", cint 10 ]

let%test _ = test {|
x = 2022 / 2 - 505 * 2|} [ "x", cint 1 ]

let%test _ = test {|
x = let square x = x * x in (square 5) - 1|} [ "x", cint 24 ]

let%test _ =
  test
    {|
data Point = Point Int Int
data Shape = Circle Point Int
circle = Circle (Point 0 0) 4
s = let surface s = case s of 
          (Circle _ r) -> 3 * r * r 
in surface circle|}
    [ ( "circle"
      , ECtor ("Circle", ETuple [ ECtor ("Point", ETuple [ cint 0; cint 0 ]); cint 4 ]) )
    ; "s", cint 48
    ]
;;

let%test _ =
  test
    {|
flag = let is_zero x y = case (x, y) of
                              (0, 0) -> True
                              _ -> False
in is_zero 1 1|}
    [ "flag", cbool false ]
;;

let%test _ = test_err {|
x = (677 - 433) * 19929 / (2022 / 2 - 1011)|} Division_by_zero

let%test _ = test_err {|
x = some + 27|} (Unbound "some")

let%test _ =
  test_err
    {|
x = let f x = case x of 
                0 -> "0"
                1 -> "1"
in f 2
|}
    Non_exaust
;;
