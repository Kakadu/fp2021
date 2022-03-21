open Ast
open Angstrom
open Base

let chainl1 e op =
  let rec go acc = lift2 (fun f x -> f acc x) op e >>= go <|> return acc in
  e >>= fun init -> go init
;;

let rec chainr1 e op = e >>= fun a -> op >>= (fun f -> chainr1 e op >>| f a) <|> return a

let is_ws = function
  | ' ' | '\t' -> true
  | _ -> false
;;

let is_eol = function
  | '\r' | '\n' -> true
  | _ -> false
;;

let is_digit = function
  | '0' .. '9' -> true
  | _ -> false
;;

let is_keyword = function
  | "case"
  | "of"
  | "if"
  | "then"
  | "else"
  | "let"
  | "in"
  | "where"
  | "data"
  | "True"
  | "False" -> true
  | _ -> false
;;

let empty = take_while (fun c -> is_ws c || is_eol c)
let empty1 = take_while1 (fun c -> is_ws c || is_eol c)
let token s = empty *> string s
let trim p = empty *> p
let kwd s = empty *> token s
let between l r p = l *> p <* r

(* braces *)
let lp = token "("
let rp = token ")"
let lsb = token "["
let rsb = token "]"
let comma = token ","
let colon = token ":"
let semi = token ";"
let bar = token "|"
let arrow = token "->"
let parens p = lp *> p <* rp
let cbool b = CBool b
let cint n = CInt n
let cstring s = CString s
let econst c = EConst c
let ebinop o e1 e2 = EBinOp (o, e1, e2)
let eunop o e = EUnOp (o, e)
let evar id = EVar id
let etuple e = ETuple e
let econs e1 e2 = ECons (e1, e2)
let eapp = return (fun e1 e2 -> EApp (e1, e2))
let eif e1 e2 e3 = EIf (e1, e2, e3)
let elet binds e = ELet (binds, e)
let elist = List.fold_right ~f:econs ~init:ENull
let ecase e ls = ECase (e, ls)
let ector id e = ECtor (id, e)

let efun args rhs =
  let helper p e = EFun (p, e) in
  List.fold_right args ~f:helper ~init:rhs
;;

let ccase p e = p, e
let acase id p = id, p
let pacase id p = PACase (id, p)
let actor id ty = id, ty
let bbind p e = p, e
let pwild _ = PWild
let pvar id = PVar id
let pconst c = PConst c
let ptuple l = PTuple l
let popcons = token ":" *> return (fun p1 p2 -> PCons (p1, p2))
let pcons = return @@ fun p1 p2 -> PCons (p1, p2)
let plist = List.fold_right ~f:(fun p1 p2 -> PCons (p1, p2)) ~init:PNull
let dlet p e = DLet (p, e)
let dadt i a = DAdt (i, a)
let tint = TInt
let tbool = TBool
let tstring = TString
let tlist t = TList t
let ttuple l = TTuple l
let tarrow t1 t2 = TArrow (t1, t2)
let tadt i = TAdt i

let choice_op ops =
  choice @@ List.map ~f:(fun (tok, cons) -> token tok *> (return @@ ebinop cons)) ops
;;

let add_sub = choice_op [ "+", Add; "-", Sub ]
let mult_div = choice_op [ "*", Mul; "/", Div ]
let cmp = choice_op [ ">=", GE; ">", GT; "<=", LE; "<", LT ]
let eq_uneq = choice_op [ "==", EQ; "<>", NE ]
let conj = choice_op [ "&&", And ]
let disj = choice_op [ "||", Or ]
let cons = token ":" *> return econs

(* let app_unop p =
  choice
    [ token "-" *> p >>| eunop Minus; kwd "not" *> p >>| eunop Not; token "+" *> p; p ]
;; *)

let is_idchar = function
  | 'A' .. 'Z' | 'a' .. 'z' | '0' .. '9' | '_' | '\'' -> true
  | _ -> false
;;

let id valid_fst =
  let* fst = empty *> satisfy valid_fst in
  let take_func =
    match fst with
    | '_' -> many1
    | _ -> many
  in
  let* inner = take_func @@ satisfy is_idchar in
  let id = Base.String.of_char_list @@ (fst :: inner) in
  if is_keyword id then fail @@ "Keyword" else return id
;;

let ident =
  let is_valid_first_char = function
    | 'a' .. 'z' | '_' -> true
    | _ -> false
  in
  id is_valid_first_char
;;

let constr_ident =
  let is_valid_first_char = function
    | 'A' .. 'Z' -> true
    | _ -> false
  in
  id is_valid_first_char
;;

let cuint = trim (take_while1 is_digit) >>= fun num -> return (Int.of_string num) >>| cint

let cint =
  trim (option "" (token "+" <|> token "-"))
  >>= fun sign ->
  take_while1 is_digit >>= fun num -> return (Int.of_string (sign ^ num)) >>| cint
;;

let cbool =
  let ctrue = kwd "True" *> return (cbool true) in
  let cfalse = kwd "False" *> return (cbool false) in
  ctrue <|> cfalse
;;

let cstring =
  cstring <$> (kwd "\"" *> take_while (fun c -> not (phys_equal c '"')) <* string "\"")
;;

let const = trim (choice [ cint; cbool; cstring ])
let uconst = trim (choice [ cuint; cbool; cstring ])
let pvar = ident >>| pvar
let pwild = token "_" >>| pwild
let pconst = const >>| pconst

type pdispatch =
  { tuple: pdispatch -> pat t
  ; adt: pdispatch -> pat t
  ; other: pdispatch -> pat t
  ; pat: pdispatch -> pat t
  }

let pack =
  let pat d = fix @@ fun _self -> trim @@ choice [ d.tuple d; d.other d; d.adt d ] in
  let tuple d =
    fix
    @@ fun _self ->
    trim @@ lift2 (fun hd tl -> hd :: tl) (d.other d) (many1 (comma *> d.other d))
    >>| ptuple
  in
  let adt d =
    fix
    @@ fun _self ->
    trim
    @@ lift2
         pacase
         constr_ident
         (option
            (PTuple [])
            (many (empty1 *> d.pat d)
            >>| function
            | [ x ] -> x
            | lst -> PTuple lst))
  in
  let other d =
    fix
    @@ fun _self ->
    let plist = trim @@ between lsb rsb @@ sep_by semi @@ d.pat d >>| plist in
    let prim = trim @@ choice [ pconst; pvar; pwild; plist; parens @@ d.pat d ] in
    trim @@ chainr1 prim popcons
  in
  { tuple; adt; other; pat }
;;

let pattern = pack.pat pack

type edispatch =
  { key: edispatch -> expr t
  ; tuple: edispatch -> expr t
  ; expr: edispatch -> expr t
  ; op: edispatch -> expr t
  }

let app_unop p =
  choice
    [ token "-" *> p >>| eunop Minus; kwd "not" *> p >>| eunop Not; token "+" *> p; p ]
;;

let pack =
  let expr d = fix @@ fun _self -> trim @@ choice [ d.key d; d.tuple d; d.op d ] in
  let key d =
    fix
    @@ fun _self ->
    let eif =
      trim
        (lift3
           eif
           (kwd "if" *> d.expr d)
           (kwd "then" *> d.expr d)
           (kwd "else" *> d.expr d))
    in
    let elet =
      let binding =
        trim
          (lift2
             bbind
             (token "let" *> pattern)
             (lift2 efun (empty1 *> many pattern <* token "=") (d.expr d <* kwd "in")))
      in
      trim (lift2 elet binding (d.expr d))
    in
    let efun = trim (lift2 efun (kwd "\\" *> many pattern <* arrow) (d.expr d)) in
    let ecase =
      let case = trim @@ lift2 ccase (empty *> pattern <* arrow) (d.expr d) in
      let cases = trim @@ lift2 (fun fst other -> fst :: other) case (many case) in
      trim (lift2 ecase (kwd "case" *> empty1 *> d.expr d <* kwd "of") cases)
    in
    choice [ elet; eif; efun; ecase ]
  in
  let tuple d =
    lift2 ( @ ) (many1 (d.op d <* comma)) (d.op d <|> d.key d >>| fun rhs -> [ rhs ])
    >>| etuple
  in
  let op d =
    fix
    @@ fun _self ->
    let lst = trim @@ between lsb rsb @@ sep_by comma (d.expr d) in
    let prim =
      trim
      @@ choice
           [ lst >>| elist
           ; uconst >>| econst
           ; ident >>| evar
           ; parens @@ d.expr d
           ; (constr_ident >>| fun s -> ECtor (s, ETuple []))
           ]
    in
    let procl op pl pr =
      let rec go acc =
        lift2 (fun f x -> f acc x) op (choice [ pl >>= go; pr ]) <|> return acc
      in
      pl >>= go
    in
    let app_op =
      let help =
        lift2
          ector
          constr_ident
          (option
             (ETuple [])
             (many (empty1 *> prim)
             >>| function
             | [ x ] -> x
             | lst -> ETuple lst))
      in
      trim @@ help <|> chainl1 prim eapp
    in
    trim
    @@ List.fold_right
         [ add_sub; mult_div; cmp; eq_uneq; conj; disj ]
         ~f:(fun x y -> procl x y @@ d.key d)
         ~init:app_op
  in
  { key; tuple; expr; op }
;;

let expr = pack.expr pack

let tyexpr =
  fix
  @@ fun tyexpr ->
  let prim =
    trim
    @@ choice
         [ token "Int" *> return TInt
         ; token "String" *> return TString
         ; token "Bool" *> return TBool
         ; (constr_ident >>| fun i -> TAdt i)
         ; parens tyexpr
         ]
  in
  let list = lsb *> prim <* rsb >>| fun lst -> TList lst in
  let total =
    many1 (list <|> prim <* empty)
    >>| function
    | [ x ] -> x
    | tpl -> TTuple tpl
  in
  trim @@ chainr1 total (arrow *> return (fun t1 t2 -> TArrow (t1, t2)))
;;

let decl =
  let dlet =
    lift2
      dlet
      (kwd "let" *> empty1 *> pattern)
      (lift2 efun (empty1 *> many pattern <* token "=") expr)
  in
  let dadt =
    let actor_fst = lift2 actor constr_ident (option (TTuple []) (empty1 *> tyexpr)) in
    let actor_other =
      lift2 actor (token "|" *> constr_ident) (option (TTuple []) (empty1 *> tyexpr))
    in
    lift2
      dadt
      (kwd "data" *> empty1 *> constr_ident <* token "=")
      (lift2 (fun fst other -> fst :: other) actor_fst (many actor_other))
  in
  trim @@ dlet <|> dadt
;;

let prog = many1 (trim @@ decl <* trim (many (trim (token ";;"))) <|> decl)
let parse_with p s = parse_string ~consume:Consume.All p s

let parse_or_error s =
  match parse_with prog s with
  | Ok ok -> ok
  | Error err ->
    Caml.Format.printf "Error while parsing: %s\n" err;
    Caml.exit 1
;;

let parse_test code expected =
  match parse_with prog code with
  | Ok ok ->
    (match List.equal equal_decl ok expected with
    | true -> true
    | false ->
      Caml.Format.printf "Expected: %a\nActual: %a\n" pp_prog expected pp_prog ok;
      false)
  | Error err ->
    Caml.Format.printf "Error: %s\n" err;
    false
;;

let code =
  {|let x = 2 
             let y = x + 10 / 5
             let f x y = x + y
             let f1 y = f 1 y
             let _ = 10 * 12 + 7 / 2
             let xs = [1,2,3,4]
             let os = [1]
             let t = "Hello" > "Abs"
             let f x = case x of 0 -> True
             _ -> False
             let quickSort [] = []
             let quickSort x:xs = quickSort xs
             |}
;;

let rez = parse_or_error code

(* let rez = Caml.Format.printf "%a\n" pp_prog rez *)

(* let () = 
  let code = "
  let c = Circle 3" in 
  match parse_with prog code with
  | Ok ok -> Format.printf "%a\n" pp_prog ok
  | Error err -> Format.printf "%s\n" err *)

let%test _ =
  parse_test
    {|
    let x = 2
    let _ = x + ((10 + x * x)/700 + 10 / 5) - (x - 1)/x
  |}
    [ DLet (PVar "x", EConst (CInt 2))
    ; DLet
        ( PWild
        , EBinOp
            ( Add
            , EVar "x"
            , EBinOp
                ( Sub
                , EBinOp
                    ( Add
                    , EBinOp
                        ( Div
                        , EBinOp (Add, EConst (CInt 10), EBinOp (Mul, EVar "x", EVar "x"))
                        , EConst (CInt 700) )
                    , EBinOp (Div, EConst (CInt 10), EConst (CInt 5)) )
                , EBinOp (Div, EBinOp (Sub, EVar "x", EConst (CInt 1)), EVar "x") ) ) )
    ]
;;

let%test _ =
  parse_test
    {|
    let double_lst xs = map (\x -> 2 * x) xs 
  |}
    [ DLet
        ( PVar "double_lst"
        , EFun
            ( PVar "xs"
            , EApp
                ( EApp
                    (EVar "map", EFun (PVar "x", EBinOp (Mul, EConst (CInt 2), EVar "x")))
                , EVar "xs" ) ) )
    ]
;;

let%test _ =
  parse_test
    {|
    let f x y = x * y
    let f5 x = f 5 x
  |}
    [ DLet (PVar "f", EFun (PVar "x", EFun (PVar "y", EBinOp (Mul, EVar "x", EVar "y"))))
    ; DLet (PVar "f5", EFun (PVar "x", EApp (EApp (EVar "f", EConst (CInt 5)), EVar "x")))
    ]
;;

let%test _ =
  parse_test
    {|
    let rect_surface x1 y1 x2 y2 = 
      let abs x = if x > 0 then x else 0 - x in
      (abs (x1 - x2)) * (abs (y1 - y2)) 
  |}
    [ DLet
        ( PVar "rect_surface"
        , EFun
            ( PVar "x1"
            , EFun
                ( PVar "y1"
                , EFun
                    ( PVar "x2"
                    , EFun
                        ( PVar "y2"
                        , ELet
                            ( ( PVar "abs"
                              , EFun
                                  ( PVar "x"
                                  , EIf
                                      ( EBinOp (GT, EVar "x", EConst (CInt 0))
                                      , EVar "x"
                                      , EBinOp (Sub, EConst (CInt 0), EVar "x") ) ) )
                            , EBinOp
                                ( Mul
                                , EApp (EVar "abs", EBinOp (Sub, EVar "x1", EVar "x2"))
                                , EApp (EVar "abs", EBinOp (Sub, EVar "y1", EVar "y2")) )
                            ) ) ) ) ) )
    ]
;;

let%test _ =
  parse_test
    {|
      let ( ( e , s ) )      =      ( 1 ,  2 )
      let ( x , y , z , ( a , b ) ) = ( 1 , 2 , 3 , ( 4 , 5 ) )
    |}
    [ DLet (PTuple [ PVar "e"; PVar "s" ], ETuple [ EConst (CInt 1); EConst (CInt 2) ])
    ; DLet
        ( PTuple [ PVar "x"; PVar "y"; PVar "z"; PTuple [ PVar "a"; PVar "b" ] ]
        , ETuple
            [ EConst (CInt 1)
            ; EConst (CInt 2)
            ; EConst (CInt 3)
            ; ETuple [ EConst (CInt 4); EConst (CInt 5) ]
            ] )
    ]
;;

let%test _ =
  parse_test
    {|
      data Point = Point Int Int
      data Shape = Rectangle Point Point | Circle Point Int
      let s1 = Rectangle (Point 0 0) (Point 1 1)
      let s2 = Circle (Point 1 1) 1
    |}
    [ DAdt ("Point", [ "Point", TTuple [ TInt; TInt ] ])
    ; DAdt
        ( "Shape"
        , [ "Rectangle", TTuple [ TAdt "Point"; TAdt "Point" ]
          ; "Circle", TTuple [ TAdt "Point"; TInt ]
          ] )
    ; DLet
        ( PVar "s1"
        , ECtor
            ( "Rectangle"
            , ETuple
                [ ECtor ("Point", ETuple [ EConst (CInt 0); EConst (CInt 0) ])
                ; ECtor ("Point", ETuple [ EConst (CInt 1); EConst (CInt 1) ])
                ] ) )
    ; DLet
        ( PVar "s2"
        , ECtor
            ( "Circle"
            , ETuple
                [ ECtor ("Point", ETuple [ EConst (CInt 1); EConst (CInt 1) ])
                ; EConst (CInt 1)
                ] ) )
    ]
;;

let%test _ =
  parse_test
    {|
      let surface (Circle _ r) = p * r * r
      let surface (Rectangle (Point x1 y1) (Point x2 y2)) = abs (x1 - x2) * abs (y1 - y2)
    |}
    [ DLet
        ( PVar "surface"
        , EFun
            ( PACase ("Circle", PTuple [ PWild; PVar "r" ])
            , EBinOp (Mul, EVar "p", EBinOp (Mul, EVar "r", EVar "r")) ) )
    ; DLet
        ( PVar "surface"
        , EFun
            ( PACase
                ( "Rectangle"
                , PTuple
                    [ PACase ("Point", PTuple [ PVar "x1"; PVar "y1" ])
                    ; PACase ("Point", PTuple [ PVar "x2"; PVar "y2" ])
                    ] )
            , EBinOp
                ( Mul
                , EApp (EVar "abs", EBinOp (Sub, EVar "x1", EVar "x2"))
                , EApp (EVar "abs", EBinOp (Sub, EVar "y1", EVar "y2")) ) ) )
    ]
;;
