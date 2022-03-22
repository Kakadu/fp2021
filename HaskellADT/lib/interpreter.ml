open Format
open Parser
open Ast

module type MONADERROR = sig
  include Base.Monad.S2

  val fail : 'e -> ('a, 'e) t
  val ( let* ) : ('a, 'e) t -> ('a -> ('b, 'e) t) -> ('b, 'e) t
end

module BindsMap = Map.Make (String)

type value =
  | VString of string
  | VBool of bool
  | VInt of int
  | VList of value list
  | VTuple of value list
  | VFun of pat * expr * env
  | VAdt of id * value
[@@deriving eq]

and env = value option ref BindsMap.t

let vint i = VInt i
let vstring s = VString s
let vbool b = VBool b
let vtuple t = VTuple t
let vlist l = VList l
let vadt i v = VAdt (i, v)

let rec pp_value fmt = function
  | VInt i -> fprintf fmt "%d" i
  | VString s -> fprintf fmt "%s" s
  | VBool b -> if b then fprintf fmt "True" else fprintf fmt "False"
  | VTuple t ->
    fprintf fmt "(%a)" (pp_print_list ~pp_sep:(fun _ _ -> fprintf fmt ", ") pp_value) t
  | VList l ->
    fprintf fmt "[%a]" (pp_print_list ~pp_sep:(fun _ _ -> fprintf fmt ", ") pp_value) l
  | VFun _ -> fprintf fmt "<fun>"
  | VAdt (id, value) -> fprintf fmt "%s %a" id pp_value value
;;

type interpret_err =
  | Division_by_zero
  | Unbound of string
  | Non_exaust
  | Incorrect_eval of value
[@@deriving eq, show { with_path = false }]

type decl_binding = id * value [@@deriving eq]
type interpret_ok = decl_binding list [@@deriving eq]

let pp_interpret_err fmt = function
  | Unbound str -> fprintf fmt "Unbound value %s" str
  | Division_by_zero -> fprintf fmt "Division by zero"
  | Incorrect_eval value -> fprintf fmt "Value %a is of incorrect type" pp_value value
  | Non_exaust -> fprintf fmt "Non-exhaustive patterns in case"
;;

let pp_decl_binding fmt (name, value) = fprintf fmt "%s = %a" name pp_value value
let pp_interpret_ok = pp_print_list ~pp_sep:pp_force_newline pp_decl_binding

module Interpret (M : MONADERROR) : sig
  val run : prog -> (interpret_ok, interpret_err) M.t
end = struct
  open M

  let look_for_bind (map : env) name =
    try
      match !(BindsMap.find name map) with
      | Some v -> return v
      | None -> fail (Unbound name)
    with
    | Not_found -> fail (Unbound name)
  ;;

  let extend_env env binds =
    List.fold_left (fun env (id, v) -> BindsMap.add id (ref (Some v)) env) env binds
  ;;

  let rec pattern_bindings = function
    | PWild | PNull | PConst _ -> []
    | PVar name -> [ name ]
    | PTuple elems -> List.concat_map (fun x -> pattern_bindings x) elems
    | PCons (l, r) -> pattern_bindings l @ pattern_bindings r
    | PAdt (_, _) -> []
  ;;

  let rec pattern_decl_bindings pattern value =
    match pattern, value with
    | PNull, VList [] -> return []
    | PWild, _ -> return []
    | PVar name, v -> return [ name, v ]
    | PConst (CInt c), VInt v when c = v -> return []
    | PConst (CInt _), VInt _ -> fail Non_exaust
    | PConst (CString c), VString v when c = v -> return []
    | PConst (CString _), VString _ -> fail Non_exaust
    | PConst (CBool c), VBool v when c = v -> return []
    | PConst (CBool _), VBool _ -> fail Non_exaust
    | PCons (l, r), VList (hd :: tl) ->
      pattern_decl_bindings l hd
      >>= fun hd_match ->
      pattern_decl_bindings r (VList tl) >>= fun tl_match -> return (hd_match @ tl_match)
    | PTuple elems, VTuple vs ->
      (match elems, vs with
      | [], [] -> return []
      | elems_hd :: elems_tl, vs_hd :: vs_tl ->
        pattern_decl_bindings elems_hd vs_hd
        >>= fun bind_hd ->
        pattern_decl_bindings (PTuple elems_tl) (VTuple vs_tl)
        >>= fun bind_tl -> return (bind_hd @ bind_tl)
      | _ -> fail Non_exaust)
    | PAdt (pid, p), VAdt (vid, v) when pid = vid -> pattern_decl_bindings p v
    | _ -> fail Non_exaust
  ;;

  let rec check_pattern pattern value =
    match pattern, value with
    | PVar _, _ -> true
    | PWild, _ -> true
    | PConst (CInt c), VInt v -> c = v
    | PConst (CString c), VString v -> c = v
    | PConst (CBool c), VBool v -> c = v
    | PCons (phd, ptl), VList (vhd :: vtl) ->
      check_pattern phd vhd && check_pattern ptl (VList vtl)
    | PNull, VList [] -> true
    | PTuple p, VTuple v ->
      List.length p = List.length v && List.for_all2 (fun p v -> check_pattern p v) p v
    | PAdt (pid, p), VAdt (vid, v) -> pid = vid && check_pattern p v
    | _ -> false
  ;;

  let rec eval env = function
    | EVar name -> look_for_bind env name
    | EConst c ->
      (match c with
      | CInt c -> return (VInt c)
      | CString c -> return (VString c)
      | CBool c -> return (VBool c))
    | ENull -> return (VList [])
    | EBinOp (op, e1, e2) ->
      let* value1 = eval env e1 in
      let* value2 = eval env e2 in
      (match value1, value2, op with
      | VInt x, VInt y, Add -> return (VInt (x + y))
      | VInt x, VInt y, Sub -> return (VInt (x - y))
      | VInt x, VInt y, Mul -> return (VInt (x * y))
      | VInt x, VInt y, Div ->
        if y = 0 then fail Division_by_zero else return (VInt (x / y))
      | VInt x, VInt y, EQ -> return (VBool (x = y))
      | VInt x, VInt y, NE -> return (VBool (x != y))
      | VInt x, VInt y, LE -> return (VBool (x <= y))
      | VInt x, VInt y, LT -> return (VBool (x < y))
      | VInt x, VInt y, GE -> return (VBool (x >= y))
      | VInt x, VInt y, GT -> return (VBool (x > y))
      | VBool x, VBool y, And -> return (VBool (x && y))
      | VBool x, VBool y, Or -> return (VBool (x || y))
      | VBool x, VBool y, EQ -> return (VBool (x = y))
      | VBool x, VBool y, NE -> return (VBool (x != y))
      | VString x, VString y, EQ -> return (VBool (x = y))
      | VString x, VString y, NE -> return (VBool (x <> y))
      | _ -> fail (Incorrect_eval (VTuple [ value1; value2 ])))
    | ETuple t -> all (List.map (fun e -> eval env e) t) >>| vtuple
    | EIf (e1, e2, e3) ->
      let* rez = eval env e1 in
      (match rez with
      | VBool true -> eval env e2
      | VBool false -> eval env e3
      | err -> fail (Incorrect_eval err))
    | EFun (pattern, expr) -> return (VFun (pattern, expr, env))
    | ECons (hd, tl) ->
      let* vhd = eval env hd in
      let* vtl = eval env tl in
      (match vtl with
      | VList l -> return (VList (vhd :: l))
      | _ -> fail (Incorrect_eval vtl))
    | EApp (fn_expr, arg_expr) ->
      let* fn_value = eval env fn_expr in
      let* arg_value = eval env arg_expr in
      (match fn_value with
      | VFun (pattern, expr, env) ->
        let* binds = pattern_decl_bindings pattern arg_value in
        eval (extend_env env binds) expr
      | _ -> fail (Incorrect_eval fn_value))
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
      return @@ vadt id value

  and add_binding (pattern, expr) env =
    let binds = pattern_bindings pattern in
    let env = List.fold_left (fun env id -> BindsMap.add id (ref None) env) env binds in
    let* value = eval env expr in
    let* binds = pattern_decl_bindings pattern value in
    List.iter (fun (id, value) -> BindsMap.find id env := Some value) binds;
    return env
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
|} [ "y", VInt 20; "x", VInt 10 ]

let%test _ = test {|
x = 2022 / 2 - 505 * 2|} [ "x", VInt 1 ]

let%test _ = test {|
x = let square x = x * x in (square 5) - 1|} [ "x", VInt 24 ]

let%test _ =
  test
    {|
data Point = Point Int Int
data Shape = Circle Point Int
circle = Circle (Point 0 0) 4
s = let surface (Circle _ r) = 3 * r * r in surface circle|}
    [ ( "circle"
      , VAdt ("Circle", VTuple [ VAdt ("Point", VTuple [ VInt 0; VInt 0 ]); VInt 4 ]) )
    ; "s", VInt 48
    ]
;;

let%test _ =
  test
    {|
flag = let is_zero x y = case (x, y) of
                              (0, 0) -> True
                              _ -> False
in is_zero 1 1|}
    [ "flag", VBool false ]
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
