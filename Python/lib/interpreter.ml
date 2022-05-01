open Ast

module type MONAD = sig
  type 'a t

  val return : 'a -> 'a t
  val ( >>= ) : 'a t -> ('a -> 'b t) -> 'b t
end

module type MONADERROR = sig
  include MONAD

  val error : string -> 'a t
end

module Result = struct
  type 'a t = ('a, string) Result.t

  let ( >>= ) = Result.bind
  let return = Result.ok
  let error = Result.error
end

module Eval (M : MONADERROR) = struct
  open M

  type value =
    | VInt of int
    | VFloat of float
    | VBool of bool
    | VString of string

  type vars = (identifier, value) Hashtbl.t
  type methods = (identifier, params * statements list) Hashtbl.t

  type class_ctx =
    { id : identifier
    ; methods : methods
    ; fields : vars
    }

  type global_ctx =
    { local_vars : vars
    ; return_v : value
    ; methods : methods
    ; classes : (identifier, class_ctx) Hashtbl.t
    }

  let check_is_already_exist tbl key =
    match Hashtbl.find_opt tbl key with
    | Some _ -> true
    | None -> false
  ;;

  let get_var tbl key =
    match Hashtbl.find_opt tbl key with
    | Some v -> return v
    | None -> error "unknown variable"
  ;;

  let rec eval_expr ctx = function
    | Const x ->
      (match x with
      | Integer i -> return (VInt i)
      | Float f -> return (VFloat f)
      | String s -> return (VString s)
      | Bool b -> return (VBool b))
    | Var (VarName (_, v)) -> get_var ctx.local_vars v
    | ArithOp (op, e1, e2) ->
      eval_expr ctx e1
      >>= fun l ->
      eval_expr ctx e2
      >>= fun r ->
      (match op with
      | Add ->
        (match l, r with
        | VInt i1, VInt i2 -> return (VInt (i1 + i2))
        | VFloat f1, VFloat f2 -> return (VFloat (f1 +. f2))
        | VFloat f, VInt i -> return (VFloat (f +. float_of_int i))
        | VInt i, VFloat f -> return (VFloat (float_of_int i +. f))
        | VString s1, VString s2 -> return (VString (s1 ^ s2))
        | _ -> error "fail with +")
      | Mul ->
        (match l, r with
        | VInt i1, VInt i2 -> return (VInt (i1 * i2))
        | VFloat f1, VFloat f2 -> return (VFloat (f1 *. f2))
        | VFloat f, VInt i -> return (VFloat (f *. float_of_int i))
        | VInt i, VFloat f -> return (VFloat (float_of_int i *. f))
        | _ -> error "fail with *")
      | Sub ->
        (match l, r with
        | VInt i1, VInt i2 -> return (VInt (i1 - i2))
        | VFloat f1, VFloat f2 -> return (VFloat (f1 -. f2))
        | VFloat f, VInt i -> return (VFloat (f -. float_of_int i))
        | VInt i, VFloat f -> return (VFloat (float_of_int i -. f))
        | _ -> error "fail with -")
      | Div ->
        (match l, r with
        | VInt _, VInt 0 | VFloat _, VInt 0 | VFloat _, VFloat 0.0 | VInt _, VFloat 0.0 ->
          error "division by zero"
        | VFloat f1, VFloat f2 -> return (VFloat (f1 /. f2))
        | VFloat f, VInt i -> return (VFloat (f +. float_of_int i))
        | VInt i, VFloat f -> return (VFloat (float_of_int i +. f))
        | _ -> error "fail with +")
      | Mod ->
        (match l, r with
        | VInt _, VInt 0 | VFloat _, VInt 0 | VFloat _, VFloat 0.0 | VInt _, VFloat 0.0 ->
          error "division by zero"
        | VInt i1, VInt i2 -> return (VInt (i1 mod i2))
        | _ -> error "fail with mod"))
    | BoolOp (op, e1, e2) ->
      eval_expr ctx e1
      >>= fun l ->
      eval_expr ctx e2
      >>= fun r ->
      (match op with
      | And ->
        (match l, r with
        | VBool true, VBool true -> return (VBool true)
        | _ -> return (VBool false))
      | Or ->
        (match l, r with
        | VBool false, VBool false -> return (VBool false)
        | _ -> return (VBool true)))
    | UnaryOp (Not, e1) ->
      eval_expr ctx e1
      >>= fun l ->
      (match l with
      | VBool false -> return (VBool true)
      | VBool true -> return (VBool false)
      | _ -> error "fail with NOT")
    | Eq (e1, e2) ->
      eval_expr ctx e1 >>= fun l -> eval_expr ctx e2 >>= fun r -> return (VBool (l = r))
    | NotEq (e1, e2) ->
      eval_expr ctx e1 >>= fun l -> eval_expr ctx e2 >>= fun r -> return (VBool (l != r))
    | Gr (e1, e2) ->
      eval_expr ctx e1 >>= fun l -> eval_expr ctx e2 >>= fun r -> return (VBool (l > r))
    | Gre (e1, e2) ->
      eval_expr ctx e1 >>= fun l -> eval_expr ctx e2 >>= fun r -> return (VBool (l >= r))
    | Ls (e1, e2) ->
      eval_expr ctx e1 >>= fun l -> eval_expr ctx e2 >>= fun r -> return (VBool (l < r))
    | Lse (e1, e2) ->
      eval_expr ctx e1 >>= fun l -> eval_expr ctx e2 >>= fun r -> return (VBool (l <= r))
    | List _ -> error "not implemented"
    | FieldAccess (instance_name, field_name) ->
      (match Hashtbl.find_opt ctx.classes instance_name with
      | Some mths -> get_var mths.fields field_name
      | None -> error "fail with field access")
    | MethodAccess (instance_name, method_name, args) ->
      (match Hashtbl.find_opt ctx.classes instance_name with
      | Some methd -> eval_method
      | None -> error "fail with field access")
    | MethodCall (method_name, args) ->
      (match Hashtbl.find_opt ctx.methods method_name with
      | Some methd -> eval_method
      | None -> error "fail with field access")
    | Lambda _ -> error "not implemented"

  and eval_method = error "not implemented"

  let init_global_ctx () =
    let _classes = Hashtbl.create 16 in
    { local_vars = Hashtbl.create 16
    ; methods = Hashtbl.create 16
    ; classes = _classes
    ; return_v = VBool true
    }
  ;;

  let set_var id v ctx = Hashtbl.replace ctx.local_vars id v
  let test_ctx = init_global_ctx ()

  let%test _ =
    eval_expr
      test_ctx
      (ArithOp
         (Add, ArithOp (Add, Const (Integer 5), Const (Integer 4)), Const (Integer 4)))
    = return (VInt 13)
  ;;
end
