open Containers

type id = string [@@deriving eq, show { with_path = false }]

module BindsMap = CCMap.Make (String)

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
[@@deriving eq]

and un_op =
  | Minus
  | Not
  | Fst
  | Snd
  | Head
  | Tail
[@@deriving eq]

and const =
  | CBool of bool (** True    *)
  | CInt of int (** 201     *)
  | CString of string (** "OCaml" *)
[@@deriving eq]

and expr =
  | EConst of const (**  1  *)
  | EBinOp of bin_op * expr * expr (**  201 - 1  *)
  | EUnOp of un_op * expr (** -1 *)
  | EVar of id (**  a  *)
  | ETuple of expr list (**  ("Tom", "Hardy", 44)  *)
  | ECons of expr * expr (**  h : tl  *)
  | ENull (**  []  *)
  | EApp of expr * expr (**  f x y  = (f x) y*)
  | EIf of expr * expr * expr (**  if x >= 5 then "Nice" else "Bad"  *)
  | ELet of binding list * expr (**  let x = 5; y = 10 in x + y  *)
  | ECase of expr * case list
      (**  case xs of [] -> -100
                      (x:_) -> x  *)
  | ECtor of id * expr (**  (Point 1 1) *)
  | EFun of pat * expr * env (**  \x -> x + 10  *)
  | Undefined
[@@deriving eq]

and env = expr option ref BindsMap.t [@@derivind eq]
and case = pat * expr
(*  _ -> 100*)

and actor = id * tyexpr
(*  Point Int Int  *)

and binding = pat * expr [@@deriving eq]

and pat =
  | PWild (**  _  *)
  | PConst of const (** True  *)
  | PVar of id (**  x  *)
  | PCons of pat * pat (** hd : tl  *)
  | PNull (**  []  *)
  | PTuple of pat list (**  (_, 1, "A")  *)
  | PAdt of id * pat (**  Point 3 0  *)
  | PUnit
[@@deriving eq]

and tyexpr =
  | TInt
  | TBool
  | TString
  | TList of tyexpr
  | TTuple of tyexpr list
  | TArrow of tyexpr * tyexpr (** string -> string *)
  | TAdt of id
[@@deriving eq]

and adt = id * actor list

and decl =
  | DLet of binding
  | DAdt of adt
[@@deriving eq]

and prog = decl list [@@deriving eq]
