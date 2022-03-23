type id = string [@@deriving eq, show { with_path = false }]

type bin_op =
  | Add (**  +   *)
  | Sub (**  -   *)
  | Mul (**  *   *)
  | Div (**  /   *)
  | LT (**  <   *)
  | LE (**  <=  *)
  | GT (**  >   *)
  | GE (**  >=  *)
  | NE (**  /=  *)
  | EQ (**  ==  *)
  | And (**  &&  *)
  | Or (**  ||  *)
[@@deriving eq, show { with_path = false }]

and const =
  | CBool of bool (** True    *)
  | CInt of int (** 201     *)
  | CString of string (** "OCaml" *)
[@@deriving eq, show { with_path = false }]

and expr =
  | EConst of const (**  1  *)
  | EBinOp of bin_op * expr * expr (**  201 - 1  *)
  | EVar of id (**  a  *)
  | ETuple of expr list (**  ("Tom", "Hardy", 44)  *)
  | ECons of expr * expr (**  h : tl  *)
  | ENull (**  []  *)
  | EApp of expr * expr (**  f x y  = (f x) y*)
  | EIf of expr * expr * expr (**  if x >= 5 then "Nice" else "Bad"  *)
  | ELet of binding * expr (**  let x = 5; y = 10 in x + y  *)
  | ECase of expr * case list
      (**  case xs of [] -> -100
                      (x:_) -> x  *)
  | ECtor of id * expr (**  (Point 1 1) *)
  | EFun of pat * expr (**  \x -> x + 10  *)
[@@deriving eq, show { with_path = false }]

and case = pat * expr
(*  _ -> 100*)

and actor = id * tyexpr
(*  Point Int Int  *)

(**  fact 0 = 1
         fact n = n * fact (n - 1)*)
and binding = pat * expr [@@deriving eq, show { with_path = false }]

and pat =
  | PWild (**  _  *)
  | PConst of const (** True  *)
  | PVar of id (**  x  *)
  | PCons of pat * pat (** hd : tl  *)
  | PNull (**  []  *)
  | PTuple of pat list (**  (_, 1, "A")  *)
  | PAdt of id * pat (**  Point 3 0  *)
[@@deriving eq, show { with_path = false }]

and tyexpr =
  | TInt
  | TBool
  | TString
  | TList of tyexpr
  | TTuple of tyexpr list
  | TArrow of tyexpr * tyexpr (** string -> string *)
  | TAdt of id
[@@deriving eq, show { with_path = false }]

and adt = id * actor list

and decl =
  | DLet of binding
  | DAdt of adt
[@@deriving eq, show { with_path = false }]

and prog = decl list [@@deriving eq, show { with_path = false }]
