open Ast

module type MONAD = sig
  type 'a t

  val return : 'a -> 'a t
  val ( >>= ) : 'a t -> ('a -> 'b t) -> 'b t
end

module type MONADERROR = sig
  include MONAD

  val fail : string -> 'a t
end

module Result = struct
  type 'a t = ('a, string) Result.t

  let ( >>= ) = Result.bind
  let return = Result.ok
  let fail = Result.error
end

module Eval (M : MONADERROR) = struct
  open M

  (* Context *)
  type var_ctx = { id : identifier; value : value }

  type func_ctx = {
    id : identifier;
    args : identifier list;
    stmts : statement list;
  }

  type class_ctx = {
    id : identifier;
    vars : var_ctx list;
    funcs : func_ctx list;
  }

  type global_ctx = {
    id : identifier;
    vars : var_ctx list;
    gl_vars : var_ctx list;
    funcs : func_ctx list;
    classes : class_ctx list;
    signal : signal;
    last_return : value;
    output : string list;  (** holds values to be printed on a console *)
  }

  (* Init Context *)
  let main_ctx =
    {
      id = Identifier "main";
      vars = [];
      gl_vars = [];
      funcs = [];
      classes = [];
      signal = Work;
      last_return = Nil;
      output = [];
    }

  let tmp_ctx =
    {
      id = Identifier "tmp";
      vars = [];
      gl_vars = [];
      funcs = [];
      classes = [];
      signal = Work;
      last_return = Nil;
      output = [];
    }

  let tmp_class_ctx = { id = Identifier "tmp"; vars = []; funcs = [] }

  (* Context Interface *)
  (* Existence *)
  let if_var_exists_in_ctx i ctx =
    List.exists (fun (x : var_ctx) -> i = x.id) ctx.vars

  let if_func_exists_in_ctx i ctx =
    List.exists (fun (x : func_ctx) -> i = x.id) ctx.funcs

  let if_class_exists_in_ctx i ctx =
    List.exists (fun (x : class_ctx) -> i = x.id) ctx.classes

  let if_func_exists_in_class_ctx i (ctx : class_ctx) =
    List.exists (fun (x : func_ctx) -> i = x.id) ctx.funcs

  (* Changing *)
  let add_var_in_ctx i v ctx =
    { ctx with vars = { id = i; value = v } :: ctx.vars }

  let change_var_in_ctx i v ctx =
    let rec new_vars vl =
      match vl with
      | [] -> vl
      | hd :: tl ->
          (fun (x : var_ctx) -> if i = x.id then { x with value = v } else x) hd
          :: new_vars tl
    in

    { ctx with vars = new_vars ctx.vars }

  let add_func_in_ctx i a s ctx =
    { ctx with funcs = { id = i; args = a; stmts = s } :: ctx.funcs }

  (* Getting *)
  let get_var_ctx_from_ctx i ctx =
    List.find (fun (x : var_ctx) -> i = x.id) ctx.vars

  let get_func_ctx_from_ctx i ctx =
    List.find (fun (x : func_ctx) -> i = x.id) ctx.funcs

  let get_class_ctx_from_ctx i ctx =
    List.find (fun (x : class_ctx) -> i = x.id) ctx.classes

  let get_func_ctx_from_class_ctx i (ctx : class_ctx) =
    List.find (fun (x : func_ctx) -> i = x.id) ctx.funcs

  (* Unpackers *)
  let multliple_str_unpacker = function
    | Integer x -> Int.to_string x
    | Float x -> Float.to_string x
    | String x -> x
    | Boolean x -> Bool.to_string x
    | Nil | List _ | Object _ | Lambda _ -> ""

  let unpack_identifier_in_value = function
    | Object x -> return x
    | _ -> fail "object was expected"

  let unpack_string_in_identifier = function
    | Identifier x -> return x
    | _ -> fail "object was expected"

  let unpack_int_in_value = function
    | Integer i -> return i
    | _ -> fail "not a integer"

  let unpack_list_in_value = function
    | List l -> return l
    | _ -> fail "not a List"

  (* Misc *)
  let if_list i ctx =
    match (get_var_ctx_from_ctx i ctx).value with List _ -> true | _ -> false

  let combine_args_and_params args params =
    let rec doer = function
      | [] -> []
      | hd :: tl -> { id = fst hd; value = snd hd } :: doer tl
    in
    doer (List.combine args params)

  let rec get_identifiers_from_args = function
    | [] -> []
    | hd :: tl ->
        (match hd with
        | Variable (Local, i) -> return i
        | _ -> fail "Local variables only")
        :: get_identifiers_from_args tl

  let rec concat_var_lists base = function
    | [] -> base
    | (hd : var_ctx) :: tl -> (
        match if_var_exists_in_ctx hd.id base with
        | false -> concat_var_lists { base with vars = hd :: base.vars } tl
        | true -> concat_var_lists (change_var_in_ctx hd.id hd.value base) tl)

  let concat_gl_var_lists base = function
    | [] -> base
    | (hd : var_ctx) :: tl -> (
        match if_var_exists_in_ctx hd.id base with
        | false -> concat_var_lists { base with vars = hd :: base.gl_vars } tl
        | true -> concat_var_lists (change_var_in_ctx hd.id hd.value base) tl)

  type dispatch = {
    expr : dispatch -> global_ctx -> expression -> value t;
    stmt : dispatch -> global_ctx -> statement -> global_ctx t;
  }

  let bundle =
    let rec expr (duo : dispatch) (e_env : global_ctx) ex =
      let rec mmap f = function
        | [] -> return []
        | h :: tl ->
            f h >>= fun c ->
            mmap f tl >>= fun lst -> return @@ (c :: lst)
      in
      let rec doer1 c s =
        if c.signal == Return then return c.last_return
        else
          match s with
          | [] -> return Nil
          | hd :: tl -> duo.stmt duo c hd >>= fun x -> doer1 x tl
      in
      let rec doer2 c s =
        if c.signal == Return then return c.last_return
        else
          match s with
          | [] -> return Nil
          | hd :: tl -> (
              match hd with
              | Expression e ->
                  expr duo c e >>= fun x ->
                  expr duo { c with signal = Return; last_return = x } e
              | _ -> duo.stmt duo c hd >>= fun x -> doer2 x tl)
      in
      match ex with
      | Constant x -> return x
      | Add (l, r) -> (
          expr duo e_env l >>= fun l ->
          expr duo e_env r >>= fun r ->
          match (l, r) with
          | Integer l1, Integer r1 -> return @@ Integer (l1 + r1)
          | Float l1, Float r1 -> return @@ Float (l1 +. r1)
          | Float l1, Integer r1 -> return @@ Float (l1 +. Int.to_float r1)
          | Integer l1, Float r1 -> return @@ Float (Int.to_float l1 +. r1)
          | _ -> fail "L or R has unsupported type")
      | Sub (l, r) -> (
          expr duo e_env l >>= fun l ->
          expr duo e_env r >>= fun r ->
          match (l, r) with
          | Integer l1, Integer r1 -> return @@ Integer (l1 - r1)
          | Float l1, Float r1 -> return @@ Float (l1 -. r1)
          | Float l1, Integer r1 -> return @@ Float (l1 -. Int.to_float r1)
          | Integer l1, Float r1 -> return @@ Float (Int.to_float l1 -. r1)
          | _ -> fail "L or R has unsupported type")
      | Mul (l, r) -> (
          expr duo e_env l >>= fun l ->
          expr duo e_env r >>= fun r ->
          match (l, r) with
          | Integer l1, Integer r1 -> return @@ Integer (l1 * r1)
          | Float l1, Float r1 -> return @@ Float (l1 *. r1)
          | Float l1, Integer r1 -> return @@ Float (l1 *. Int.to_float r1)
          | Integer l1, Float r1 -> return @@ Float (Int.to_float l1 *. r1)
          | _ -> fail "L or R has unsupported type")
      | Div (l, r) -> (
          expr duo e_env l >>= fun l ->
          expr duo e_env r >>= fun r ->
          match (l, r) with
          | Integer l1, Integer r1 -> return @@ Integer (l1 / r1)
          | Float l1, Float r1 -> return @@ Float (l1 /. r1)
          | Float l1, Integer r1 -> return @@ Float (l1 /. Int.to_float r1)
          | Integer l1, Float r1 -> return @@ Float (Int.to_float l1 /. r1)
          | _ -> fail "L or R has unsupported type")
      | Mod (l, r) -> (
          expr duo e_env l >>= fun l ->
          expr duo e_env r >>= fun r ->
          match (l, r) with
          | Integer l1, Integer r1 -> return @@ Integer (l1 mod r1)
          | _ -> fail "L or R has unsupported type")
      | Equal (l, r) ->
          expr duo e_env l >>= fun l ->
          expr duo e_env r >>= fun r -> return @@ Boolean (l = r)
      | NotEqual (l, r) ->
          expr duo e_env l >>= fun l ->
          expr duo e_env r >>= fun r -> return @@ Boolean (l != r)
      | Less (l, r) ->
          expr duo e_env l >>= fun l ->
          expr duo e_env r >>= fun r -> return @@ Boolean (l < r)
      | LessOrEq (l, r) ->
          expr duo e_env l >>= fun l ->
          expr duo e_env r >>= fun r -> return @@ Boolean (l <= r)
      | Greater (l, r) ->
          expr duo e_env l >>= fun l ->
          expr duo e_env r >>= fun r -> return @@ Boolean (l > r)
      | GreaterOrEq (l, r) ->
          expr duo e_env l >>= fun l ->
          expr duo e_env r >>= fun r -> return @@ Boolean (l >= r)
      | And (l, r) ->
          expr duo e_env l >>= fun l ->
          expr duo e_env r >>= fun r -> return @@ Boolean (l = r)
      | Or (l, r) ->
          expr duo e_env l >>= fun l ->
          expr duo e_env r >>= fun r ->
          return @@ Boolean (l = Boolean true || r = Boolean true)
      | Variable (_, i) -> (
          match if_var_exists_in_ctx i e_env with
          | true -> return @@ (get_var_ctx_from_ctx i e_env).value
          | false -> fail "undefined Variable")
      | ListAccess (i, e) -> (
          match if_var_exists_in_ctx i e_env with
          | false -> fail "undefined Variable"
          | true -> (
              match if_list i e_env with
              | false -> fail "not a List"
              | true ->
                  let l =
                    unpack_list_in_value (get_var_ctx_from_ctx i e_env).value
                  in
                  let index =
                    expr duo e_env e >>= fun x ->
                    return @@ unpack_int_in_value x
                  in
                  index >>= fun index ->
                  index >>= fun index ->
                  l >>= fun l ->
                  expr duo e_env (List.nth l index) >>= fun x -> return @@ x))
      | Call (i1, i2, e) -> (
          match i1 with
          | Null -> (
              match if_func_exists_in_ctx i2 e_env with
              | false -> fail "undefined Function"
              | true ->
                  mmap (fun x -> expr duo e_env x) e >>= fun x ->
                  doer1
                    {
                      (concat_var_lists e_env
                         (combine_args_and_params
                            (get_func_ctx_from_ctx i2 e_env).args x))
                      with
                      id = Identifier "tmp";
                      gl_vars = e_env.vars;
                      funcs = [ get_func_ctx_from_ctx i2 e_env ];
                    }
                    (get_func_ctx_from_ctx i2 e_env).stmts)
          | i -> (
              match if_var_exists_in_ctx i e_env with
              | false -> fail "undefined Variable"
              | true -> (
                  match i2 with
                  | Identifier "call" -> (
                      match (get_var_ctx_from_ctx i e_env).value with
                      | Lambda (il, sl) ->
                          mmap (fun x -> expr duo e_env x) e >>= fun x ->
                          doer2
                            (concat_gl_var_lists
                               (concat_var_lists e_env
                                  (combine_args_and_params il x))
                               e_env.gl_vars)
                            sl
                      | _ -> fail "lambda was expected")
                  | Identifier "to_s" ->
                      return
                      @@ String
                           (multliple_str_unpacker
                              (get_var_ctx_from_ctx i e_env).value)
                  | _ -> (
                      let obj_class =
                        unpack_identifier_in_value
                          (get_var_ctx_from_ctx i e_env).value
                      in
                      obj_class >>= fun x ->
                      let obj_class_ctx = get_class_ctx_from_ctx x e_env in
                      match if_class_exists_in_ctx x e_env with
                      | false -> fail "undefined Class"
                      | true -> (
                          match
                            if_func_exists_in_class_ctx i2 obj_class_ctx
                          with
                          | true ->
                              mmap (fun x -> expr duo e_env x) e >>= fun x ->
                              doer1
                                {
                                  tmp_ctx with
                                  vars =
                                    obj_class_ctx.vars
                                    @ combine_args_and_params
                                        (get_func_ctx_from_class_ctx i2
                                           obj_class_ctx)
                                          .args x;
                                  funcs = obj_class_ctx.funcs;
                                }
                                (get_func_ctx_from_class_ctx i2 obj_class_ctx)
                                  .stmts
                          | false -> (
                              match
                                if_func_exists_in_class_ctx
                                  (Identifier "method_missing") obj_class_ctx
                              with
                              | false -> fail "undefined Class Function"
                              | true ->
                                  let f_cl_ctx =
                                    get_func_ctx_from_class_ctx
                                      (Identifier "method_missing")
                                      obj_class_ctx
                                  in
                                  unpack_string_in_identifier i2 >>= fun x ->
                                  doer1
                                    {
                                      tmp_ctx with
                                      vars =
                                        obj_class_ctx.vars
                                        @ combine_args_and_params
                                            [ List.hd f_cl_ctx.args ]
                                            [ String x ]
                                        @ combine_args_and_params
                                            [
                                              List.hd
                                                (List.rev
                                                   (List.tl f_cl_ctx.args));
                                            ]
                                            [ List e ];
                                      funcs = obj_class_ctx.funcs;
                                    }
                                    f_cl_ctx.stmts))))))
      | CallLambda (e1, s1, e2) ->
          mmap (fun x -> expr duo e_env x) e2 >>= fun x ->
          doer2 (concat_var_lists e_env (combine_args_and_params e1 x)) s1
    in
    let rec stmt (duo : dispatch) (s_env : global_ctx) st =
      let rec fold_left f init = function
        | [] -> return init
        | hd :: tl -> f init hd >>= fun init -> fold_left f init tl
      in
      match st with
      | Break -> return { s_env with signal = Break }
      | Next -> return { s_env with signal = Next }
      | Expression _ -> return s_env
      | Return e ->
          duo.expr duo s_env e >>= fun rtrn ->
          (* failwith  ((fun x -> multliple_str_unpacker x) rtrn) *)
          return { s_env with signal = Return; last_return = rtrn }
      | Assign (l, r) -> (
          match l with
          | Variable (Local, i) -> (
              duo.expr duo s_env r >>= fun r ->
              match if_var_exists_in_ctx i s_env with
              | false -> return @@ add_var_in_ctx i r s_env
              | true -> return @@ change_var_in_ctx i r s_env)
          | _ -> fail "L has unsupported type")
      | MultipleAssign (ll, rl) ->
          let rec through = function
            | [] -> return []
            | hd :: tl -> (
                through tl >>= fun ttl ->
                match hd with
                | Variable (Local, i) -> return @@ (i :: ttl)
                | _ -> fail "L has unsupported type")
          in
          let rec through1 ctx elst = function
            | [] -> return ctx
            | hd :: tl -> (
                match if_var_exists_in_ctx hd s_env with
                | false ->
                    duo.expr duo ctx (List.hd elst) >>= fun x ->
                    through1 (add_var_in_ctx hd x ctx) (List.tl elst) tl
                | true ->
                    duo.expr duo ctx (List.hd elst) >>= fun x ->
                    through1 (change_var_in_ctx hd x ctx) (List.tl elst) tl)
          in
          through ll >>= fun x -> through1 s_env rl x
      | IfElse (e, s1, s2) -> (
          duo.expr duo s_env e >>= fun x ->
          match x = Boolean true with
          | true -> fold_left (fun x -> stmt duo x) s_env s1
          | false -> fold_left (fun x -> stmt duo x) s_env s2)
      | Puts x -> duo.expr duo s_env x >>= fun x -> return @@ add_output s_env x
      | While (e, s) ->
          let rec checker ctx =
            duo.expr duo ctx e >>= fun x ->
            match x with Boolean false -> return ctx | _ -> doer ctx s
          and doer ctx1 s =
            match ctx1.signal with
            | Break -> return { ctx1 with signal = Work }
            | Next -> checker { ctx1 with signal = Work }
            | Return -> return ctx1
            | _ -> (
                match s with
                | [] -> checker ctx1
                | hd :: tl -> stmt duo ctx1 hd >>= fun x -> doer x tl)
          in
          checker s_env
      | Function (i, a, s) -> return @@ add_func_in_ctx i a s s_env
      | Class (i, s) -> (
          let gl_ctx = fold_left (fun x -> stmt duo x) tmp_ctx s in
          let cl_ctx =
            gl_ctx >>= fun gl_ctx ->
            return
              { tmp_class_ctx with vars = gl_ctx.vars; funcs = gl_ctx.funcs }
          in
          match if_class_exists_in_ctx i s_env with
          | true -> return s_env
          | false ->
              cl_ctx >>= fun cl_ctx ->
              return
                { s_env with classes = { cl_ctx with id = i } :: s_env.classes }
          )
    and add_output ctx = function
      | Integer x -> { ctx with output = Int.to_string x :: ctx.output }
      | Float x -> { ctx with output = Float.to_string x :: ctx.output }
      | String x -> { ctx with output = x :: ctx.output }
      | Boolean x -> { ctx with output = Bool.to_string x :: ctx.output }
      | Nil -> { ctx with output = "nil" :: ctx.output }
      | Object (Identifier x) ->
          { ctx with output = ("obj:" ^ x) :: ctx.output }
      | Object Null | Lambda _ | List _ -> ctx
    in
    { expr; stmt }

  let rec eval_stmts eval ctx = function
    | [] -> return ctx
    | hd :: tl -> eval ctx hd >>= fun x -> eval_stmts eval x tl

  let init_main_ctx = eval_stmts (bundle.stmt bundle) main_ctx
end

open Eval (Result)

let run_ruby str =
  let x = init_main_ctx @@ Parser.parser_result_to_stmt_list str in
  let print_output = List.iter (Printf.printf "%s\n") in
  match x with
  | Ok res -> print_output (List.rev res.output)
  | Error _ -> Format.printf "interpreter error"
