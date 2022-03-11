type expr =
  | INT of int
  | VAR_NAME of string
  | REGISTER of string
  | PLUS of expr * expr
  | SUB of expr * expr
  | MUL of expr * expr
  | DIV of expr * expr

type stmt =
  | ASSIGN of expr * expr
  | IF of expr * stmt
  | IF_ELSE of expr * stmt * stmt
  | BLOCK of stmt list
  | SMP_RMB
  | SMP_WMB
  | SMP_MB
  | NO_OP

type thread = THREAD of (int * stmt list)

type prog = PROG of thread list
