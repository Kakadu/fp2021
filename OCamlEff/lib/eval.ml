open Ast
open Env
open Parser

type effval = EffectH of pat * id * exp

type state =
  { env : exval Env.id_t
  ; context : effval Env.eff_t
  }

and exval =
  | IntV of int
  | BoolV of bool
  | StringV of string
  | TupleV of exval list
  | ListV of exval list
  | FunV of pat * exp * state
  | ContV of tyexp * id
  | EffV of tyexp

let str_converter = function
  | IntV x -> string_of_int x
  | BoolV x -> string_of_bool x
  | StringV x -> x
  | _ -> failwith "Interpretation error: not basic type."
;;

let exval_to_str = function
  | IntV x -> str_converter (IntV x)
  | BoolV x -> str_converter (BoolV x)
  | StringV x -> str_converter (StringV x)
  | TupleV x -> Printf.sprintf "(%s)" (String.concat "," (List.map str_converter x))
  | ListV x -> Printf.sprintf "[%s]" (String.concat ";" (List.map str_converter x))
  | FunV (pat, _, _) ->
    (match pat with
    | PVar x -> x
    | _ -> "error")
  | ContV _ -> "cont"
  | EffV _ -> "eff"
;;

let lookup_in_env id state = lookup_id_map id state.env
let lookup_in_context id state = lookup_eff_map id state.context
let extend_env id v state = { state with env = extend_id_map id v state.env }
let extend_context id v state = { state with context = extend_eff_map id v state.context }

exception Tuple_compare
exception Match_fail

let rec vars_pat = function
  | PVar name -> [ name ]
  | PCons (pat1, pat2) -> vars_pat pat1 @ vars_pat pat2
  | PTuple pats | PList pats ->
    List.fold_left (fun binds pat -> binds @ vars_pat pat) [] pats
  | _ -> raise Match_fail
;;

let rec match_pat pat var =
  match pat, var with
  | PWild, _ -> []
  | PVar name, v -> [ name, v ]
  | PCons (pat1, pat2), ListV (hd :: tl) -> match_pat pat1 hd @ match_pat pat2 (ListV tl)
  | (PTuple pats, TupleV vars | PList pats, ListV vars)
    when List.length pats = List.length vars ->
    List.fold_left2 (fun binds pat var -> binds @ match_pat pat var) [] pats vars
  | PConst x, v ->
    (match x, v with
    | CInt a, IntV b when a = b -> []
    | CString a, StringV b when a = b -> []
    | CBool a, BoolV b when a = b -> []
    | _ -> raise Match_fail)
  | _ -> raise Match_fail
;;

let apply_infix_op op x y =
  match op, x, y with
  | Add, IntV x, IntV y -> IntV (x + y)
  | Sub, IntV x, IntV y -> IntV (x - y)
  | Mul, IntV x, IntV y -> IntV (x * y)
  | Div, IntV x, IntV y -> IntV (x / y)
  (* "<" block *)
  | Less, IntV x, IntV y -> BoolV (x < y)
  | Less, StringV x, StringV y -> BoolV (x < y)
  | Less, BoolV x, BoolV y -> BoolV (x < y)
  | Less, TupleV x, TupleV y when List.length x = List.length y -> BoolV (x < y)
  | Less, ListV x, ListV y -> BoolV (x < y)
  (* "<=" block *)
  | Leq, IntV x, IntV y -> BoolV (x <= y)
  | Leq, StringV x, StringV y -> BoolV (x <= y)
  | Leq, BoolV x, BoolV y -> BoolV (x <= y)
  | Leq, TupleV x, TupleV y when List.length x = List.length y -> BoolV (x <= y)
  | Leq, ListV x, ListV y -> BoolV (x <= y)
  (* ">" block *)
  | Gre, IntV x, IntV y -> BoolV (x > y)
  | Gre, StringV x, StringV y -> BoolV (x > y)
  | Gre, BoolV x, BoolV y -> BoolV (x > y)
  | Gre, TupleV x, TupleV y when List.length x = List.length y -> BoolV (x > y)
  | Gre, ListV x, ListV y -> BoolV (x > y)
  (* ">=" block *)
  | Geq, IntV x, IntV y -> BoolV (x >= y)
  | Geq, StringV x, StringV y -> BoolV (x >= y)
  | Geq, BoolV x, BoolV y -> BoolV (x >= y)
  | Geq, TupleV x, TupleV y when List.length x = List.length y -> BoolV (x >= y)
  | Geq, ListV x, ListV y -> BoolV (x >= y)
  (* "=" block *)
  | Eq, IntV x, IntV y -> BoolV (x = y)
  | Eq, StringV x, StringV y -> BoolV (x = y)
  | Eq, BoolV x, BoolV y -> BoolV (x = y)
  | Eq, TupleV x, TupleV y -> BoolV (x = y)
  | Eq, ListV x, ListV y -> BoolV (x = y)
  (* "!=" block *)
  | Neq, IntV x, IntV y -> BoolV (x != y)
  | Neq, StringV x, StringV y -> BoolV (x != y)
  | Neq, BoolV x, BoolV y -> BoolV (x != y)
  | Neq, TupleV x, TupleV y -> BoolV (x != y)
  | Neq, ListV x, ListV y -> BoolV (x != y)
  (* Other bool ops *)
  | And, BoolV x, BoolV y -> BoolV (x && y)
  | Or, BoolV x, BoolV y -> BoolV (x || y)
  (* failures *)
  | _, TupleV x, TupleV y when List.length x != List.length y -> raise Tuple_compare
  | _ -> failwith "Interpretation error: Wrong infix operation."
;;

let apply_unary_op op x =
  match op, x with
  | Minus, IntV x -> IntV (-x)
  | Not, BoolV x -> BoolV (not x)
  | _ -> failwith "Interpretation error: Wrong unary operation."
;;

let rec scan_cases = function
  | hd :: tl ->
    (match hd with
    | PEffectH (name, pat, cont_val), exp ->
      (name, EffectH (pat, cont_val, exp)) :: scan_cases tl
    | _ -> scan_cases tl)
  | [] -> []
;;

let rec eval_exp state = function
  | EConst x ->
    (match x with
    | CInt x -> IntV x
    | CBool x -> BoolV x
    | CString x -> StringV x)
  | EVar x ->
    (try lookup_in_env x state with
    | Not_bound -> failwith "Interpretation error: undef variable.")
  | EOp (op, x, y) ->
    let exp_x = eval_exp state x in
    let exp_y = eval_exp state y in
    apply_infix_op op exp_x exp_y
  | EUnOp (op, x) ->
    let exp_x = eval_exp state x in
    apply_unary_op op exp_x
  | EList exps -> ListV (List.map (eval_exp state) exps)
  | ETuple exps -> TupleV (List.map (eval_exp state) exps)
  | ECons (exp1, exp2) ->
    let exp1_evaled = eval_exp state exp1 in
    let exp2_evaled = eval_exp state exp2 in
    (match exp2_evaled with
    | ListV list -> ListV ([ exp1_evaled ] @ list)
    | x -> ListV [ exp1_evaled; x ])
  | EIf (exp1, exp2, exp3) ->
    (match eval_exp state exp1 with
    | BoolV true -> eval_exp state exp2
    | BoolV false -> eval_exp state exp3
    | _ -> failwith "Interpretation error: couldn't interpret \"if\" expression")
  | ELet (bindings, exp1) ->
    let gen_state =
      List.fold_left
        (fun state binding ->
          match binding with
          | _, pat, exp ->
            let evaled = eval_exp state exp in
            let binds = match_pat pat evaled in
            List.fold_left (fun state (id, v) -> extend_env id v state) state binds)
        state
        bindings
    in
    eval_exp gen_state exp1
  | EFun (pat, exp) -> FunV (pat, exp, state)
  | EApp (exp1, exp2) ->
    (match eval_exp state exp1 with
    | FunV (pat, exp, fstate) ->
      let binds = match_pat pat (eval_exp state exp2) in
      let new_state =
        List.fold_left (fun state (id, v) -> extend_env id v state) fstate binds
      in
      let very_new_state =
        match exp1 with
        | EVar x -> extend_env x (eval_exp state exp1) new_state
        | _ -> new_state
      in
      eval_exp { very_new_state with context = state.context } exp
    | _ -> failwith "Interpretation error: wrong application")
  | EMatch (exp, mathchings) ->
    let effh = scan_cases mathchings in
    let exp_state =
      List.fold_left (fun state (id, v) -> extend_context id v state) state effh
    in
    let evaled = eval_exp exp_state exp in
    let rec do_match = function
      | [] -> failwith "Pattern matching is not exhaustive!"
      | (pat, exp) :: tl ->
        (try
           let binds = match_pat pat evaled in
           let state =
             List.fold_left (fun state (id, v) -> extend_env id v state) state binds
           in
           eval_exp state exp
         with
        | Match_fail -> do_match tl)
    in
    do_match mathchings
  | EPerform exp -> eval_exp state exp
  | EEffect (eff, exp) ->
    let (EffectH (pat, cont_val, exph)) =
      try lookup_in_context eff state with
      | Not_bound -> failwith "no handler for effect"
    in
    let lookup =
      try lookup_in_env eff state with
      | Not_bound -> failwith "no effect found"
    in
    (match lookup with
    | EffV tp ->
      let binds = (cont_val, ContV (tp, eff)) :: match_pat pat (eval_exp state exp) in
      let state =
        List.fold_left (fun state (id, v) -> extend_env id v state) state binds
      in
      eval_exp state exph
    | _ -> failwith "internal error")
  | EContinue (cont_val, exp) ->
    let lookup_cont =
      try lookup_in_env cont_val state with
      | Not_bound -> failwith "not a continuation value"
    in
    (match lookup_cont with
    | ContV (tp_cont, eff) ->
      let lookup_eff =
        try lookup_in_env eff state with
        | Not_bound -> failwith "effect not found"
      in
      (match lookup_eff with
      | EffV tp_eff ->
        if tp_cont = tp_eff then eval_exp state exp else failwith "wrong cont"
      | _ -> failwith "internal error")
    | _ -> failwith "internal error")
;;

let eval_dec state = function
  | DLet bindings ->
    (match bindings with
    | _, pat, exp ->
      let evaled = eval_exp state exp in
      let binds = match_pat pat evaled in
      let state =
        List.fold_left (fun state (id, v) -> extend_env id v state) state binds
      in
      state)
  | DEffect (name, tp) -> extend_env name (EffV tp) state
;;

let eval_test decls expected =
  try
    let init_state = { env = empty_id_map; context = empty_eff_map } in
    let state = List.fold_left (fun state decl -> eval_dec state decl) init_state decls in
    let res =
      IdMap.fold
        (fun k v ln ->
          let new_res = ln ^ Printf.sprintf "%s -> %s " k (exval_to_str v) in
          new_res)
        state.env
        ""
    in
    if res = expected
    then true
    else (
      Printf.printf "%s" res;
      false)
  with
  | Tuple_compare ->
    if expected = "Interpretation error: Cannot compare tuples of different size."
    then true
    else false
;;

let test code expected =
  match Parser.parse Parser.prog code with
  | Result.Ok prog -> eval_test prog expected
  | _ -> failwith "Parse error"
;;

(* Eval test 1 *)

(* 
  let x = 1
*)
let%test _ = eval_test [ DLet (false, PVar "x", EConst (CInt 1)) ] "x -> 1 "

(* Eval test 2 *)

(* 
  let (x, y) = (1, 2)
*)
let%test _ =
  eval_test
    [ DLet
        (false, PTuple [ PVar "x"; PVar "y" ], ETuple [ EConst (CInt 1); EConst (CInt 2) ])
    ]
    "x -> 1 y -> 2 "
;;

(* Eval test 3 *)

(* 
  let x = 3 < 2
*)
let%test _ =
  eval_test
    [ DLet (false, PVar "x", EOp (Less, EConst (CInt 3), EConst (CInt 2))) ]
    "x -> false "
;;

(* Eval test 4 *)

(* 
  let x = (1, 2) < (1, 2, 3)
*)
let%test _ =
  eval_test
    [ DLet
        ( false
        , PVar "x"
        , EOp
            ( Less
            , ETuple [ EConst (CInt 1); EConst (CInt 2) ]
            , ETuple [ EConst (CInt 1); EConst (CInt 2); EConst (CInt 3) ] ) )
    ]
    "Interpretation error: Cannot compare tuples of different size."
;;

(* Eval test 5 *)

(* 
  let x =
    let y = 5
    in y
*)
let%test _ =
  eval_test
    [ DLet (false, PVar "x", ELet ([ false, PVar "y", EConst (CInt 5) ], EVar "y")) ]
    "x -> 5 "
;;

(* Eval test 6 *)

(* 
  let x =
    let y = 5 in
    let z = 10 in
    y + z
*)
let%test _ =
  eval_test
    [ DLet
        ( false
        , PVar "x"
        , ELet
            ( [ false, PVar "y", EConst (CInt 5); false, PVar "z", EConst (CInt 10) ]
            , EOp (Add, EVar "y", EVar "z") ) )
    ]
    "x -> 15 "
;;

(* Eval test 7 *)

(* 
  let x =
    let y = 5 in
    let y = 10 in
    y
*)
let%test _ =
  eval_test
    [ DLet
        ( false
        , PVar "x"
        , ELet
            ( [ false, PVar "y", EConst (CInt 5); false, PVar "y", EConst (CInt 10) ]
            , EVar "y" ) )
    ]
    "x -> 10 "
;;

(* Eval test 8 *)

(* 
  let x =
    let y =
      let y = 10 in
      5
    in
    y
*)
let%test _ =
  eval_test
    [ DLet
        ( false
        , PVar "x"
        , ELet
            ( [ ( false
                , PVar "y"
                , ELet ([ false, PVar "y", EConst (CInt 10) ], EConst (CInt 5)) )
              ]
            , EVar "y" ) )
    ]
    "x -> 5 "
;;

(* Eval test 9 *)

(* 
  let f x y = x + y
*)
let%test _ =
  eval_test
    [ DLet
        (false, PVar "f", EFun (PVar "x", EFun (PVar "y", EOp (Add, EVar "x", EVar "y"))))
    ]
    "f -> x "
;;

(* Eval test 10 *)

(* 
  let f x y = x + y
  let a = f 1 2 
*)
let%test _ =
  eval_test
    [ DLet
        (false, PVar "f", EFun (PVar "x", EFun (PVar "y", EOp (Add, EVar "x", EVar "y"))))
    ; DLet (false, PVar "a", EApp (EApp (EVar "f", EConst (CInt 1)), EConst (CInt 2)))
    ]
    "a -> 3 f -> x "
;;

(* Eval test 11 *)

(* 
  let f x y = x + y
  let kek = f 1
  let lol = kek 2 
*)
let%test _ =
  eval_test
    [ DLet
        (false, PVar "f", EFun (PVar "x", EFun (PVar "y", EOp (Add, EVar "x", EVar "y"))))
    ; DLet (false, PVar "kek", EApp (EVar "f", EConst (CInt 1)))
    ; DLet (false, PVar "lol", EApp (EVar "kek", EConst (CInt 2)))
    ]
    "f -> x kek -> y lol -> 3 "
;;

(* Eval test 12 *)

(* 
  let rec fact n =
  match n with
  | 0 -> 1
  | _ -> n * fact (n + -1)
  let x = fact 3
*)
let%test _ =
  eval_test
    [ DLet
        ( true
        , PVar "fact"
        , EFun
            ( PVar "n"
            , EMatch
                ( EVar "n"
                , [ PConst (CInt 0), EConst (CInt 1)
                  ; ( PWild
                    , EOp
                        ( Mul
                        , EVar "n"
                        , EApp
                            ( EVar "fact"
                            , EOp (Add, EVar "n", EUnOp (Minus, EConst (CInt 1))) ) ) )
                  ] ) ) )
    ; DLet (false, PVar "x", EApp (EVar "fact", EConst (CInt 3)))
    ]
    "fact -> n x -> 6 "
;;

(* Eval test 13 *)

(*
  let rec sort lst =
    let sorted =
      match lst with
      | hd1 :: hd2 :: tl ->
        if hd1 > hd2 then hd2 :: sort (hd1 :: tl) else hd1 :: sort (hd2 :: tl)
      | tl -> tl
    in
    if lst = sorted then lst else sort sorted
  ;;

  let l = [1; 2; 3]
  let sorted = sort l
*)
let%test _ =
  eval_test
    [ DLet
        ( true
        , PVar "sort"
        , EFun
            ( PVar "lst"
            , ELet
                ( [ ( false
                    , PVar "sorted"
                    , EMatch
                        ( EVar "lst"
                        , [ ( PCons (PVar "hd1", PCons (PVar "hd2", PVar "tl"))
                            , EIf
                                ( EOp (Gre, EVar "hd1", EVar "hd2")
                                , ECons
                                    ( EVar "hd2"
                                    , EApp (EVar "sort", ECons (EVar "hd1", EVar "tl")) )
                                , ECons
                                    ( EVar "hd1"
                                    , EApp (EVar "sort", ECons (EVar "hd2", EVar "tl")) )
                                ) )
                          ; PVar "tl", EVar "tl"
                          ] ) )
                  ]
                , EIf
                    ( EOp (Eq, EVar "lst", EVar "sorted")
                    , EVar "lst"
                    , EApp (EVar "sort", EVar "sorted") ) ) ) )
    ; DLet (false, PVar "l", EList [ EConst (CInt 1); EConst (CInt 3); EConst (CInt 2) ])
    ; DLet (false, PVar "sorted", EApp (EVar "sort", EVar "l"))
    ]
    "l -> [1;3;2] sort -> lst sorted -> [1;2;3] "
;;

(* Eval test 14 *)

(* 
  effect Failure: int -> int

  let helper x = 1 + perform (Failure x)

  let matcher x = match helper x with
    | effect (Failure s) k -> continue k (1 + s)
    | 3 -> 0 <- success if this one since both helper and effect perform did 1+
    | _ -> 100
  
  let y = matcher 1 <- must be 3 upon success
*)
let%test _ =
  eval_test
    [ DEffect ("Failure", TArrow (TInt, TInt))
    ; DLet
        ( false
        , PVar "helper"
        , EFun
            ( PVar "x"
            , EOp (Add, EConst (CInt 1), EPerform (EEffect ("Failure", EVar "x"))) ) )
    ; DLet
        ( false
        , PVar "matcher"
        , EFun
            ( PVar "x"
            , EMatch
                ( EApp (EVar "helper", EVar "x")
                , [ ( PEffectH ("Failure", PVar "s", "k")
                    , EContinue ("k", EOp (Add, EConst (CInt 1), EVar "s")) )
                  ; PConst (CInt 3), EConst (CInt 0)
                  ; PWild, EConst (CInt 100)
                  ] ) ) )
    ; DLet (false, PVar "y", EApp (EVar "matcher", EConst (CInt 1)))
    ]
    "Failure -> eff helper -> x matcher -> x y -> 0 "
;;