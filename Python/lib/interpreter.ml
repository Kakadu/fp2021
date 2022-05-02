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
    | VList of value list
    | VNone

  type vars = (identifier, value) Hashtbl.t
  type methods = (identifier, params * statements list) Hashtbl.t

  type scope =
    | Global
    | Class of identifier

  let rec map f = function
    | [] -> return []
    | h :: tl -> f h >>= fun c -> map f tl >>= fun lst -> return (c :: lst)
  ;;

  let rec iter2 f l1 l2 =
    match l1, l2 with
    | [], [] -> return ()
    | a1 :: l1, a2 :: l2 -> f a1 a2 >>= fun _ -> iter2 f l1 l2
    | _, _ -> error "different list size!"
  ;;

  type class_ctx =
    { id : identifier
    ; methods : methods
    ; fields : vars
    }

  type global_ctx =
    { local_vars : vars
    ; return_v : value
    ; methods : methods
    ; scope : scope
    ; classes : (identifier, class_ctx) Hashtbl.t (* class instances are here too*)
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
    | Var (VarName (_, id)) -> get_var ctx.local_vars id
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
      let push_args_to_local_vars local ctx =
        let vars = Hashtbl.create 16 in
        map (fun e -> eval_expr ctx e) args
        >>= fun vals ->
        iter2 (fun id v -> return @@ Hashtbl.replace vars id v) local vals
        >>= fun _ -> return vars
      in
      (match Hashtbl.find_opt ctx.classes instance_name with
      | Some cls ->
        (match Hashtbl.find_opt cls.methods method_name with
        | Some methd ->
          let try_eval_method (params, body) =
            push_args_to_local_vars params ctx
            >>= fun vars ->
            eval_method
              { ctx with local_vars = vars; scope = Class cls.id; return_v = VNone }
              body
          in
          try_eval_method methd
        | None -> error "method doesn't exist in class")
      | None -> error "class instance doesn't exist")
    | MethodCall (method_name, args) ->
      let push_args_to_local_vars local ctx =
        let vars = Hashtbl.create 16 in
        map (fun e -> eval_expr ctx e) args
        >>= fun vals ->
        iter2 (fun id v -> return @@ Hashtbl.replace vars id v) local vals
        >>= fun _ -> return vars
      in
      (match Hashtbl.find_opt ctx.methods method_name with
      | Some methd ->
        let try_eval_method (params, body) =
          push_args_to_local_vars params ctx
          >>= fun vars -> eval_method { ctx with local_vars = vars } body
        in
        try_eval_method methd
      | None -> error "fail with field access")
    | Lambda _ -> error "not implemented"

  and eval_method ctx = function
    | [] -> return ctx.return_v
    | [ Return exprs ] -> eval_return exprs ctx
    | stmt :: stmts ->
      eval_stmt ctx stmt
      >>= fun x ->
      let cur_res = x.return_v in
      (match cur_res with
      | VNone -> eval_method x stmts
      | v -> return v)

  and eval_return exprs ctx =
    match exprs with
    | [] -> return VNone
    | [ e ] -> eval_expr ctx e >>= fun res -> return res
    | _ as expr_list ->
      map (fun expr -> eval_expr ctx expr) expr_list
      >>= fun res_list -> return (VList res_list)

  and eval_stmt ctx = function
    | Expression e -> eval_expr ctx e >>= fun v -> return { ctx with return_v = v }
    | Assign (exprs, vals) ->
      let set_value_to_var value = function
        | Var (VarName (Local, id)) -> return (Hashtbl.replace ctx.local_vars id value)
        | _ -> error "sad"
      in
      map (fun expr -> eval_expr ctx expr) vals
      >>= fun vs -> iter2 set_value_to_var vs exprs >>= fun _ -> return ctx
    | MethodDef (id, params, stmts) ->
      let add_method_to_class class_name =
        get_var ctx.classes class_name
        >>= fun cur_class ->
        return (Hashtbl.replace cur_class.methods id (params, stmts))
        >>= fun _ -> return ctx
      in
      (match ctx.scope with
      | Class class_name -> add_method_to_class class_name >>= fun _ -> return ctx
      | Global ->
        return (Hashtbl.replace ctx.methods id (params, stmts)) >>= fun _ -> return ctx)
    | If _ -> error "not implemented"
    | Else _ -> error "not implemented"
    | While _ -> error "not implemented"
    | For _ -> error "not implemented"
    | Return exprs -> eval_return exprs ctx >>= fun v -> return { ctx with return_v = v }
    | _ -> error "PARSER FAIL"

  and eval_prog ctx = function
    | [] -> return VNone
    | [ x ] -> eval_stmt ctx x >>= fun ctx_upd -> return ctx_upd.return_v
    | stmt :: stmts -> eval_stmt ctx stmt >>= fun ctx_upd -> eval_prog ctx_upd stmts
  ;;

  let init_global_ctx () =
    let methods = Hashtbl.create 16 in
    let add_test_method =
      Hashtbl.add
        methods
        "a"
        ([], [ Return [ ArithOp (Add, Const (Integer 5), Const (Integer 4)) ] ])
    in
    { local_vars = Hashtbl.create 16
    ; methods
    ; scope = Global
    ; classes = Hashtbl.create 16
    ; return_v = VNone
    }
  ;;

  let set_var id v ctx = Hashtbl.replace ctx.local_vars id v
  let global_ctx = init_global_ctx ()
end

open Eval (Result)

let%test _ =
  eval_expr
    global_ctx
    (ArithOp (Add, ArithOp (Add, Const (Integer 5), Const (Integer 4)), Const (Integer 4)))
  = Result.return (VInt 13)
;;

let%test _ = eval_expr global_ctx (MethodCall ("a", [])) = Result.return (VInt 9)

let%test _ =
  eval_prog
    global_ctx
    [ Assign
        ( [ Var (VarName (Local, "x")); Var (VarName (Local, "y")) ]
        , [ Const (Integer 5); Const (Integer 6) ] )
    ]
  = Result.return VNone
;;

let%test _ =
  eval_prog
    global_ctx
    [ MethodDef
        ( "sum"
        , [ "x"; "y" ]
        , [ Return
              [ ArithOp (Add, Var (VarName (Local, "x")), Var (VarName (Local, "y"))) ]
          ] )
    ; Return [ MethodCall ("sum", [ Const (Integer 5); Const (Integer 5) ]) ]
    ]
  = Result.return (VInt 10)
;;
