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
  | _ -> fprintf fmt "I have no idea"
;;

let pp_decl_binding fmt (name, value) = fprintf fmt "val %s = %a" name pp_value value
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

  let exten_env env binds =
    List.fold_left (fun env (id, v) -> BindsMap.add id (ref (Some v)) env) env binds
  ;;

  let rec pattern_bindings = function
    | PWild | PNull | PConst _ -> []
    | PVar name -> [ name ]
    | PTuple elems -> List.concat_map (fun x -> pattern_bindings x) elems
    | PCons (l, r) -> pattern_bindings l @ pattern_bindings r
    | PACase (_, _) -> []
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
    | PACase (pid, p), VAdt (vid, v) when pid = vid -> pattern_decl_bindings p v
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
    | PACase (pid, p), VAdt (vid, v) -> pid = vid && check_pattern p v
    | _ -> false
  ;;

  let rec eval expr env =
    match expr with
    | EVar name -> look_for_bind env name
    | EConst c ->
      (match c with
      | CInt c -> return (VInt c)
      | CString c -> return (VString c)
      | CBool c -> return (VBool c))
    | ENull -> return (VList [])
    | EBinOp (op, e1, e2) ->
      let* value1 = eval e1 env in
      let* value2 = eval e2 env in
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
    | ETuple t -> all (List.map (fun e -> eval e env) t) >>| vtuple
    | EIf (e1, e2, e3) ->
      let* rez = eval e1 env in
      (match rez with
      | VBool true -> eval e2 env
      | VBool false -> eval e3 env
      | err -> fail (Incorrect_eval err))
    | EFun (pattern, expr) -> return (VFun (pattern, expr, env))
    | ECons (hd, tl) ->
      let* vhd = eval hd env in
      let* vtl = eval tl env in
      (match vtl with
      | VList l -> return (VList (vhd :: l))
      | _ -> fail (Incorrect_eval vtl))
    | EApp (fn_expr, arg_expr) ->
      let* fn_value = eval fn_expr env in
      let* arg_value = eval arg_expr env in
      (match fn_value with
      | VFun (pattern, expr, env) ->
        let* binds = pattern_decl_bindings pattern arg_value in
        eval expr (exten_env env binds)
      | _ -> fail (Incorrect_eval fn_value))
    | ELet (binding, expr) ->
      let* env = add_binding binding env in
      eval expr env
    | ECase (expr, cases) ->
      let* value = eval expr env in
      (match List.find_opt (fun (pattern, _) -> check_pattern pattern value) cases with
      | None -> fail Non_exaust
      | Some (pattern, expr) ->
        let* binds = pattern_decl_bindings pattern value in
        eval expr (exten_env env binds))
    | ECtor (id, expr) ->
      let* value = eval expr env in
      return @@ vadt id value
    | _ -> eval (EConst (CInt 1)) env

  and add_binding (pattern, expr) env =
    let binds = pattern_bindings pattern in
    let env = List.fold_left (fun env id -> BindsMap.add id (ref None) env) env binds in
    let* value = eval expr env in
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
  | Error err -> fprintf fmt "Error:\n%a\n" pp_interpret_err err
;;

let code =
  {|
let x = 2 + 5
let f x y = x + y
let p = f 5 10
let fac n = if n == 1 then n else n * fac (n - 1) 
let y = fac 5
let b = (True && (5 > 4))
let xs = [1,2,3,4]
let x = "Hello" <> "Hello"
|}
;;

let (code : string) =
  {|
data Shape = Circle Int
let c = Circle 3
let surface (Circle r) = 3 * r * r
let p = surface c
let r = Rectangle (Point 0 0) (Point 2 2)
let surface (Rectangle (Point x1 y1) (Point x2 y2)) = (x2-x1) * (y2-y1)
let p = surface r
|}
;;

let funct code =
  match run_interpret code with
  | Ok ok -> Caml.Format.printf "%a\n" pp_interpret_ok ok
  | Error err -> Caml.Format.printf "%a\n" pp_interpret_err err
;;

let rez = funct code
