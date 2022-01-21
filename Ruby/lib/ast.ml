type value =
  | String of string
  | Integer of int
  | Float of float
  | Boolean of bool
[@@deriving show { with_path = false }]

type identifier = None | Identifier of string
[@@deriving show { with_path = false }]

type modifier = Local | Instance | Global | Class
[@@deriving show { with_path = false }]

type expression =
  | Constant of value
  | Variable of modifier * identifier
  | Add of expression * expression
  | Sub of expression * expression
  | Mul of expression * expression
  | Div of expression * expression
  | Mod of expression * expression
  | Equal of expression * expression
  | Greater of expression * expression
  | GreaterOrEq of expression * expression
  | Less of expression * expression
  | LessOrEq of expression * expression
  | And of expression * expression
  | Or of expression * expression
  | List of expression list
  | Call of identifier * identifier * expression list
  | Lambda of expression list * statement list
  | Nil
[@@deriving show { with_path = false }]

and statement =
  | Expression of expression
  | Assign of expression * expression
  | Return of expression
  | IfElse of expression * statement list * statement list
  | While of expression * statement list
  | Class of identifier * statement list
  | Function of identifier * expression list * statement list
  | Break
  | Next
[@@deriving show { with_path = false }]
