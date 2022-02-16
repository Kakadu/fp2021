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
let get_var_value_from_ctx i ctx =
  let rcd = List.find (fun (x : var_ctx) -> i = x.id) ctx.vars in
  (fun x -> x.value) rcd

let get_func_ctx_from_ctx i ctx =
  List.find (fun (x : func_ctx) -> i = x.id) ctx.funcs

let get_class_ctx_from_ctx i ctx =
  List.find (fun (x : class_ctx) -> i = x.id) ctx.classes

let get_func_ctx_from_class_ctx i (ctx : class_ctx) =
  List.find (fun (x : func_ctx) -> i = x.id) ctx.funcs

(* Unpackers *)
let unpack_identifier_in_value = function
  | Object x -> x
  | _ -> failwith "object was expected"

let unpack_string_in_identifier = function
  | Identifier x -> x
  | _ -> failwith "object was expected"

let unpack_int_in_value e =
  match e with Integer i -> i | _ -> failwith "not a integer"

let unpack_list_in_value = function List l -> l | _ -> failwith "not a List"

(* Misc *)
let if_list i ctx =
  match get_var_value_from_ctx i ctx with List _ -> true | _ -> false

let combine_args_and_params args params =
  let rec doer rest =
    match rest with
    | [] -> []
    | hd :: tl -> { id = fst hd; value = snd hd } :: doer tl
  in
  doer (List.combine args params)

let rec get_identifiers_from_args e =
  match e with
  | hd :: tl ->
      (match hd with Variable (Local, i) -> i | _ -> failwith "")
      :: get_identifiers_from_args tl
  | [] -> []

(* Machine *)
let rec eval env single_statement =
  let rec doer1 c s =
    if c.sgnl == 3 then c.last_return
    else match s with [] -> Nil | hd :: tl -> doer1 (eval c hd) tl
  in
  let rec doer2 c s =
    match s with [] -> c | hd :: tl -> doer2 (eval c hd) tl
  in
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
        Boolean
          (if expr e_env l = Boolean true || expr e_env r = Boolean true then
           true
          else false)
    | Variable (_, i) ->
        if if_var_exists_in_ctx i e_env then get_var_value_from_ctx i e_env
        else failwith "undefined Variable"
    | ListAccess (i, e) -> (
        match if_var_exists_in_ctx i e_env with
        | false -> failwith "undefined Variable"
        | true -> (
            match if_list i e_env with
            | false -> failwith "not a List"
            | true ->
                let l = unpack_list_in_value (get_var_value_from_ctx i e_env) in
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
                let obj_class =
                  unpack_identifier_in_value (get_var_value_from_ctx i env)
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
                                  (get_func_ctx_from_class_ctx i2 obj_class_ctx)
                                    .args
                                  (List.map (expr env) e);
                            funcs = obj_class_ctx.funcs;
                          }
                          (get_func_ctx_from_class_ctx i2 obj_class_ctx).stmts
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
                                        String (unpack_string_in_identifier i2);
                                      ]
                                  @ combine_args_and_params
                                      [
                                        List.hd
                                          (List.rev (List.tl f_cl_ctx.args));
                                      ]
                                      [ List e ];
                                funcs = obj_class_ctx.funcs;
                              }
                              f_cl_ctx.stmts)))))
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
        | Variable (Local, i) ->
            if if_var_exists_in_ctx i env == false then
              add_var_in_ctx i (expr env r) env
            else change_var_in_ctx i (expr env r) env
        | _ -> failwith "L or R has unsupported type")
    | IfElse (e, s1, s2) ->
        if expr env e = Boolean true then doer2 env s1 else doer2 env s2
    | Puts x -> add_output expr env (expr env x)
    | While (e, s) ->
        let rec checker ctx =
          match expr ctx e with Boolean false -> ctx | _ -> doer ctx s
        and doer ctx1 s =
          if ctx1.sgnl == 1 then { ctx1 with sgnl = 0 }
          else if ctx1.sgnl == 2 then checker { ctx1 with sgnl = 0 }
          else if ctx1.sgnl == 3 then ctx1
          else
            match s with
            | [] -> checker ctx1
            | hd :: tl -> doer (eval ctx1 hd) tl
        in
        checker env
    | Function (i, a, s) ->
        add_func_in_ctx i (get_identifiers_from_args a) s env
    | Class (i, s) ->
        let class_ctx = doer2 tmp_ctx s in
        if if_class_exists_in_ctx i env then env
        else
          {
            env with
            classes =
              env.classes
              @ [ { id = i; vars = class_ctx.vars; funcs = class_ctx.funcs } ];
          }
  in
  stmt single_statement

and add_output eval_expr ctx v =
  match v with
  | Integer x -> { ctx with output = ctx.output @ [ Int.to_string x ] }
  | Float x -> { ctx with output = ctx.output @ [ Float.to_string x ] }
  | String x -> { ctx with output = ctx.output @ [ x ] }
  | Boolean x -> { ctx with output = ctx.output @ [ Bool.to_string x ] }
  | Nil -> { ctx with output = ctx.output @ [ String.empty ] }
  | Object (Identifier x) -> { ctx with output = ctx.output @ [ "obj:" ^ x ] }
  | Object Null -> ctx
  | List e ->
      let tmp = List.map (eval_expr ctx) e in
      let tmp1 = List.map (add_output eval_expr ctx) tmp in
      let tmp2 = List.map (fun x -> x.output) tmp1 in
      let tmp3 = List.concat tmp2 in
      { ctx with output = tmp3 }

let rec eval_stmts eval ctx = function
  | [] -> ctx
  | hd :: tl -> eval_stmts eval (eval ctx hd) tl

let init_main_ctx = eval_stmts eval main_ctx

let parser_result_to_stmt_list str =
  let tmp = Parser.parse Parser.p_final str in
  match tmp with Ok p_final -> p_final | Error msg -> failwith msg

let run_ruby_debug_ctx str = init_main_ctx @@ parser_result_to_stmt_list str

let run_ruby str =
  let print_output = List.iter (Printf.printf "%s\n") in
  print_output (run_ruby_debug_ctx str).output