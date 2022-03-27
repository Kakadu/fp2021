type expr =
  | INT of int
  | VAR_NAME of string
  | REGISTER of string
  | PLUS of expr * expr
  | SUB of expr * expr
  | MUL of expr * expr
  | DIV of expr * expr
[@@deriving show { with_path = false }]

type stmt =
  (* | ASSERT of expr *)
  | ASSIGN of expr * expr
  (* | WHILE of expr * stmt list *)
  | IF of expr * stmt list
  | IF_ELSE of expr * stmt list * stmt list
  | SMP_MB
  | NO_OP
[@@deriving show { with_path = false }]

type thread = THREAD of (int * stmt list)
[@@deriving show { with_path = false }]

type prog = PROG of thread list [@@deriving show { with_path = false }]
