open Ast
open Angstrom
open Base

let chainl1 e op = 
  let rec go acc = lift2 (fun f x -> f acc x) op e >>= go <|> return acc in
  e >>= fun init -> go init

let rec chainr1 e op = 
  e >>= fun a -> op >>= (fun f -> chainr1 e op >>| f a) <|> return a

let is_ws = function 
 | ' ' | '\t' -> true
 | _ -> false

let is_eol = function
 | '\r' | '\n' -> true
 | _ -> false

let is_digit = function
 | '0' .. '9' -> true
 | _ -> false

let is_keyword = function
 | "case" | "of" | "if" | "then" | "else" | "let" | "in" | "where" | "data" | "True" | "False" -> true
 | _ -> false

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
let efun args rhs =
  let helper p e = EFun (p, e) in
  List.fold_right args ~f:helper ~init:rhs

let ccase p e = (p, e)
let acase id p = (id, p)
let pacase id p = PACase (id, p)
let bbind p e = (p, e)

let pwild _ = PWild
let pvar id = PVar id
let pconst c = PConst c
let ptuple l = PTuple l
let popcons = token ":" *> return (fun p1 p2 -> PCons (p1, p2))
let pcons = return @@ fun p1 p2 -> PCons (p1, p2)
let plist = List.fold_right ~f:(fun p1 p2 -> PCons (p1, p2)) ~init:PNull

let dlet p e = DLet (p, e)

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
  | 'A'..'Z' | 'a'..'z' | '0'..'9' | '_' | '\'' -> true
  | _ -> false

let id valid_fst =
  let* fst = empty *> satisfy valid_fst in
  let take_func =
    match fst with
    | '_' -> many1
    | _ -> many
  in
  let* inner = take_func @@ satisfy is_idchar in
  let id = Base.String.of_char_list @@ (fst :: inner) in
  if is_keyword id then fail "Keyword" else return id
;;

let ident =
  let is_valid_first_char = function 'a' .. 'z' | '_' -> true | _ -> false in
  id is_valid_first_char
let constr_ident =
  let is_valid_first_char = function 'A' .. 'Z' -> true | _ -> false in
  id is_valid_first_char


let capitalized_ident =
  id
  @@ function
  | 'A' .. 'Z' -> true
  | _ -> false
;;

let cuint = 
  trim (take_while1 is_digit) 
  >>= fun num -> return (Int.of_string num) >>| cint 

let cint = 
  trim (option "" (token "+" <|> token "-"))
  >>= fun sign -> take_while1 is_digit
  >>= fun num -> return (Int.of_string (sign ^ num)) >>| cint

let cbool = 
  let ctrue = kwd "True" *> return (cbool true) in
  let cfalse = kwd "False" *> return (cbool false) in
  ctrue <|> cfalse

let cstring = 
  cstring <$> (kwd "\"" *> take_while (fun c -> not (phys_equal c '"')) <* string "\"")

let const = trim (choice [cint; cbool; cstring])
let uconst = trim (choice [cuint; cbool; cstring])


let pvar = ident >>| pvar
let pwild = token "_" >>| pwild
let pconst = const >>| pconst

type pdispatch =
  { tuple: pdispatch -> pat t
  ; cons: pdispatch -> pat t
  ; pat: pdispatch -> pat t
  ; adt: pdispatch -> pat t }

let pack = 
  let pat d = fix (fun _self -> trim (choice [d.tuple d; d.cons d; d.adt d])) in
  let tuple d = 
    fix (fun _self ->
      trim @@ lift2 (fun hd tl -> hd::tl) (d.cons d) (many1 (comma *> d.cons d))
      >>| ptuple) in
  let cons d = fix (fun _self -> chainr1 (d.adt d) popcons) in
  let adt d = fix (fun _self ->
    let plist =
      trim (between lsb rsb (sep_by comma (d.pat d))) >>| plist in
    let prim =
      trim @@ choice [pconst; pvar; pwild; plist; parens @@ d.pat d] in
    trim
      ( lift2 pacase constr_ident (option (PTuple []) (empty1 *> d.adt d))
      <|> prim ) ) in
  {tuple; cons; pat; adt}

let pattern = pack.pat pack

type edispatch =
  { key: edispatch -> expr t
  ; tuple: edispatch -> expr t
  ; expr: edispatch -> expr t
  ; op: edispatch -> expr t }

let app_unop p =
  choice
    [ token "-" *> p >>| eunop Minus; kwd "not" *> p >>| eunop Not; token "+" *> p; p ]
;;

let pack = 
  let expr d = fix (fun _self -> trim @@ d.key d <|> d.tuple d <|> d.op d) in
  let key d = fix (fun _self ->
    let eif = trim (lift3 eif
                      (kwd "if" *> d.expr d)
                      (kwd "then" *> d.expr d)
                      (kwd "else" *> d.expr d)) in
    let elet = 
      let binding = trim (lift2 bbind pattern 
                                      (lift2 efun (empty *> many pattern <* token "=") (d.expr d <* kwd "in")))
      in
      trim (lift2 elet (binding) (d.expr d))
    in
    let efun = trim (lift2 efun (kwd "\\" *> many pattern <* arrow) (d.expr d)) in
    let ecase = 
      let case1 = trim @@ lift2 ccase (empty *> pattern <* arrow) (d.expr d) in
      let casen = trim @@ lift2 ccase (empty *> pattern <* arrow) (d.expr d) in
      let cases = trim @@ lift2 (fun fst other -> fst :: other) (case1) (many casen) 
      in
      trim (lift2 ecase (kwd "case" *> empty1 *> d.expr d <* kwd "of") cases) in
    choice [elet; eif; efun; ecase])
  in
  let tuple d = lift2 (@) (lp *> many1 (d.op d <* comma) <* rp) (d.op d <|> d.key d >>| fun rhs -> [rhs]) >>| etuple
  in
  let op d = fix @@ fun _self -> 
    let lst = trim @@ between lsb rsb @@ sep_by comma (d.expr d) in
    let prim = trim @@ choice [lst >>| elist; uconst >>| econst; ident >>| evar
                              ; parens @@ d.expr d] in
    let procl op pl pr = 
      let rec go acc = 
        lift2 (fun f x -> f acc x) op (choice [pl >>= go; pr]) <|> return acc 
      in
      pl >>= go 
    in
    let app_op = 
      trim @@
        (lift2 (fun id prim -> ECtor (id, prim)) constr_ident prim <|>
         chainl1 prim eapp) 
    in
    trim @@ List.fold_right [add_sub; mult_div; cmp; eq_uneq; conj; disj]
    ~f:(fun x y -> procl x y @@ d.key d)
    ~init:app_op 
  in
  {key; tuple; expr; op}


let expr = pack.expr pack

let decl = 
  let dlet = lift2 dlet
    (kwd "let" *> empty1 *> pattern)
    (lift2 efun (empty1 *> many pattern <* token "=") expr) in
  trim @@ dlet

let prog = many1 (trim @@ decl <* trim (many (trim (token ";;"))) <|> decl)
let parse_with p s = parse_string ~consume:Consume.All p s

let parse_or_error s = 
  match parse_with prog s with
  | Ok ok -> ok
  | Error err -> 
    Caml.Format.printf "Error while parsing: %s\n" err;
    Caml.exit 1



let parse_test code expected =
  match parse_with prog code with
  | Ok ok -> (
    match List.equal equal_decl ok expected with
    | true -> true
    | false ->
        Caml.Format.printf "Expected: %a\nActual: %a\n" pp_prog expected
          pp_prog ok;
        false )
  | Error err ->
      Caml.Format.printf "Error: %s\n" err;
      false

let code = {|let x = 2 
             let y = x + 10 / 5
             let f x y = x + y
             let f1 y = f 1 y
             let _ = 10 * 12 + 7 / 2
             let xs = [1,2,3,4]
             let os = [1]
             let t = "Hello" > "Abs"
             let f x = case x of 0 -> True
             |}
let rez = parse_or_error code;;

let rez = Caml.Format.printf "%a\n" pp_prog rez

let%test _ =
  parse_test {|
  let x = 2
  let y = x + 10 / 5
|} [DLet (PVar ("x"), EConst (CInt (2)));
    DLet (PVar ("y"), EBinOp (Add, EVar ("x"), EBinOp (Div, EConst (CInt (10)), EConst (CInt (5)))))]