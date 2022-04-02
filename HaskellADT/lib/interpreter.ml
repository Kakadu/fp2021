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

let rec pp_pat fmt = function
  | PVar name -> fprintf fmt "%s" name
  | PTuple t ->
    fprintf fmt "(%a)" (pp_print_list ~pp_sep:(fun _ _ -> fprintf fmt ", ") pp_pat) t
  | PNull -> fprintf fmt "[]"
  | PCons (l, r) -> fprintf fmt "%a:%a" pp_pat l pp_pat r
  | _ -> fprintf fmt "pat?"
;;

let pp_binding fmt = function
  | pat, expr -> fprintf fmt "%a = %a" pp_pat pat pp_expr expr
;;

let rec pp_expr fmt expr =
  match expr with
  | EConst c ->
    (match c with
    | CInt i -> fprintf fmt "%d" i
    | CString s -> fprintf fmt "%s" s
    | CBool b -> fprintf fmt (if b then "True" else "False"))
  | ETuple t ->
    fprintf fmt "(%a)" (pp_print_list ~pp_sep:(fun _ _ -> fprintf fmt ", ") pp_expr) t
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
  | ECons _ ->
    let rec create_list expr =
      match expr with
      | ECons (l, r) -> l :: create_list r
      | ENull -> []
      | _ -> failwith "Not Cons"
    in
    fprintf
      fmt
      "[%a]"
      (pp_print_list ~pp_sep:(fun _ _ -> fprintf fmt ", ") pp_expr)
      (create_list expr)
  | ENull -> fprintf fmt "[]"
  | Undefined -> fprintf fmt "Unbound value"
  | ELet _ -> fprintf fmt "let"
  | ECase (expr, lst) ->
    fprintf
      fmt
      "case %a of\n%a"
      pp_expr
      expr
      (pp_print_list ~pp_sep:(fun _ _ -> fprintf fmt "\n") pp_binding)
      lst
  | _ -> fprintf fmt "?"
;;

type interpret_err =
  | Division_by_zero
  | Unbound of string
  | Non_exaust
  | Type_error of string
  | Incorrect_eval of expr
  | Application of expr
  | Another of string
  | Undefined
[@@deriving eq, show { with_path = false }]

type decl_binding = id * expr [@@deriving eq]
type interpret_ok = decl_binding list [@@deriving eq]

let pp_interpret_err fmt = function
  | Unbound str -> fprintf fmt "Unbound value %s" str
  | Division_by_zero -> fprintf fmt "Division by zero"
  | Type_error str -> fprintf fmt "%s" str
  | Incorrect_eval value -> fprintf fmt "Value %a is of incorrect type" pp_expr value
  | Non_exaust -> fprintf fmt "Non-exhaustive patterns in case"
  | Application expr -> fprintf fmt "Application error: %a shoud be function" pp_expr expr
  | Undefined -> fprintf fmt "Undefined"
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

  let id_equal pat expr =
    match pat, expr with
    | PVar p, EVar e -> p = e
    | _ -> false
  ;;

  let merge_env env1 env2 =
    BindsMap.merge
      (fun _ x y ->
        match x, y with
        | Some x, _ -> Some x
        | None, Some y -> Some y
        | _ -> None)
      env1
      env2
  ;;

  let print_map (m : expr option ref BindsMap.t) =
    let string_of_option = function
      | { contents = Some v } -> printf "%a\n" pp_expr v
      | { contents = None } -> printf "None\n"
    in
    let print_note key (value : 'a option ref) =
      print_string (key ^ ": ");
      string_of_option value
    in
    BindsMap.iter print_note m;
    print_string "\n==========================\n"
  ;;

  let extend_env : env -> interpret_ok -> env =
   fun env binds ->
    List.fold_left (fun env (id, v) -> BindsMap.add id (ref (Some v)) env) env binds
 ;;

  let rec pattern_bindings : pat -> id list = function
    | PWild | PNull | PConst _ | PUnit -> []
    | PVar name -> [ name ]
    | PTuple elems -> List.concat_map (fun x -> pattern_bindings x) elems
    | PCons (l, r) -> pattern_bindings l @ pattern_bindings r
    | PAdt (_, _) -> []
  ;;

  let rec check_pattern pattern expr =
    (* printf "CHECK_PATTERN: %a ?= %a\n" pp_pat pattern pp_expr expr; *)
    match pattern, expr with
    | PVar _, _ -> true
    | PWild, _ -> true
    | PConst (CInt c), EConst (CInt v) -> c = v
    | PConst (CString c), EConst (CString v) -> c = v
    | PConst (CBool c), EConst (CBool v) -> c = v
    | PCons (phd, ptl), ECons (vhd, vtl) -> check_pattern phd vhd && check_pattern ptl vtl
    | PNull, ENull -> true
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
    | Undefined, _, _ | _, Undefined, _ -> fail @@ Unbound "name"
    | _ -> fail (Incorrect_eval (EBinOp (op, l, r)))
  ;;

  let calc_un_op e op =
    match e, op with
    | EConst c, op ->
      (match c, op with
      | CInt i, Minus -> return (cint (-i))
      | CBool b, Not -> return (cbool (not b))
      | _ -> fail (Type_error "Incompatible types"))
    | ETuple (f :: _), Fst -> return f
    | ETuple (_ :: s :: _), Snd -> return s
    | ETuple _, _ -> fail (Type_error "Expected suitable Tuple")
    | ECons (hd, _), Head -> return hd
    | ECons (_, tl), Tail -> return tl
    | _ -> fail (Type_error "Incompatible types")
  ;;

  let binary_op op =
    EFun
      ( PVar "x"
      , EFun (PVar "y", EBinOp (op, EVar "x", EVar "y"), BindsMap.empty)
      , BindsMap.empty )
  ;;

  let unary_op op = EFun (PVar "x", EUnOp (op, EVar "x"), BindsMap.empty)

  let runtime =
    BindsMap.of_list
      [ "fst", ref (Some (unary_op Fst))
      ; "snd", ref (Some (unary_op Snd))
      ; "not", ref (Some (unary_op Not))
      ; "head", ref (Some (unary_op Head))
      ; "tail", ref (Some (unary_op Tail))
      ]
  ;;

  let rec eval : env -> expr -> (expr, interpret_err) t =
   fun env expr ->
    (* printf "EVAL: %a\n" pp_expr expr; *)
    match expr with
    | EVar name ->
      let* res = look_for_bind env name in
      eval env res
    | EConst _ -> return expr
    | ENull -> return ENull
    | EBinOp (op, e1, e2) ->
      let* e1' = eval env e1 in
      let* e2' = eval env e2 in
      calc_bin_op e1' e2' op
    | EUnOp (op, e) ->
      let* e' = eval env e in
      calc_un_op e' op
    | ETuple t -> all (List.map (fun e -> eval env e) t) >>| etuple
    | EIf (e1, e2, e3) ->
      let* rez = eval env e1 in
      (match rez with
      | EConst (CBool true) -> eval env e2
      | EConst (CBool false) -> eval env e3
      | err -> fail (Incorrect_eval err))
    | EFun (pattern, expr', closure) ->
      (match pattern with
      | PUnit -> eval (merge_env closure env) expr'
      | _ -> return expr)
    | ECons (hd, tl) ->
      let* vhd = eval env hd in
      let* vtl = eval env tl in
      return (ECons (vhd, vtl))
    | EApp _ ->
      let* e = process_application env expr in
      eval env e
    | ELet (binding_lst, expr) ->
      let env' = bindNames env binding_lst in
      eval env' expr
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
    | Undefined -> fail Undefined

  and pattern_decl_bindings : pat -> expr -> (interpret_ok, interpret_err) t =
   fun pattern expr ->
    (* printf "PDB: %a <~> %a\n" pp_pat pattern pp_expr expr; *)
    match pattern, expr with
    | PNull, ENull -> return []
    | PWild, _ -> return []
    | PVar name, v -> return [ name, v ]
    | PConst (CInt c), EConst (CInt v) when c = v -> return []
    | PConst (CInt _), EConst (CInt _) -> fail Non_exaust
    | PConst (CString c), EConst (CString v) when c = v -> return []
    | PConst (CString _), EConst (CString _) -> fail Non_exaust
    | PConst (CBool c), EConst (CBool v) when c = v -> return []
    | PConst (CBool _), EConst (CBool _) -> fail Non_exaust
    | PCons (l, r), ECons (hd, tl) ->
      pattern_decl_bindings l hd
      >>= fun hd_match ->
      pattern_decl_bindings r tl >>= fun tl_match -> return (hd_match @ tl_match)
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

  and eval_whnf env expr =
    (* printf "EVAL_WHNF: %a\n" pp_expr expr; *)
    match expr with
    | EVar name ->
      let* bind = look_for_bind env name in
      eval_whnf env bind
    | EConst c -> return (EConst c)
    | ENull -> return ENull
    | EBinOp (op, e1, e2) ->
      let* value1 = eval_whnf env e1 in
      let* value2 = eval_whnf env e2 in
      calc_bin_op value1 value2 op
    | EUnOp (op, e) ->
      let* value = eval_whnf env e in
      calc_un_op value op
    | ETuple t -> return (ETuple t)
    | EIf (e1, e2, e3) ->
      let* rez = eval_whnf env e1 in
      (match rez with
      | EConst (CBool true) -> eval_whnf env e2
      | EConst (CBool false) -> eval_whnf env e3
      | _ -> fail Non_exaust)
    | EFun _ -> return expr
    | ECons (hd, tl) -> return (ECons (hd, tl))
    | EApp _ ->
      let* e = process_application env expr in
      eval_whnf env e
    | ECase (expr, cases) ->
      let* value = eval_whnf env expr in
      (match
         List.find_opt
           (fun (pattern, _) ->
             (* printf "In Case\n";
             printf "MATCHING: %a <~> %a\n" pp_pat pattern pp_expr value; *)
             check_pattern pattern value)
           cases
       with
      | None -> fail Non_exaust
      | Some (pattern, expr) ->
        let* binds = pattern_decl_bindings pattern value in
        eval_whnf (extend_env env binds) expr)
    | ECtor (id, expr) ->
      let* value = eval_whnf env expr in
      return @@ ector id value
    | ELet (_, _) -> eval env expr
    | Undefined -> return Ast.Undefined

  and bindNames env = function
    | [] -> env
    | (pat, expr) :: bindings ->
      let other = bindNames env bindings in
      let current =
        match pat with
        | PVar name -> extend_env env [ name, expr ]
        | PWild | PNull -> env
        | PTuple (p1 :: p2 :: _) ->
          bindNames env [ p1, EApp (EVar "fst", expr); p2, EApp (EVar "snd", expr) ]
        | PCons (hd, tl) ->
          bindNames env [ hd, EApp (EVar "head", expr); tl, EApp (EVar "tail", expr) ]
        | PUnit -> env
        | _ -> failwith "Over 416. Not done\n"
      in
      merge_env other current

  and substitute env expr arg =
    (* printf "SUB: %a <= %a\n" pp_expr expr pp_expr arg; *)
    match expr with
    | EFun (pat, body, closure) ->
      (* print_string "HERE\n"; *)
      let value = EFun (PUnit, arg, env) in
      let closure' = bindNames closure [ pat, value ] in
      let lambda' =
        match body with
        | EFun (p, b, _) -> EFun (p, b, closure')
        | _ -> EFun (PUnit, body, closure')
      in
      (match pat with
      | PVar _ -> return lambda'
      | PUnit ->
        let* res = process_application closure body in
        substitute env res arg
      | _ -> return lambda')
    | _ ->
      let* expr' = eval_whnf env expr in
      substitute env expr' arg

  and process_application env expr =
    (* printf "PA: %a\n" pp_expr expr; *)
    match expr with
    | EApp (func, arg) ->
      let* lambda =
        match func with
        | EFun _ -> return func
        | EVar id -> look_for_bind env id
        | _ -> process_application env func
      in
      substitute env lambda arg
    | EVar id -> look_for_bind env id
    | _ ->
      printf "%a" Printast.pp_expr expr;
      fail (Application expr)

  and add_binding : binding -> (env, interpret_err) t -> (env, interpret_err) t =
   fun (pattern, expr) env ->
    (* printf "ADD_BINDING: %a <~> %a\n" pp_pat pattern pp_expr expr; *)
    let* env = env in
    let binds = pattern_bindings pattern in
    let env' =
      List.fold_left
        (fun e id ->
          (* printf "%s\n" id; *)
          try
            match !(BindsMap.find id e) with
            | Some _ -> e
            | None -> BindsMap.add id (ref None) e
          with
          | Not_found -> BindsMap.add id (ref None) e)
        env
        binds
    in
    let* value = eval env' expr in
    let* binds = pattern_decl_bindings pattern value in
    List.iter (fun (id, value) -> BindsMap.find id env' := Some value) binds;
    return env'
 ;;

  let std_env =
    let open Stdlib in
    let std_binds =
      stdlib
      |> List.map (fun code -> parse_with prog code |> Result.get_ok)
      |> List.flatten
    in
    let bindings =
      List.map
        (fun decl ->
          match decl with
          | DLet binding -> binding
          | DAdt _ -> failwith "Not yet")
        std_binds
    in
    List.fold_left
      (fun env binding -> add_binding binding env)
      (return BindsMap.empty)
      bindings
  ;;

  let run program =
    let* std_env = std_env in
    let start_env = merge_env std_env runtime in
    let* binds, _ =
      List.fold_left
        (fun acc -> function
          | DAdt _ -> acc
          | DLet binding ->
            let* binds, env = acc in
            let* env = add_binding binding (return env) in
            (* print_map env; *)
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
        (return ([], start_env))
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

(* let%test _ = test {|
x = let square x = x * x in (square 5) - 1|} [ "x", cint 24 ] *)

(* let%test _ =
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
;; *)

(* let%test _ =
  test
    {|
flag = let is_zero x y = case (x, y) of
                              (0, 0) -> True
                              _ -> False
in is_zero 1 1|}
    [ "flag", cbool false ]
;; *)

let%test _ = test_err {|
x = (677 - 433) * 19929 / (2022 / 2 - 1011)|} Division_by_zero

let%test _ = test_err {|
x = some + 27|} (Unbound "some")

(* let%test _ =
  test_err
    {|
x = let f x = case x of 
                0 -> "0"
                1 -> "1"
in f 2
|}
    Non_exaust
;; *)
