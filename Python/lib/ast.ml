type identifier = string
and params = identifier list

type modifier =
  | Local
  | Global
  | Class

type value =
  | Integer of int
  | Float of float
  | String of string
  | Bool of bool

type arithOp =
  | Add
  | Sub
  | Mul
  | Div
  | Mod

type boolOp =
  | And
  | Or
  | Not

type var = VarName of modifier * identifier
type lval = var list

type rval = expression list

and expression =
  | Const of value
  | Var of var
  | ArithOp of arithOp * expression * expression
  | BoolOp of boolOp * expression * expression
  | Eq of expression * expression
  | NotEq of expression * expression
  | Gr of expression * expression
  | Gre of expression * expression
  | Ls of expression * expression
  | Lse of expression * expression
  | Not of expression
  | List of expression list
  | FieldAccess of identifier * identifier
  | MethodAccess of identifier * identifier * expression list
  | MethodCall of identifier * expression list
  | Lambda of params * expression

and statements =
  | Expression of expression
  | Assign of expression list * rval
  | Block of int * statements
  | MethodDef of identifier * params * statements list
  | If of expression * statements list
  | Else of statements list
  | While of expression * statements list
  | For of expression * expression * statements list
    (*for i in range(N):\n\tstmt OR for i in range(someArray):\n\tstmt*)
  | Class of identifier * statements list
  | LvledStmt of int * statements (*it is for assign and expressions*)
