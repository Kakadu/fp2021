(* type name = string

   (** The main type for our AST (дерева абстрактного синтаксиса) *)
   type 'name t =
     | Var of 'name (** Variable [x] *)
     | Abs of 'name * 'name t (** Abstraction [λx.t] *)
     | App of 'name t * 'name t

   (* Application [f g ] *)
   (** In type definition above the 3rd constructor is intentionally without documentation
   to test linter *) *)

(* type bin_op = PLUS | MINUS | MULT | DIV *)

(* type named_location = Var of string | Reg of string *)

type expr =
  | INT of int
  | VAR_NAME of string
  | REGISTER of string
  | PLUS of expr * expr
  | SUB of expr * expr
  | MUL of expr * expr
  | DIV of expr * expr

(* type expr =
   | INT of int
   | PLUS of expr * expr
   | SUB of expr * expr
   | MUL of expr * expr
   | DIV of expr * expr
   | Named_loc of named_location *)

type stmt =
  | ASSIGN of expr * expr
  | IF of expr * stmt
  | IF_ELSE of expr * stmt * stmt
  | BLOCK of stmt list
  | SMP_RMB
  | SMP_WMB
  | SMP_MB

type thread = THREAD of stmt list

type prog = PROG of thread list
