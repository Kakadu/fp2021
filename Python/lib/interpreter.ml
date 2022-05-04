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
    | VClassRef of identifier * value list
    | VList of value list
    | VNone

  type var =
    { id : identifier
    ; v : value
    }

  type method_ctx =
    { id : identifier
    ; args : params
    ; body : statements list
    }

  type vars = var list
  type methods = method_ctx list

  type scope =
    | Global
    | Class of identifier
    | Instance of identifier

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

  type instance =
    { id : identifier
    ; class_id : identifier
    ; methods : methods
    ; fields : vars
    }

  type global_ctx =
    { local_vars : vars
    ; return_v : value
    ; methods : methods
    ; scope : scope
    ; classes : class_ctx list
    ; instances : instance list
    ; last_if : value * value (* was if before * value of if expr*)
    }

  let string_of_value = function
    | VInt i -> return (string_of_int i)
    | _ -> error "not implemented"
  ;;

  let is_instance_exist key lst =
    let rec check = function
      | h :: t -> if h.id = key then true else check t
      | [] -> false
    in
    check lst
  ;;

  let is_var_exist key (lst : vars) =
    let rec check = function
      | (h : var) :: t -> if h.id = key then true else check t
      | [] -> false
    in
    check lst
  ;;

  let is_class_exist key (lst : class_ctx list) =
    let rec check = function
      | (h : class_ctx) :: t -> if h.id = key then true else check t
      | [] -> false
    in
    check lst
  ;;

  let is_method_exist key (lst : methods) =
    let rec check = function
      | (h : method_ctx) :: t -> if h.id = key then true else check t
      | [] -> false
    in
    check lst
  ;;

  let get_var key (lst : vars) =
    let rec get key (lst : vars) =
      match lst with
      | h :: t -> if h.id = key then return h.v else get key t
      | _ -> error "unknown variable"
    in
    get key lst
  ;;

  let get_class key (lst : class_ctx list) =
    let rec get key (lst : class_ctx list) =
      match lst with
      | h :: t -> if h.id = key then return h else get key t
      | _ -> error "unknown class"
    in
    get key lst
  ;;

  let get_instance key (lst : instance list) =
    let rec get key (lst : instance list) =
      match lst with
      | h :: t -> if h.id = key then return h else get key t
      | _ -> error "unknown instance"
    in
    get key lst
  ;;

  let get_method key (lst : methods) =
    let rec get key (lst : methods) =
      match lst with
      | h :: t -> if h.id = key then return h else get key t
      | _ -> error "unknown instance"
    in
    get key lst
  ;;

  let add_or_update_var (variable : var) (lst : vars) =
    let rec merge acc = function
      | [] ->
        (match acc with
        | [] -> return [ variable ]
        | _ -> return acc)
      | (h : var) :: t ->
        (match is_var_exist variable.id lst with
        | true ->
          if h.id = variable.id
          then merge ({ id = h.id; v = variable.v } :: acc) t
          else merge (h :: acc) t
        | false -> return (variable :: lst))
    in
    merge [] lst >>= fun t -> return t
  ;;

  let add_or_update_instance (inst : instance) (lst : instance list) =
    let rec merge acc = function
      | [] ->
        (match acc with
        | [] -> return [ inst ]
        | _ -> return acc)
      | (h : instance) :: t ->
        (match is_instance_exist inst.id lst with
        | true ->
          if h.id = inst.id
          then
            merge
              ({ id = h.id
               ; class_id = inst.class_id
               ; fields = inst.fields
               ; methods = inst.methods
               }
              :: acc)
              t
          else merge (h :: acc) t
        | false -> return (inst :: lst))
    in
    merge [] lst >>= fun t -> return t
  ;;

  let add_or_update_method (mthd : method_ctx) (lst : methods) =
    let rec merge acc = function
      | [] ->
        (match acc with
        | [] -> return [ mthd ]
        | _ -> return acc)
      | (h : method_ctx) :: t ->
        (match is_method_exist mthd.id lst with
        | true ->
          if h.id = mthd.id
          then merge ({ id = h.id; args = mthd.args; body = mthd.body } :: acc) t
          else merge (h :: acc) t
        | false -> return (mthd :: lst))
    in
    merge [] lst
  ;;

  let add_or_update_class id (cls : global_ctx) (lst : class_ctx list) =
    let rec merge (acc : class_ctx list) = function
      | [] ->
        (match acc with
        | [] -> return [ { id; methods = cls.methods; fields = cls.local_vars } ]
        | _ -> return acc)
      | (h : class_ctx) :: t ->
        (match is_class_exist id lst with
        | true ->
          if h.id = id
          then merge ({ id; methods = cls.methods; fields = cls.local_vars } :: acc) t
          else merge (h :: acc) t
        | false -> return (h :: lst))
    in
    merge [] lst
  ;;

  let rec merge_return_vals (acc : value list) = function
    | [] -> return acc
    | h :: t -> merge_return_vals (h.return_v :: acc) t
  ;;

  let rec eval_expr ctx expr =
    let rec get_val e =
      match e with
      | Const x ->
        (match x with
        | Integer i -> return (VInt i)
        | Float f -> return (VFloat f)
        | String s -> return (VString s)
        | Bool b -> return (VBool b)
        | Void -> return VNone)
      | Var (VarName (x, id)) ->
        (match ctx.scope with
        | Global ->
          (match is_var_exist id ctx.local_vars with
          | false -> error "unknown variable"
          | true -> get_var id ctx.local_vars)
        | Instance inst_id ->
          (match is_instance_exist inst_id ctx.instances with
          | false -> error "unknown instance"
          | true ->
            (match x with
            | Local -> get_var id ctx.local_vars
            | Class ->
              get_instance inst_id ctx.instances >>= fun inst -> get_var id inst.fields
            | _ -> error ""))
        | _ -> error "now isn't using")
      | ClassToInstance (id, args) ->
        (match is_class_exist id ctx.classes with
        | true -> map (fun e -> get_val e) args >>= fun a -> return (VClassRef (id, a))
        | false -> error "class doesn't exist")
      | ArithOp (op, e1, e2) ->
        get_val e1
        >>= fun l ->
        get_val e2
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
          | VInt _, VInt 0 | VFloat _, VInt 0 | VFloat _, VFloat 0.0 | VInt _, VFloat 0.0
            -> error "division by zero"
          | VFloat f1, VFloat f2 -> return (VFloat (f1 /. f2))
          | VFloat f, VInt i -> return (VFloat (f +. float_of_int i))
          | VInt i, VFloat f -> return (VFloat (float_of_int i +. f))
          | _ -> error "fail with +")
        | Mod ->
          (match l, r with
          | VInt _, VInt 0 | VFloat _, VInt 0 | VFloat _, VFloat 0.0 | VInt _, VFloat 0.0
            -> error "division by zero"
          | VInt i1, VInt i2 -> return (VInt (i1 mod i2))
          | _ -> error "fail with mod"))
      | BoolOp (op, e1, e2) ->
        get_val e1
        >>= fun l ->
        get_val e2
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
        get_val e1
        >>= fun l ->
        (match l with
        | VBool false -> return (VBool true)
        | VBool true -> return (VBool false)
        | _ -> error "fail with NOT")
      | Eq (e1, e2) ->
        get_val e1 >>= fun l -> get_val e2 >>= fun r -> return (VBool (l = r))
      | NotEq (e1, e2) ->
        get_val e1 >>= fun l -> get_val e2 >>= fun r -> return (VBool (l != r))
      | Gr (e1, e2) ->
        get_val e1 >>= fun l -> get_val e2 >>= fun r -> return (VBool (l > r))
      | Gre (e1, e2) ->
        get_val e1 >>= fun l -> get_val e2 >>= fun r -> return (VBool (l >= r))
      | Ls (e1, e2) ->
        get_val e1 >>= fun l -> get_val e2 >>= fun r -> return (VBool (l < r))
      | Lse (e1, e2) ->
        get_val e1 >>= fun l -> get_val e2 >>= fun r -> return (VBool (l <= r))
      | List exprs -> map (fun e -> get_val e) exprs >>= fun e -> return (VList e)
      | FieldAccess (instance_name, field_name) ->
        (match get_instance instance_name ctx.instances with
        | inst ->
          inst
          >>= fun i ->
          get_class i.class_id ctx.classes >>= fun c -> get_var field_name c.fields)
      | Lambda _ -> error "not implemented"
      | _ -> error "expr can effect on ctx"
    in
    match expr with
    | MethodAccess (instance_name, method_name, args) ->
      let rec set_values_to_vars values (args : identifier list) ctx_upd =
        match values, args with
        | h1 :: t1, h2 :: t2 ->
          add_or_update_var { id = h2; v = h1 } ctx_upd.local_vars
          >>= fun t -> set_values_to_vars t1 t2 { ctx_upd with local_vars = t }
        | [], [] -> return ctx_upd
        | _ -> error "different siz"
      in
      map (fun e -> get_val e) args
      >>= fun vals ->
      (match is_instance_exist instance_name ctx.instances with
      | false -> error "instance error"
      | true ->
        get_instance instance_name ctx.instances
        >>= fun i ->
        (match is_method_exist method_name i.methods with
        | false -> error "no method in class"
        | true ->
          let try_eval_method params body =
            get_method method_name i.methods
            >>= fun m ->
            set_values_to_vars
              params
              m.args
              { ctx with local_vars = []; scope = Instance i.id }
            >>= fun c -> eval_method c body
          in
          get_method method_name i.methods >>= fun m -> try_eval_method vals m.body))
    | MethodCall (method_name, args) ->
      let rec set_values_to_vars values (args : identifier list) ctx_upd =
        match values, args with
        | h1 :: t1, h2 :: t2 ->
          add_or_update_var { id = h2; v = h1 } ctx_upd.local_vars
          >>= fun t -> set_values_to_vars t1 t2 { ctx_upd with local_vars = t }
        | [], [] -> return ctx_upd
        | _ -> error "different siz"
      in
      map (fun e -> get_val e) args
      >>= fun vals ->
      (match is_method_exist method_name ctx.methods with
      | true ->
        let try_eval_method params body =
          get_method method_name ctx.methods
          >>= fun m ->
          set_values_to_vars params m.args { ctx with local_vars = [] }
          >>= fun c -> eval_method c body
        in
        get_method method_name ctx.methods >>= fun m -> try_eval_method vals m.body
      | false -> error "method doesnot exitst")
    | _ -> get_val expr >>= fun v -> return { ctx with return_v = v }

  and eval_method ctx = function
    | [] -> return ctx
    | [ Return exprs ] -> eval_return exprs ctx
    | stmt :: stmts ->
      eval_stmt ctx stmt
      >>= fun x ->
      let cur_res = x.return_v in
      (match cur_res with
      | VNone -> eval_method x stmts
      | v -> return { ctx with return_v = v })

  and eval_return exprs ctx =
    match exprs with
    | [] -> return { ctx with return_v = VNone }
    | [ e ] -> eval_expr ctx e >>= fun res -> return { ctx with return_v = res.return_v }
    | _ as expr_list ->
      map (fun expr -> eval_expr ctx expr) expr_list
      >>= fun res_list ->
      merge_return_vals [] res_list
      >>= fun v -> return { ctx with return_v = VList (List.rev v) }

  and eval_body ctx = function
    | [] -> return ctx
    | [ stmt ] -> eval_stmt ctx stmt >>= fun c -> return c
    | stmt :: stmts -> eval_stmt ctx stmt >>= fun c -> eval_body c stmts

  and eval_stmt ctx = function
    | Expression e -> eval_expr ctx e >>= fun upd -> return upd
    | Assign (exprs, vals) ->
      let rec set_values_to_vars values (vars : expression list) ctx_upd =
        match values, vars with
        | h1 :: t1, h2 :: t2 ->
          (match h2 with
          | Var (VarName (Local, id)) ->
            (match h1 with
            | VClassRef (class_id, _) ->
              get_class class_id ctx.classes
              >>= fun cls ->
              add_or_update_instance
                { id; class_id = cls.id; fields = cls.fields; methods = cls.methods }
                ctx.instances
              >>= fun t -> set_values_to_vars t1 t2 { ctx_upd with instances = t }
            | _ ->
              add_or_update_var { id; v = h1 } ctx_upd.local_vars
              >>= fun t -> set_values_to_vars t1 t2 { ctx_upd with local_vars = t })
          | Var (VarName (Class _, id)) ->
            (match ctx_upd.scope with
            | Instance inst_id ->
              get_instance inst_id ctx_upd.instances
              >>= fun i ->
              add_or_update_var { id; v = h1 } i.fields
              >>= fun fields_upd ->
              add_or_update_instance
                { id = inst_id
                ; class_id = i.id
                ; fields = fields_upd
                ; methods = i.methods
                }
                ctx_upd.instances
              >>= fun new_insta ->
              set_values_to_vars t1 t2 { ctx_upd with instances = new_insta }
            | _ -> error "Asd")
          | _ -> error "asd")
        | [], [] -> return ctx_upd
        | _ -> error "different siz"
      in
      map (fun expr -> eval_expr ctx expr) vals
      >>= fun vs ->
      merge_return_vals [] vs
      >>= fun vs_ -> set_values_to_vars vs_ exprs ctx >>= fun c -> return c
    | MethodDef (id, params, stmts) ->
      let add_method_to_class class_name =
        get_class class_name ctx.classes
        >>= fun cur_class ->
        add_or_update_method { id; args = params; body = stmts } cur_class.methods
        >>= fun c -> return { ctx with methods = c }
      in
      (match ctx.scope with
      | Class class_name -> add_method_to_class class_name >>= fun c -> return c
      | Global ->
        add_or_update_method { id; args = params; body = stmts } ctx.methods
        >>= fun c -> return { ctx with methods = c }
      | Instance id -> error "unreachable")
    | If (expr, stmts) ->
      eval_expr ctx expr
      >>= fun e ->
      if e.return_v = VBool true
      then
        eval_body ctx stmts
        >>= fun c -> return { c with last_if = VBool true, VBool true }
      else return { ctx with last_if = VBool true, VBool false }
    | Else stmts ->
      (match ctx.last_if with
      | VBool false, _ -> error "else hasn't pair if"
      | VBool true, VBool false -> eval_body ctx stmts
      | VBool true, VBool true -> return ctx
      | _ -> error "unreachable")
    | While (expr, stmts) ->
      let rec helper ctx stmts =
        eval_expr ctx expr
        >>= fun e ->
        if e.return_v = VBool true then eval_body_cycle ctx stmts else return ctx
      and eval_body_cycle temp_ctx = function
        | [] -> helper temp_ctx stmts
        | stmt :: t -> eval_stmt temp_ctx stmt >>= fun c -> eval_body_cycle c t
      in
      helper ctx stmts
    | For _ -> error "not implemented"
    | Ast.Class (id, body) ->
      eval_body
        { local_vars = []
        ; return_v = VNone
        ; methods = []
        ; scope = Global
        ; classes = []
        ; instances = []
        ; last_if = VBool false, VBool false
        }
        body
      >>= fun cls_ctx ->
      add_or_update_class id cls_ctx ctx.classes
      >>= fun c -> return { ctx with classes = c }
    | Return exprs -> eval_return exprs ctx >>= fun v -> return v
    | _ -> error "PARSER FAIL"

  and eval_prog ctx = function
    | [] -> return VNone
    | [ x ] -> eval_stmt ctx x >>= fun ctx_upd -> return ctx_upd.return_v
    | stmt :: stmts -> eval_stmt ctx stmt >>= fun ctx_upd -> eval_prog ctx_upd stmts
  ;;

  let init_global_ctx () =
    { local_vars = []
    ; methods = []
    ; scope = Global
    ; classes = []
    ; return_v = VNone
    ; instances = []
    ; last_if = VBool false, VBool false
    }
  ;;

  let global_ctx = init_global_ctx ()
end

open Eval (Result)

let%test _ =
  eval_prog
    global_ctx
    [ Assign
        ( [ Var (VarName (Local, "x")); Var (VarName (Local, "y")) ]
        , [ Const (Integer 5); Const (Integer 6) ] )
    ; Return [ ArithOp (Add, Var (VarName (Local, "x")), Var (VarName (Local, "y"))) ]
    ]
  = Result.return (VInt 11)
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
    ; Expression (MethodCall ("sum", [ Const (Integer 5); Const (Integer 5) ]))
    ]
  = Result.return (VInt 10)
;;

let%test _ =
  add_or_update_var { id = "a"; v = VBool true } []
  = Result.return [ { id = "a"; v = VBool true } ]
;;

let%test _ =
  eval_prog
    global_ctx
    [ Class
        ( "A"
        , [ MethodDef
              ( "sum"
              , [ "x"; "y" ]
              , [ Return
                    [ ArithOp (Add, Var (VarName (Local, "x")), Var (VarName (Local, "y")))
                    ]
                ] )
          ] )
    ; Assign ([ Var (VarName (Local, "a")) ], [ ClassToInstance ("A", []) ])
    ; Return [ MethodAccess ("a", "sum", [ Const (Integer 5); Const (Integer 6) ]) ]
    ]
  = Result.return (VInt 11)
;;

let%test _ =
  eval_prog
    global_ctx
    [ If
        ( Eq (Const (Integer 5), Const (Integer 5))
        , [ Return [ ArithOp (Add, Const (Integer 5), Const (Integer 5)) ] ] )
    ]
  = Result.return (VInt 10)
;;

let%test _ =
  eval_prog
    global_ctx
    [ If
        ( Eq (Const (Integer 5), Const (Integer 5))
        , [ Return [ ArithOp (Add, Const (Integer 5), Const (Integer 5)) ] ] )
    ; Else [ Return [ ArithOp (Add, Const (Integer 7), Const (Integer 7)) ] ]
    ]
  = Result.return (VInt 10)
;;

let%test _ =
  eval_prog
    global_ctx
    [ If
        ( Eq (Const (Bool true), Const (Integer 5))
        , [ Return [ ArithOp (Add, Const (Integer 5), Const (Integer 5)) ] ] )
    ; Else [ Return [ ArithOp (Add, Const (Integer 7), Const (Integer 7)) ] ]
    ]
  = Result.return (VInt 14)
;;

let%test _ =
  eval_prog
    global_ctx
    [ Assign ([ Var (VarName (Local, "x")) ], [ Const (Integer 10) ])
    ; While
        ( Gr (Var (VarName (Local, "x")), Const (Integer 5))
        , [ Assign
              ( [ Var (VarName (Local, "x")) ]
              , [ ArithOp (Sub, Var (VarName (Local, "x")), Const (Integer 1)) ] )
          ] )
    ; Return [ Var (VarName (Local, "x")) ]
    ]
  = Result.return (VInt 5)
;;

let%test _ =
  eval_prog
    global_ctx
    [ Assign
        ( [ Var (VarName (Local, "x")) ]
        , [ List [ Const (Integer 3); Const (Integer 2); Const (Integer 1) ] ] )
    ; Return [ Var (VarName (Local, "x")) ]
    ]
  = Result.return (VList [ VInt 3; VInt 2; VInt 1 ])
;;

let%test _ =
  eval_prog
    global_ctx
    [ Class
        ( "Node"
        , [ MethodDef
              ( "init"
              , [ "v" ]
              , [ Assign
                    ([ Var (VarName (Class, "value")) ], [ Var (VarName (Local, "v")) ])
                ; Assign ([ Var (VarName (Class, "next")) ], [ Const Void ])
                  (* ; Return [ Var (VarName (Class "Node", "value")) ] *)
                ] )
          ; MethodDef
              ( "set"
              , [ "next" ]
              , [ Assign
                    ([ Var (VarName (Class, "next")) ], [ Var (VarName (Local, "next")) ])
                ] )
          ; MethodDef
              ( "get"
              , []
              , [ Return [ Var (VarName (Class, "value")); Var (VarName (Class, "next")) ]
                ] )
          ] )
    ; Assign ([ Var (VarName (Local, "node1")) ], [ ClassToInstance ("Node", []) ])
    ; Assign ([ Var (VarName (Local, "node2")) ], [ ClassToInstance ("Node", []) ])
    ; Expression (MethodAccess ("node1", "init", [ Const (Integer 5) ]))
    ; Expression (MethodAccess ("node2", "init", [ Const (Integer 10) ]))
    ; Expression (MethodAccess ("node1", "set", [ Const (Integer 7) ]))
    ; Return [ MethodAccess ("node1", "get", []); MethodAccess ("node2", "get", []) ]
    ]
  = Result.return (VList [ VList [ VInt 5; VInt 7 ]; VList [ VInt 10; VNone ] ])
;;
