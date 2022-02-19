type signal =
  | Work
  | Break
  | Next
  | Return  (** to track the last impact in environment *)

type identifier = Null | Identifier of string
[@@deriving show { with_path = false }]

type modifier = Local | Instance | Global | Class
[@@deriving show { with_path = false }]

type value =
  | String of string
  | Integer of int
  | Float of float
  | Boolean of bool
  | Nil  (** "null" *)
  | Object of identifier  (** shows who's object a value is *)
  | Lambda of identifier list * statement list
  | List of expression list  (** calcs [expr -> value] when needed *)
[@@deriving show { with_path = false }]

and expression =
  | Constant of value
  | Variable of modifier * identifier
  | Add of expression * expression
  | Sub of expression * expression
  | Mul of expression * expression
  | Div of expression * expression
  | Mod of expression * expression
  | Equal of expression * expression
  | NotEqual of expression * expression
  | Greater of expression * expression
  | GreaterOrEq of expression * expression
  | Less of expression * expression
  | LessOrEq of expression * expression
  | And of expression * expression
  | Or of expression * expression
  | ListAccess of identifier * expression
  | Call of identifier * identifier * expression list
      (** (name of the parent: instance OR "Null" in case of stand-alone func) (name of the called func) [expr list] *)
  | CallLambda of identifier list * statement list * expression list
      (** [var list] [stmt list] [call parameters] *)
[@@deriving show { with_path = false }]

and statement =
  | Expression of expression
  | Assign of expression * expression
  | MultipleAssign of expression list * expression list  (** x, y = 1, 2 *)
  | Return of expression
  | IfElse of expression * statement list * statement list
      (** (expr) [stmt list] [stmt list OR [] in case of "else" absence] *)
  | While of expression * statement list
  | Class of identifier * statement list
  | Function of identifier * expression list * statement list
      (** (id) [args list] [stmt list] *)
  | Break
  | Next  (** "continue" *)
  | Puts of expression  (** console output *)
[@@deriving show { with_path = false }]
