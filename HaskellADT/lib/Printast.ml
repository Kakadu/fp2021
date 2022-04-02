open Ast
open Format

let rec pp_bin_op fmt expr =
  match expr with
  | EBinOp (op, e1, e2) ->
    (match op with
    | Add -> fprintf fmt "(Add, %a, %a)" pp_expr e1 pp_expr e2
    | Sub -> fprintf fmt "(Sub, %a, %a)" pp_expr e1 pp_expr e2
    | Mul -> fprintf fmt "(Mul, %a, %a)" pp_expr e1 pp_expr e2
    | Div -> fprintf fmt "(Div, %a, %a)" pp_expr e1 pp_expr e2
    | LE -> fprintf fmt "(LE, %a, %a)" pp_expr e1 pp_expr e2
    | LT -> fprintf fmt "(LT, %a, %a)" pp_expr e1 pp_expr e2
    | GE -> fprintf fmt "(GE, %a, %a)" pp_expr e1 pp_expr e2
    | GT -> fprintf fmt "(GT, %a, %a)" pp_expr e1 pp_expr e2
    | EQ -> fprintf fmt "(EQ, %a, %a)" pp_expr e1 pp_expr e2
    | NE -> fprintf fmt "(NE, %a, %a)" pp_expr e1 pp_expr e2
    | And -> fprintf fmt "(And, %a, %a)" pp_expr e1 pp_expr e2
    | Or -> fprintf fmt "(Or, %a, %a)" pp_expr e1 pp_expr e2)
  | _ -> failwith "Not BinOp"

and pp_expr fmt expr =
  match expr with
  | EConst c ->
    (match c with
    | CInt i -> fprintf fmt "EConst (CInt %d)" i
    | CString s -> fprintf fmt "EConst (CString %s)" s
    | CBool b -> fprintf fmt (if b then "EConst (CBool True)" else "EConst (CBool False)"))
  | ETuple t ->
    fprintf
      fmt
      "ETuple (%a)"
      (pp_print_list ~pp_sep:(fun _ _ -> fprintf fmt ", ") pp_expr)
      t
  | EFun (pat, expr, _) -> fprintf fmt "EFun (%a, %a)" pp_pat pat pp_expr expr
  | ECtor (id, value) -> fprintf fmt "ECtor (%s %a)" id pp_expr value
  | EApp (e1, e2) -> fprintf fmt "EApp (%a, %a)" pp_expr e1 pp_expr e2
  | EBinOp _ -> fprintf fmt "EBinOp %a" pp_bin_op expr
  | EUnOp _ -> fprintf fmt "EUnOp"
  | EVar name -> fprintf fmt "EVar \"%s\"" name
  | EIf (cond, then', else') ->
    fprintf fmt "EIf (%a, %a, %a)" pp_expr cond pp_expr then' pp_expr else'
  | ECons (hd, tl) -> fprintf fmt "ECons (%a, %a)" pp_expr hd pp_expr tl
  | ENull -> fprintf fmt "ENull"
  | Undefined -> fprintf fmt "Undefined"
  | ELet (bindings, expr) ->
    fprintf
      fmt
      "ELet ([%a], %a)"
      (pp_print_list ~pp_sep:(fun _ _ -> fprintf fmt "; ") pp_binding)
      bindings
      pp_expr
      expr
  | ECase (expr, lst) ->
    fprintf
      fmt
      "Case (%a, [%a])"
      pp_expr
      expr
      (pp_print_list ~pp_sep:(fun _ _ -> fprintf fmt "; ") pp_binding)
      lst

and pp_pat fmt pat =
  match pat with
  | PVar id -> fprintf fmt "PVar \"%s\"" id
  | PWild -> fprintf fmt "PWild"
  | PConst c ->
    (match c with
    | CInt i -> fprintf fmt "PConst (CInt %d)" i
    | CString s -> fprintf fmt "PConst (CString %s)" s
    | CBool b -> fprintf fmt "PConst (CBool %b)" b)
  | PCons (hd, tl) -> fprintf fmt "PCons (%a, %a)" pp_pat hd pp_pat tl
  | PNull -> fprintf fmt "PNull"
  | PUnit -> fprintf fmt "PUnit"
  | PTuple lst ->
    fprintf
      fmt
      "PTuple (%a)"
      (pp_print_list ~pp_sep:(fun _ _ -> fprintf fmt ", ") pp_pat)
      lst
  | PAdt (id, pat) -> fprintf fmt "PAdt (%s, %a)" id pp_pat pat

and pp_tyexpr fmt = function
  | TInt -> fprintf fmt "Int"
  | TBool -> fprintf fmt "Bool"
  | TString -> fprintf fmt "String"
  | TList ty -> fprintf fmt "[%a]" pp_tyexpr ty
  | TTuple ty_lst ->
    fprintf
      fmt
      "(%a)"
      (pp_print_list ~pp_sep:(fun _ _ -> fprintf fmt ", ") pp_tyexpr)
      ty_lst
  | TArrow (ty1, ty2) -> fprintf fmt "%a -> %a" pp_tyexpr ty1 pp_tyexpr ty2
  | TAdt id -> fprintf fmt "%s" id

and pp_binding fmt (pat, expr) = fprintf fmt "(%a, %a)" pp_pat pat pp_expr expr
and pp_actor fmt (id, ty) = fprintf fmt "%s %a" id pp_tyexpr ty

and pp_adt fmt (id, lst) =
  fprintf
    fmt
    "%s, [%a]"
    id
    (pp_print_list ~pp_sep:(fun _ _ -> fprintf fmt ", ") pp_actor)
    lst

and pp_decl fmt = function
  | DLet binding -> fprintf fmt "DLet %a" pp_binding binding
  | DAdt adt -> fprintf fmt "DAdt (%a)" pp_adt adt

and pp_prog fmt decl_lst =
  fprintf
    fmt
    "[%a]"
    (pp_print_list ~pp_sep:(fun _ _ -> fprintf fmt ";\n ") pp_decl)
    decl_lst
;;
