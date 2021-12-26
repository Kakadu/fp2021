type value = Int of int | Float of float | String of string
[@@deriving show { with_path = false }]

type variable = Identifier of string [@@deriving show { with_path = false }]

type expression =
  | Variable of variable
  | Constant of value
  | Add of expression * expression
  | Sub of expression * expression
  | Div of expression * expression
  | Mod of expression * expression
[@@deriving show { with_path = false }]

type statement =
  | Expression of expression
  | Assign of expression * expression
  | If of expression * statement * statement option
  | While of expression * statement
  | Return of expression
  | Break
  | Next
[@@deriving show { with_path = false }]
