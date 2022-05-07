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
    { var_id : identifier
    ; v : value
    }

  type method_ctx =
    { method_id : identifier
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
    { class_id : identifier
    ; class_methods : methods
    ; class_fields : vars
    }

  type instance =
    { instance_id : identifier
    ; class_reference_id : identifier
    ; instance_methods : methods
    ; instance_fields : vars
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

  let rec string_of_value = function
    | VInt i -> return (string_of_int i)
    | VFloat f -> return (string_of_float f)
    | VBool b -> return (string_of_bool b)
    | VString s -> return s
    | VNone -> return "none"
    | VList lst ->
      map (fun x -> string_of_value x) lst
      >>= fun l -> return ("[" ^ String.concat ", " l ^ "]")
    | VClassRef _ -> return "none"
  ;;

  let is_instance_exist key lst =
    let rec check = function
      | h :: t -> if h.instance_id = key then true else check t
      | [] -> false
    in
    check lst
  ;;

  let is_var_exist key lst =
    let rec check = function
      | h :: t -> if h.var_id = key then true else check t
      | [] -> false
    in
    check lst
  ;;

  let is_class_exist key lst =
    let rec check = function
      | h :: t -> if h.class_id = key then true else check t
      | [] -> false
    in
    check lst
  ;;

  let is_method_exist key lst =
    let rec check = function
      | h :: t -> if h.method_id = key then true else check t
      | [] -> false
    in
    check lst
  ;;

  let get_var key lst =
    let rec get key lst =
      match lst with
      | h :: t -> if h.var_id = key then return h.v else get key t
      | _ -> error "unknown variable"
    in
    get key lst
  ;;

  let get_class key lst =
    let rec get key lst =
      match lst with
      | h :: t -> if h.class_id = key then return h else get key t
      | _ -> error "unknown class"
    in
    get key lst
  ;;

  let get_instance key lst =
    let rec get key lst =
      match lst with
      | h :: t -> if h.instance_id = key then return h else get key t
      | _ -> error "unknown instance"
    in
    get key lst
  ;;

  let get_method key lst =
    let rec get key lst =
      match lst with
      | h :: t -> if h.method_id = key then return h else get key t
      | _ -> error "unknown instance"
    in
    get key lst
  ;;

  let add_or_update exist is_equal_id id element lst =
    let rec merge acc = function
      | [] ->
        (match acc with
        | [] -> return [ element ]
        | _ -> return acc)
      | h :: t ->
        (match exist id lst with
        | true ->
          if is_equal_id h id then merge (element :: acc) t else merge (h :: acc) t
        | false -> return (element :: lst))
    in
    merge [] lst
  ;;

  let rec merge_return_vals (acc : value list) = function
    | [] -> return acc
    | h :: t -> merge_return_vals (h.return_v :: acc) t
  ;;

  let rec eval_expr ctx expr =
    let eval get_val = function
      | (MethodAccess _ | MethodCall _) as e ->
        eval_expr ctx e >>= fun c -> return c.return_v
      | _ as e -> get_val e
    in
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
              get_instance inst_id ctx.instances
              >>= fun inst -> get_var id inst.instance_fields
            | _ -> error ""))
        | _ -> error "now isn't using")
      | ClassToInstance (id, args) ->
        (match is_class_exist id ctx.classes with
        | true -> map (fun e -> get_val e) args >>= fun a -> return (VClassRef (id, a))
        | false -> error "class doesn't exist")
      | ArithOp (op, e1, e2) ->
        eval get_val e1
        >>= fun l ->
        eval get_val e2
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
        eval get_val e1
        >>= fun l ->
        eval get_val e2
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
        eval get_val e1
        >>= fun l ->
        (match l with
        | VBool false -> return (VBool true)
        | VBool true -> return (VBool false)
        | _ -> error "fail with NOT")
      | Eq (e1, e2) ->
        eval get_val e1 >>= fun l -> eval get_val e2 >>= fun r -> return (VBool (l = r))
      | NotEq (e1, e2) ->
        eval get_val e1 >>= fun l -> eval get_val e2 >>= fun r -> return (VBool (l != r))
      | Gr (e1, e2) ->
        eval get_val e1 >>= fun l -> eval get_val e2 >>= fun r -> return (VBool (l > r))
      | Gre (e1, e2) ->
        eval get_val e1 >>= fun l -> eval get_val e2 >>= fun r -> return (VBool (l >= r))
      | Ls (e1, e2) ->
        eval get_val e1 >>= fun l -> eval get_val e2 >>= fun r -> return (VBool (l < r))
      | Lse (e1, e2) ->
        eval get_val e1 >>= fun l -> eval get_val e2 >>= fun r -> return (VBool (l <= r))
      | List exprs -> map (fun e -> eval get_val e) exprs >>= fun e -> return (VList e)
      | FieldAccess (instance_name, field_name) ->
        (match get_instance instance_name ctx.instances with
        | inst ->
          inst
          >>= fun i ->
          get_class i.class_reference_id ctx.classes
          >>= fun c -> get_var field_name c.class_fields)
      | Lambda _ -> error "not implemented"
      | _ -> error "expr can effect on ctx"
    in
    match expr with
    | MethodAccess (instance_name, method_name, args) ->
      let rec set_values_to_vars values (args : identifier list) ctx_upd =
        match values, args with
        | h1 :: t1, h2 :: t2 ->
          add_or_update
            is_var_exist
            (fun x y -> x.var_id = y)
            h2
            { var_id = h2; v = h1 }
            ctx_upd.local_vars
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
        (match is_method_exist method_name i.instance_methods with
        | false -> error "no method in class"
        | true ->
          let try_eval_method params body =
            get_method method_name i.instance_methods
            >>= fun m ->
            set_values_to_vars
              params
              m.args
              { ctx with local_vars = []; scope = Instance i.instance_id }
            >>= fun c -> eval_method c body
          in
          get_method method_name i.instance_methods
          >>= fun m -> try_eval_method vals m.body))
    | MethodCall (method_name, args) ->
      let rec set_values_to_vars values (args : identifier list) ctx_upd =
        match values, args with
        | h1 :: t1, h2 :: t2 ->
          add_or_update
            is_var_exist
            (fun x y -> x.var_id = y)
            h2
            { var_id = h2; v = h1 }
            ctx_upd.local_vars
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
              add_or_update
                is_instance_exist
                (fun x y -> x.instance_id = y)
                id
                { instance_id = id
                ; class_reference_id = cls.class_id
                ; instance_fields = cls.class_fields
                ; instance_methods = cls.class_methods
                }
                ctx.instances
              >>= fun t -> set_values_to_vars t1 t2 { ctx_upd with instances = t }
            | _ ->
              add_or_update
                is_var_exist
                (fun x y -> x.var_id = y)
                id
                { var_id = id; v = h1 }
                ctx_upd.local_vars
              >>= fun t -> set_values_to_vars t1 t2 { ctx_upd with local_vars = t })
          | Var (VarName (Class, id)) ->
            (match ctx_upd.scope with
            | Instance inst_id ->
              get_instance inst_id ctx_upd.instances
              >>= fun i ->
              add_or_update
                is_var_exist
                (fun x y -> x.var_id = y)
                id
                { var_id = id; v = h1 }
                i.instance_fields
              >>= fun fields_upd ->
              add_or_update
                is_instance_exist
                (fun x y -> x.instance_id = y)
                id
                { instance_id = inst_id
                ; class_reference_id = i.class_reference_id
                ; instance_fields = fields_upd
                ; instance_methods = i.instance_methods
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
        add_or_update
          is_method_exist
          (fun x y -> x.method_id = y)
          id
          { method_id = id; args = params; body = stmts }
          cur_class.class_methods
        >>= fun c -> return { ctx with methods = c }
      in
      (match ctx.scope with
      | Class class_name -> add_method_to_class class_name >>= fun c -> return c
      | Global ->
        add_or_update
          is_method_exist
          (fun x y -> x.method_id = y)
          id
          { method_id = id; args = params; body = stmts }
          ctx.methods
        >>= fun c -> return { ctx with methods = c }
      | Instance _ -> error "unreachable")
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
      add_or_update
        is_class_exist
        (fun x y -> x.class_id = y)
        id
        { class_id = id
        ; class_methods = cls_ctx.methods
        ; class_fields = cls_ctx.local_vars
        }
        ctx.classes
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

  let parse_and_interpet input =
    match Parser.parse Parser.prog input with
    | Ok x -> eval_prog global_ctx x >>= fun v -> string_of_value v
    | _ -> error "sad"
  ;;
end

open Eval (Result)

let%test _ = parse_and_interpet "[1+1,2+2, 3+3]" = Result.return "[2, 4, 6]"

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
  add_or_update
    is_var_exist
    (fun x y -> x.var_id = y)
    "a"
    { var_id = "a"; v = VBool true }
    []
  = Result.return [ { var_id = "a"; v = VBool true } ]
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

let%test _ =
  eval_prog
    global_ctx
    [ MethodDef
        ( "fact"
        , [ "n" ]
        , [ If (Ls (Var (VarName (Local, "n")), Const (Integer 0)), [ Return [] ])
          ; If
              ( BoolOp
                  ( Or
                  , Eq (Var (VarName (Local, "n")), Const (Integer 0))
                  , Eq (Var (VarName (Local, "n")), Const (Integer 1)) )
              , [ Return [ Const (Integer 1) ] ] )
          ; Return
              [ ArithOp
                  ( Mul
                  , Var (VarName (Local, "n"))
                  , MethodCall
                      ( "fact"
                      , [ ArithOp (Sub, Var (VarName (Local, "n")), Const (Integer 1)) ]
                      ) )
              ]
          ] )
    ; Expression
        (List
           [ MethodCall ("fact", [ Const (Integer 1) ])
           ; MethodCall ("fact", [ Const (Integer 2) ])
           ; MethodCall ("fact", [ Const (Integer 3) ])
           ; MethodCall ("fact", [ Const (Integer 4) ])
           ; MethodCall ("fact", [ Const (Integer 5) ])
           ])
    ]
  = Result.return (VList [ VInt 1; VInt 2; VInt 6; VInt 24; VInt 120 ])
;;
