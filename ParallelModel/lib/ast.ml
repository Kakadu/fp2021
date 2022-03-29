type expr =
  | INT of int
  | VAR_NAME of string (** variable shared by multiple threads *)
  | REGISTER of string (** thread local registers *)
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
      (** if expr <> 0 then execute a list of statements within curly brackets *)
  | IF_ELSE of expr * stmt list * stmt list
      (** if expr <> 0 then execute the first list of statements within curly brackets 
  else execute the second one *)
  | SMP_MB (** memory barrier that flushes store buffer *)
  | NO_OP
[@@deriving show { with_path = false }]

type thread = THREAD of (int * stmt list) [@@deriving show { with_path = false }]
type prog = PROG of thread list [@@deriving show { with_path = false }]
