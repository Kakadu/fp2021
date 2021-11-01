type identifier = string
[@@deriving show {with_path= false}]

type arithop = Add | Sub | Mul | Div 
[@@deriving show {with_path= false}]

type boolop = And | Or
[@@deriving show {with_path= false}]
  
type number = Int of int
[@@deriving show {with_path= false}]

type expr = 
  | ArithOp of arithop * expr * expr
  | Number of number
  | BoolOp of boolop * expr * expr
  | True 
  | False 
  | Var of identifier
  | LetBind of identifier * expr
  | LetBindIn of identifier * expr * expr
[@@deriving show {with_path= false}]

  