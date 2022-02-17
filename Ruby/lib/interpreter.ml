open Ast

(* Context *)
type var_ctx = { id : identifier; value : value }

type func_ctx = {
  id : identifier;
  args : identifier list;
  stmts : statement list;
}

type class_ctx = { id : identifier; vars : var_ctx list; funcs : func_ctx list }

type global_ctx = {
  id : identifier;
  vars : var_ctx list;
  funcs : func_ctx list;
  classes : class_ctx list;
  sgnl : int;  (** SIGNAL: 0 -- nothing; 1 -- break; 2 -- next; 3 -- return *)
  last_return : value;
  output : string list;
}

(* Init Context *)
let main_ctx =
  {
    id = Identifier "main";
    vars = [];
    funcs = [];
    classes = [];
    sgnl = 0;
    last_return = Nil;
    output = [];
  }

let tmp_ctx =
  {
    id = Identifier "tmp";
    vars = [];
    funcs = [];
    classes = [];
    sgnl = 0;
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
  { ctx with vars = ctx.vars @ [ { id = i; value = v } ] }

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
  { ctx with funcs = ctx.funcs @ [ { id = i; args = a; stmts = s } ] }

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
  | Nil | List _ | Object _ -> ""

let unpack_identifier_in_value = function
  | Object x -> x
  | _ -> failwith "object was expected"

let unpack_string_in_identifier = function
  | Identifier x -> x
  | _ -> failwith "object was expected"

let unpack_int_in_value = function
  | Integer i -> i
  | _ -> failwith "not a integer"

let unpack_list_in_value = function List l -> l | _ -> failwith "not a List"

(* Misc *)
let if_object = function Object _ -> true | _ -> false

let if_list i ctx =
  match (get_var_ctx_from_ctx i ctx).value with List _ -> true | _ -> false

let combine_args_and_params args params =
  let rec doer = function
    | [] -> []
    | hd :: tl -> { id = fst hd; value = snd hd } :: doer tl
  in
  doer (List.combine args params)

let rec get_identifiers_from_args = function
  | hd :: tl ->
      (match hd with
      | Variable (Local, i) -> i
      | _ -> failwith "Local variables only")
      :: get_identifiers_from_args tl
  | [] -> []

(* Machine *)
let rec eval env single_statement =
  let rec doer1 c s =
    if c.sgnl == 3 then c.last_return
    else match s with [] -> Nil | hd :: tl -> doer1 (eval c hd) tl
  in
  let rec doer2 c = function [] -> c | hd :: tl -> doer2 (eval c hd) tl in
  let rec expr e_env = function
    | Constant x -> x
    | Add (l, r) -> (
        match (expr e_env l, expr e_env r) with
        | Integer l1, Integer r1 -> Integer (l1 + r1)
        | Float l1, Float r1 -> Float (l1 +. r1)
        | Float l1, Integer r1 -> Float (l1 +. Int.to_float r1)
        | Integer l1, Float r1 -> Float (Int.to_float l1 +. r1)
        | _ -> failwith "L or R has unsupported type")
    | Sub (l, r) -> (
        match (expr e_env l, expr e_env r) with
        | Integer l1, Integer r1 -> Integer (l1 - r1)
        | Float l1, Float r1 -> Float (l1 -. r1)
        | Float l1, Integer r1 -> Float (l1 -. Int.to_float r1)
        | Integer l1, Float r1 -> Float (Int.to_float l1 -. r1)
        | _ -> failwith "L or R has unsupported type")
    | Mul (l, r) -> (
        match (expr e_env l, expr e_env r) with
        | Integer l1, Integer r1 -> Integer (l1 * r1)
        | Float l1, Float r1 -> Float (l1 *. r1)
        | Float l1, Integer r1 -> Float (l1 *. Int.to_float r1)
        | Integer l1, Float r1 -> Float (Int.to_float l1 *. r1)
        | _ -> failwith "L or R has unsupported type")
    | Div (l, r) -> (
        match (expr e_env l, expr e_env r) with
        | Integer l1, Integer r1 -> Integer (l1 / r1)
        | Float l1, Float r1 -> Float (l1 /. r1)
        | Float l1, Integer r1 -> Float (l1 /. Int.to_float r1)
        | Integer l1, Float r1 -> Float (Int.to_float l1 /. r1)
        | _ -> failwith "L or R has unsupported type")
    | Mod (l, r) -> (
        match (expr e_env l, expr e_env r) with
        | Integer l1, Integer r1 -> Integer (l1 mod r1)
        | _ -> failwith "L or R has unsupported type")
    | Equal (l, r) -> Boolean (expr e_env l = expr e_env r)
    | NotEqual (l, r) -> Boolean (expr e_env l != expr e_env r)
    | Less (l, r) -> Boolean (expr e_env l < expr e_env r)
    | LessOrEq (l, r) -> Boolean (expr e_env l <= expr e_env r)
    | Greater (l, r) -> Boolean (expr e_env l > expr e_env r)
    | GreaterOrEq (l, r) -> Boolean (expr e_env l >= expr e_env r)
    | And (l, r) -> Boolean (expr e_env l = expr e_env r)
    | Or (l, r) ->
        Boolean (expr e_env l = Boolean true || expr e_env r = Boolean true)
    | Variable (_, i) -> (
        match if_var_exists_in_ctx i e_env with
        | true -> (get_var_ctx_from_ctx i e_env).value
        | false -> failwith "undefined Variable")
    | ListAccess (i, e) -> (
        match if_var_exists_in_ctx i e_env with
        | false -> failwith "undefined Variable"
        | true -> (
            match if_list i e_env with
            | false -> failwith "not a List"
            | true ->
                let l =
                  unpack_list_in_value (get_var_ctx_from_ctx i e_env).value
                in
                let index = unpack_int_in_value (expr e_env e) in
                expr e_env (List.nth l index)))
    | Call (i1, i2, e) -> (
        match i1 with
        | Null -> (
            match if_func_exists_in_ctx i2 env with
            | false -> failwith "undefined Function"
            | true ->
                doer1
                  {
                    tmp_ctx with
                    vars =
                      combine_args_and_params
                        (get_func_ctx_from_ctx i2 env).args
                        (List.map (expr env) e);
                    funcs = [ get_func_ctx_from_ctx i2 env ];
                  }
                  (get_func_ctx_from_ctx i2 env).stmts)
        | i -> (
            match if_var_exists_in_ctx i env with
            | false -> failwith "undefined Variable"
            | true -> (
                match not (if_object (get_var_ctx_from_ctx i env).value) with
                | true -> (
                    match i2 with
                    | Identifier "to_s" ->
                        String
                          (multliple_str_unpacker
                             (get_var_ctx_from_ctx i env).value)
                    | _ -> failwith "std:unsupported")
                | false -> (
                    let obj_class =
                      unpack_identifier_in_value
                        (get_var_ctx_from_ctx i env).value
                    in
                    let obj_class_ctx = get_class_ctx_from_ctx obj_class env in
                    match if_class_exists_in_ctx obj_class env with
                    | false -> failwith "undefined Class"
                    | true -> (
                        match if_func_exists_in_class_ctx i2 obj_class_ctx with
                        | true ->
                            doer1
                              {
                                tmp_ctx with
                                vars =
                                  obj_class_ctx.vars
                                  @ combine_args_and_params
                                      (get_func_ctx_from_class_ctx i2
                                         obj_class_ctx)
                                        .args
                                      (List.map (expr env) e);
                                funcs = obj_class_ctx.funcs;
                              }
                              (get_func_ctx_from_class_ctx i2 obj_class_ctx)
                                .stmts
                        | false -> (
                            match
                              if_func_exists_in_class_ctx
                                (Identifier "method_missing") obj_class_ctx
                            with
                            | false -> failwith "undefined Class Function"
                            | true ->
                                let f_cl_ctx =
                                  get_func_ctx_from_class_ctx
                                    (Identifier "method_missing") obj_class_ctx
                                in
                                doer1
                                  {
                                    tmp_ctx with
                                    vars =
                                      obj_class_ctx.vars
                                      @ combine_args_and_params
                                          [ List.hd f_cl_ctx.args ]
                                          [
                                            String
                                              (unpack_string_in_identifier i2);
                                          ]
                                      @ combine_args_and_params
                                          [
                                            List.hd
                                              (List.rev (List.tl f_cl_ctx.args));
                                          ]
                                          [ List e ];
                                    funcs = obj_class_ctx.funcs;
                                  }
                                  f_cl_ctx.stmts))))))
    | CallLambda (e1, s1, e2) ->
        let rec doer c s =
          if c.sgnl == 3 then c.last_return
          else
            match s with
            | [] -> Nil
            | hd :: tl -> (
                match hd with
                | Expression e ->
                    expr { c with sgnl = 3; last_return = expr c e } e
                | _ -> doer (eval c hd) tl)
        in
        doer
          {
            tmp_ctx with
            vars = combine_args_and_params e1 (List.map (expr env) e2);
          }
          s1
    | Lambda _ -> failwith "...counting roaches"
  in
  let stmt = function
    | Break -> { env with sgnl = 1 }
    | Next -> { env with sgnl = 2 }
    | Return e -> { env with sgnl = 3; last_return = expr env e }
    | Expression _ -> env
    | Assign (l, r) -> (
        match l with
        | Variable (Local, i) -> (
            match if_var_exists_in_ctx i env with
            | false -> add_var_in_ctx i (expr env r) env
            | true -> change_var_in_ctx i (expr env r) env)
        | _ -> failwith "L or R has unsupported type")
    | IfElse (e, s1, s2) -> (
        match expr env e = Boolean true with
        | true -> doer2 env s1
        | false -> doer2 env s2)
    | Puts x -> add_output expr env (expr env x)
    | While (e, s) ->
        let rec checker ctx =
          match expr ctx e with Boolean false -> ctx | _ -> doer ctx s
        and doer ctx1 s =
          match ctx1.sgnl with
          | 1 -> { ctx1 with sgnl = 0 }
          | 2 -> checker { ctx1 with sgnl = 0 }
          | 3 -> ctx1
          | _ -> (
              match s with
              | [] -> checker ctx1
              | hd :: tl -> doer (eval ctx1 hd) tl)
        in
        checker env
    | Function (i, a, s) ->
        add_func_in_ctx i (get_identifiers_from_args a) s env
    | Class (i, s) -> (
        let gl_ctx = doer2 tmp_ctx s in
        let cl_ctx =
          { tmp_class_ctx with vars = gl_ctx.vars; funcs = gl_ctx.funcs }
        in
        match if_class_exists_in_ctx i env with
        | true -> env
        | false ->
            { env with classes = env.classes @ [ { cl_ctx with id = i } ] })
  in
  stmt single_statement

and add_output eval_expr ctx = function
  | Integer x -> { ctx with output = ctx.output @ [ Int.to_string x ] }
  | Float x -> { ctx with output = ctx.output @ [ Float.to_string x ] }
  | String x -> { ctx with output = ctx.output @ [ x ] }
  | Boolean x -> { ctx with output = ctx.output @ [ Bool.to_string x ] }
  | Nil -> { ctx with output = ctx.output @ [ "" ] }
  | Object (Identifier x) -> { ctx with output = ctx.output @ [ "obj:" ^ x ] }
  | Object Null -> ctx
  | List e ->
      let tmp = List.map (eval_expr ctx) e in
      let tmp1 = List.map (add_output eval_expr ctx) tmp in
      let tmp2 = List.map (fun x -> x.output) tmp1 in
      let result = List.concat tmp2 in
      { ctx with output = result }

let rec eval_stmts eval ctx = function
  | [] -> ctx
  | hd :: tl -> eval_stmts eval (eval ctx hd) tl

let init_main_ctx = eval_stmts eval main_ctx

let run_ruby_debug_ctx str =
  init_main_ctx @@ Parser.parser_result_to_stmt_list str

let run_ruby str =
  let print_output = List.iter (Printf.printf "%s\n") in
  print_output (run_ruby_debug_ctx str).output
