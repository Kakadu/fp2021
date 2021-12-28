open Ast

(* -------------------- Monads to be passed to the interpreter -------------------- *)

(** Infix monad with a fail function *)
module type MonadFail = sig
  include Base.Monad.Infix

  val return : 'a -> 'a t
  val fail : string -> 'a t
end

(** Result as a monad-fail *)
module Result : MonadFail with type 'a t = ('a, string) result = struct
  type 'a t = ('a, string) result

  let return = Result.ok
  let ( >>= ) = Result.bind
  let ( >>| ) f g = f >>= fun x -> return (g x)
  let fail = Result.error
end

(* -------------------- Maps with pretty-printing -------------------- *)

(** Ordered type with pretty-printing *)
module type PpOrderedType = sig
  include Map.OrderedType

  val pp_t : Format.formatter -> t -> unit
end

(** Functor to create maps with pretty-printing for deriving *)
module TMap (T : PpOrderedType) = struct
  include Map.Make (T)

  let pp pp_v ppf m =
    Format.fprintf ppf "@[[@[";
    iter (fun k v -> Format.fprintf ppf "@[%a: %a@],@\n" T.pp_t k pp_v v) m;
    Format.fprintf ppf "@]]@]"
  ;;
end

(** Map with string keys *)
module SMap = TMap (struct
  include String

  let pp_t = Format.pp_print_string
end)

(** Map with integer keys *)
module IMap = TMap (struct
  include Int

  let pp_t = Format.pp_print_int
end)

(* -------------------- Interpreter -------------------- *)

(** Main interpreter module *)
module Eval (M : MonadFail) = struct
  open M

  (* -------------------- Environment -------------------- *)

  (** Container for values of variables *)
  type var_t =
    | Val of string (** Simple variable *)
    | IndArray of string IMap.t (** Indexed array *)
    | AssocArray of string SMap.t (** Associative array *)
  [@@deriving show { with_path = false }]

  (** Container for functions *)
  type fun_t = compound [@@deriving show { with_path = false }]

  type variables = var_t SMap.t [@@deriving show { with_path = false }]
  type functions = fun_t SMap.t [@@deriving show { with_path = false }]

  (** Complete environment *)
  type environment =
    { vars : variables
    ; funs : functions
    ; retcode : int
    }
  [@@deriving show { with_path = false }]

  let get_var name env = SMap.find_opt name env.vars
  let set_var name v env = SMap.add name v env.vars
  let get_fun name env = SMap.find_opt name env.funs
  let set_fun name v env = SMap.add name v env.funs

  (* -------------------- Evaluation -------------------- *)

  (** Evaluate variable *)
  let ev_var env =
    let find f a i =
      match f i a with
      | None -> ""
      | Some v -> v
    in
    function
    | SimpleVar name ->
      (match get_var name env with
      | None -> return ""
      | Some (Val v) -> return v
      | Some (IndArray vs) -> return (find IMap.find_opt vs 0)
      | Some (AssocArray vs) -> return (find SMap.find_opt vs "0"))
    | Subscript (name, index) ->
      (match get_var name env with
      | None -> return ""
      | Some (Val v) ->
        (match int_of_string_opt index with
        | None -> return v
        | Some i when i = 0 -> return v
        | Some _ -> return "")
      | Some (IndArray vs) ->
        (match int_of_string_opt index with
        | None -> return (find IMap.find_opt vs 0)
        | Some i -> return (find IMap.find_opt vs i))
      | Some (AssocArray vs) -> return (find SMap.find_opt vs index))
  ;;

  (** Evaluate arithmetic *)
  let ev_arithm envs =
    let rec ev_ari ?(c = fun _ _ -> true) ?(e = "") op l r =
      ev l >>= fun l -> ev r >>= fun r -> if c l r then return (op l r) else fail e
    and ev_log op l r = ev l >>= fun l -> ev r >>| fun r -> if op l r then 1 else 0
    and ev = function
      | Num n -> return n
      | Var x ->
        ev_var envs x
        >>| fun s ->
        (match int_of_string_opt s with
        | None -> 0
        | Some n -> n)
      | Plus (l, r) -> ev_ari ( + ) l r
      | Minus (l, r) -> ev_ari ( - ) l r
      | Mul (l, r) -> ev_ari ( * ) l r
      | Div (l, r) -> ev_ari ~c:(fun _ r -> r != 0) ~e:"Division by 0" ( / ) l r
      | Less (l, r) -> ev_log ( < ) l r
      | Greater (l, r) -> ev_log ( > ) l r
      | LessEq (l, r) -> ev_log ( <= ) l r
      | GreaterEq (l, r) -> ev_log ( >= ) l r
      | Equal (l, r) -> ev_log ( = ) l r
      | NEqual (l, r) -> ev_log ( <> ) l r
    in
    ev
  ;;

  (** Evaluate parameter expansion *)
  let ev_param_exp env =
    let subst size ~all ~beg v p r =
      ev_var env v
      >>| fun s ->
      if s = "" && Base.String.for_all s ~f:(fun c -> c = '*')
      then r (* A hack because Re.replace does nothing on an empty string *)
      else (
        let cond g =
          let c =
            match beg with
            | None -> true (* Anywhere *)
            | Some true -> Re.Group.start g 0 = 0 (* Only at the beginning *)
            | Some false -> Re.Group.stop g 0 = String.length s
            (* Only at the end *)
          in
          if c then r else Re.Group.get g 0
        in
        let re = Re.Glob.glob p |> size |> Re.compile in
        Re.replace ~all:(all || beg = Some false) re ~f:cond s)
      (* ~all has to be true when matching only at the end *)
    in
    function
    | Param v -> ev_var env v
    | PosParam i -> ev_var env (SimpleVar (string_of_int i))
    | Length v -> ev_var env v >>| fun s -> string_of_int (String.length s)
    | Substring (v, pos, len) ->
      ev_var env v
      >>= fun s ->
      let s_len = String.length s in
      let p = if 0 <= pos && pos < s_len then pos else s_len + pos in
      let l =
        match len with
        | Some l -> if l >= 0 then min l (s_len - p) else s_len + l - p
        | None -> s_len - p
      in
      if p >= 0 && l >= 0
      then return (String.sub s p l)
      else if l >= 0
      then return ""
      else fail "substring expression < 0"
    | CutMinBeg (v, p) -> subst Re.shortest ~all:false ~beg:(Some true) v p ""
    | CutMaxBeg (v, p) -> subst Re.longest ~all:false ~beg:(Some true) v p ""
    | CutMinEnd (v, p) -> subst Re.shortest ~all:false ~beg:(Some false) v p ""
    | CutMaxEnd (v, p) -> subst Re.longest ~all:false ~beg:(Some false) v p ""
    | SubstOne (v, p, r) -> subst Re.longest ~all:false ~beg:None v p r
    | SubstAll (v, p, r) -> subst Re.longest ~all:true ~beg:None v p r
    | SubstBeg (v, p, r) -> subst Re.longest ~all:false ~beg:(Some true) v p r
    | SubstEnd (v, p, r) -> subst Re.longest ~all:false ~beg:(Some false) v p r
  ;;

  (** Evaluate Bash script *)
  let ev_script = function
    | _ -> fail "Not implemented"
  ;;
end

(** Interprets the given Bash script AST as a Bash script *)
let interpret script =
  let open Eval (Result) in
  match ev_script script with
  | _ -> "Not implemented"
;;

(* ----------------------------------------------- *)
(* -------------------- Tests -------------------- *)
(* ----------------------------------------------- *)

open Eval (Result)

(* -------------------- Helper functions -------------------- *)

let empty_env = { vars = SMap.empty; funs = SMap.empty; retcode = 0 }

let succ_ev ?(env = empty_env) pp fmt ev ast exp =
  match ev env ast with
  | Error e ->
    Printf.printf "Error: %s\n" e;
    false
  | Ok res when exp = res -> true
  | Ok res ->
    print_string "\n-------------------- Input --------------------\n";
    pp Format.std_formatter ast;
    Format.pp_print_flush Format.std_formatter ();
    print_string "\n----------------- Environment --------------------\n";
    pp_environment Format.std_formatter env;
    Format.pp_print_flush Format.std_formatter ();
    print_string "\n------------------- Expected ------------------\n";
    print_string (fmt exp);
    print_string "\n-------------------- Actual -------------------\n";
    print_string (fmt res);
    print_string "\n-----------------------------------------------\n";
    flush stdout;
    false
;;

let fail_ev ?(env = empty_env) pp fmt ev ast exp =
  match ev env ast with
  | Error e when exp = e -> true
  | Error e ->
    print_string "\n-------------------- Input --------------------\n";
    pp Format.std_formatter ast;
    Format.pp_print_flush Format.std_formatter ();
    print_string "\n----------------- Environment --------------------\n";
    pp_environment Format.std_formatter env;
    Format.pp_print_flush Format.std_formatter ();
    print_string "\n--------------- Unexpected error ------------------\n";
    print_string e;
    print_string "\n-----------------------------------------------\n";
    flush stdout;
    false
  | Ok res ->
    print_string "\n-------------------- Input --------------------\n";
    pp Format.std_formatter ast;
    Format.pp_print_flush Format.std_formatter ();
    print_string "\n----------------- Environment --------------------\n";
    pp_environment Format.std_formatter env;
    Format.pp_print_flush Format.std_formatter ();
    print_string "\n-------------------- Actual -------------------\n";
    print_string (fmt res);
    print_string "\n-----------------------------------------------\n";
    flush stdout;
    false
;;

(* -------------------- Variable -------------------- *)

let succ_ev_var ?(env = empty_env) = succ_ev ~env pp_var Fun.id ev_var
let fail_ev_var ?(env = empty_env) = fail_ev ~env pp_var Fun.id ev_var

let%test _ = succ_ev_var (SimpleVar "ABC") ""
let%test _ = succ_ev_var (Subscript ("ABC", "0")) ""

let%test _ =
  succ_ev_var
    ~env:{ vars = SMap.singleton "ABC" (Val "2"); funs = SMap.empty; retcode = 0 }
    (SimpleVar "ABC")
    "2"
;;

let%test _ =
  succ_ev_var
    ~env:
      { vars =
          SMap.singleton
            "ABC"
            (IndArray (IMap.of_seq (List.to_seq [ 0, "a"; 1, "b"; 2, "c" ])))
      ; funs = SMap.empty
      ; retcode = 0
      }
    (SimpleVar "ABC")
    "a"
;;

let%test _ =
  succ_ev_var
    ~env:
      { vars =
          SMap.singleton
            "ABC"
            (IndArray (IMap.of_seq (List.to_seq [ 0, "a"; 1, "b"; 2, "c" ])))
      ; funs = SMap.empty
      ; retcode = 0
      }
    (Subscript ("ABC", "1"))
    "b"
;;

let%test _ =
  succ_ev_var
    ~env:
      { vars =
          SMap.singleton
            "ABC"
            (IndArray (IMap.of_seq (List.to_seq [ 0, "a"; 1, "b"; 2, "c" ])))
      ; funs = SMap.empty
      ; retcode = 0
      }
    (Subscript ("ABC", "3"))
    ""
;;

let%test _ =
  succ_ev_var
    ~env:
      { vars =
          SMap.singleton
            "ABC"
            (AssocArray (SMap.of_seq (List.to_seq [ "a", "a1"; "b", "b1"; "0", "01" ])))
      ; funs = SMap.empty
      ; retcode = 0
      }
    (SimpleVar "ABC")
    "01"
;;

let%test _ =
  succ_ev_var
    ~env:
      { vars =
          SMap.singleton
            "ABC"
            (AssocArray (SMap.of_seq (List.to_seq [ "a", "a1"; "b", "b1"; "0", "01" ])))
      ; funs = SMap.empty
      ; retcode = 0
      }
    (Subscript ("ABC", "b"))
    "b1"
;;

let%test _ =
  succ_ev_var
    ~env:
      { vars =
          SMap.singleton
            "ABC"
            (AssocArray (SMap.of_seq (List.to_seq [ "a", "a1"; "b", "b1"; "0", "01" ])))
      ; funs = SMap.empty
      ; retcode = 0
      }
    (Subscript ("ABC", "!"))
    ""
;;

(* -------------------- Arithmetic -------------------- *)

let succ_ev_arithm ?(env = empty_env) = succ_ev ~env pp_arithm string_of_int ev_arithm
let fail_ev_arithm ?(env = empty_env) = fail_ev ~env pp_arithm string_of_int ev_arithm

let%test _ = succ_ev_arithm (Plus (Num 1, Num 2)) 3
let%test _ = succ_ev_arithm (Div (Num 1, Num 3)) 0
let%test _ = succ_ev_arithm (Div (Num 2, Num 3)) 0
let%test _ = succ_ev_arithm (Div (NEqual (Num 1, Num 2), Greater (Num 3, Num 1))) 1
let%test _ = fail_ev_arithm (Div (Num 1, Num 0)) "Division by 0"

(* -------------------- Parameter expansion-------------------- *)

let succ_ev_param_exp ?(env = empty_env) = succ_ev ~env pp_param_exp Fun.id ev_param_exp
let fail_ev_param_exp ?(env = empty_env) = fail_ev ~env pp_param_exp Fun.id ev_param_exp

let%test _ =
  succ_ev_param_exp
    ~env:{ vars = SMap.singleton "ABC" (Val "abc"); funs = SMap.empty; retcode = 0 }
    (Param (SimpleVar "ABC"))
    "abc"
;;

let%test _ =
  succ_ev_param_exp
    ~env:{ vars = SMap.singleton "3" (Val "123"); funs = SMap.empty; retcode = 0 }
    (PosParam 3)
    "123"
;;

let%test _ =
  succ_ev_param_exp
    ~env:{ vars = SMap.singleton "ABC" (Val "12345"); funs = SMap.empty; retcode = 0 }
    (Length (SimpleVar "ABC"))
    "5"
;;

let%test _ =
  succ_ev_param_exp
    ~env:{ vars = SMap.singleton "ABC" (Val ""); funs = SMap.empty; retcode = 0 }
    (Length (SimpleVar "ABC"))
    "0"
;;

let%test _ =
  succ_ev_param_exp
    ~env:{ vars = SMap.singleton "ABC" (Val "01234"); funs = SMap.empty; retcode = 0 }
    (Substring (SimpleVar "ABC", 0, Some 3))
    "012"
;;

let%test _ =
  succ_ev_param_exp
    ~env:{ vars = SMap.singleton "ABC" (Val "01234"); funs = SMap.empty; retcode = 0 }
    (Substring (SimpleVar "ABC", 0, Some 5))
    "01234"
;;

let%test _ =
  succ_ev_param_exp
    ~env:{ vars = SMap.singleton "ABC" (Val "01234"); funs = SMap.empty; retcode = 0 }
    (Substring (SimpleVar "ABC", 0, Some 7))
    "01234"
;;

let%test _ =
  succ_ev_param_exp
    ~env:{ vars = SMap.singleton "ABC" (Val "01234"); funs = SMap.empty; retcode = 0 }
    (Substring (SimpleVar "ABC", 2, Some 2))
    "23"
;;

let%test _ =
  succ_ev_param_exp
    ~env:{ vars = SMap.singleton "ABC" (Val "01234"); funs = SMap.empty; retcode = 0 }
    (Substring (SimpleVar "ABC", 2, Some 0))
    ""
;;

let%test _ =
  succ_ev_param_exp
    ~env:{ vars = SMap.singleton "ABC" (Val "01234"); funs = SMap.empty; retcode = 0 }
    (Substring (SimpleVar "ABC", 2, None))
    "234"
;;

let%test _ =
  succ_ev_param_exp
    ~env:{ vars = SMap.singleton "ABC" (Val "01234"); funs = SMap.empty; retcode = 0 }
    (Substring (SimpleVar "ABC", -3, Some 2))
    "23"
;;

let%test _ =
  succ_ev_param_exp
    ~env:{ vars = SMap.singleton "ABC" (Val "01234"); funs = SMap.empty; retcode = 0 }
    (Substring (SimpleVar "ABC", -1, Some 2))
    "4"
;;

let%test _ =
  succ_ev_param_exp
    ~env:{ vars = SMap.singleton "ABC" (Val "01234"); funs = SMap.empty; retcode = 0 }
    (Substring (SimpleVar "ABC", -6, Some 3))
    ""
;;

let%test _ =
  succ_ev_param_exp
    ~env:{ vars = SMap.singleton "ABC" (Val "01234"); funs = SMap.empty; retcode = 0 }
    (Substring (SimpleVar "ABC", -3, Some (-2)))
    "2"
;;

let%test _ =
  succ_ev_param_exp
    ~env:{ vars = SMap.singleton "ABC" (Val "01234"); funs = SMap.empty; retcode = 0 }
    (Substring (SimpleVar "ABC", -3, Some (-3)))
    ""
;;

let%test _ =
  succ_ev_param_exp
    ~env:{ vars = SMap.singleton "ABC" (Val "01234"); funs = SMap.empty; retcode = 0 }
    (Substring (SimpleVar "ABC", 0, Some (-5)))
    ""
;;

let%test _ =
  fail_ev_param_exp
    ~env:{ vars = SMap.singleton "ABC" (Val "01234"); funs = SMap.empty; retcode = 0 }
    (Substring (SimpleVar "ABC", 4, Some (-3)))
    "substring expression < 0"
;;

let%test _ =
  fail_ev_param_exp
    ~env:{ vars = SMap.singleton "ABC" (Val "01234"); funs = SMap.empty; retcode = 0 }
    (Substring (SimpleVar "ABC", 0, Some (-6)))
    "substring expression < 0"
;;

let%test _ =
  succ_ev_param_exp
    ~env:{ vars = SMap.singleton "ABC" (Val "01234"); funs = SMap.empty; retcode = 0 }
    (CutMinBeg (SimpleVar "ABC", "*"))
    "01234"
;;

let%test _ =
  succ_ev_param_exp
    ~env:{ vars = SMap.singleton "ABC" (Val "01234"); funs = SMap.empty; retcode = 0 }
    (CutMinBeg (SimpleVar "ABC", "?"))
    "1234"
;;

let%test _ =
  succ_ev_param_exp
    ~env:{ vars = SMap.singleton "ABC" (Val "01234"); funs = SMap.empty; retcode = 0 }
    (CutMinBeg (SimpleVar "ABC", "[0-9][0-9]"))
    "234"
;;

let%test _ =
  succ_ev_param_exp
    ~env:{ vars = SMap.singleton "ABC" (Val "01234"); funs = SMap.empty; retcode = 0 }
    (CutMinBeg (SimpleVar "ABC", "23"))
    "01234"
;;

let%test _ =
  succ_ev_param_exp
    ~env:{ vars = SMap.singleton "ABC" (Val "01234"); funs = SMap.empty; retcode = 0 }
    (CutMinBeg (SimpleVar "ABC", "01"))
    "234"
;;

let%test _ =
  succ_ev_param_exp
    ~env:{ vars = SMap.singleton "ABC" (Val "01234"); funs = SMap.empty; retcode = 0 }
    (CutMaxBeg (SimpleVar "ABC", "*"))
    ""
;;

let%test _ =
  succ_ev_param_exp
    ~env:{ vars = SMap.singleton "ABC" (Val "01234"); funs = SMap.empty; retcode = 0 }
    (CutMinEnd (SimpleVar "ABC", "?"))
    "0123"
;;

let%test _ =
  succ_ev_param_exp
    ~env:{ vars = SMap.singleton "ABC" (Val "01234"); funs = SMap.empty; retcode = 0 }
    (CutMinEnd (SimpleVar "ABC", "*"))
    "01234"
;;

let%test _ =
  succ_ev_param_exp
    ~env:{ vars = SMap.singleton "ABC" (Val "01234"); funs = SMap.empty; retcode = 0 }
    (CutMaxEnd (SimpleVar "ABC", "?"))
    "0123"
;;

let%test _ =
  succ_ev_param_exp
    ~env:{ vars = SMap.singleton "ABC" (Val "01234"); funs = SMap.empty; retcode = 0 }
    (CutMaxEnd (SimpleVar "ABC", "*"))
    ""
;;

let%test _ =
  succ_ev_param_exp
    ~env:{ vars = SMap.singleton "ABC" (Val "01234"); funs = SMap.empty; retcode = 0 }
    (SubstOne (SimpleVar "ABC", "?", "a"))
    "a1234"
;;

let%test _ =
  succ_ev_param_exp
    ~env:{ vars = SMap.singleton "ABC" (Val "01234"); funs = SMap.empty; retcode = 0 }
    (SubstOne (SimpleVar "ABC", "*", "a"))
    "a"
;;

let%test _ =
  succ_ev_param_exp
    ~env:{ vars = SMap.singleton "ABC" (Val ""); funs = SMap.empty; retcode = 0 }
    (SubstOne (SimpleVar "ABC", "*", "a"))
    "a"
;;

let%test _ =
  succ_ev_param_exp
    ~env:{ vars = SMap.singleton "ABC" (Val "01234"); funs = SMap.empty; retcode = 0 }
    (SubstAll (SimpleVar "ABC", "?", "a"))
    "aaaaa"
;;

let%test _ =
  succ_ev_param_exp
    ~env:{ vars = SMap.singleton "ABC" (Val "01234"); funs = SMap.empty; retcode = 0 }
    (SubstAll (SimpleVar "ABC", "*", "a"))
    "a"
;;

let%test _ =
  succ_ev_param_exp
    ~env:{ vars = SMap.singleton "ABC" (Val "abacab"); funs = SMap.empty; retcode = 0 }
    (SubstAll (SimpleVar "ABC", "a", "heh"))
    "hehbhehchehb"
;;

let%test _ =
  succ_ev_param_exp
    ~env:{ vars = SMap.singleton "ABC" (Val "01234"); funs = SMap.empty; retcode = 0 }
    (SubstBeg (SimpleVar "ABC", "*", "a"))
    "a"
;;

let%test _ =
  succ_ev_param_exp
    ~env:{ vars = SMap.singleton "ABC" (Val "abcabab"); funs = SMap.empty; retcode = 0 }
    (SubstBeg (SimpleVar "ABC", "ab", "!"))
    "!cabab"
;;

let%test _ =
  succ_ev_param_exp
    ~env:{ vars = SMap.singleton "ABC" (Val "01234"); funs = SMap.empty; retcode = 0 }
    (SubstEnd (SimpleVar "ABC", "*", "a"))
    "a"
;;

let%test _ =
  succ_ev_param_exp
    ~env:{ vars = SMap.singleton "ABC" (Val "abcabab"); funs = SMap.empty; retcode = 0 }
    (SubstEnd (SimpleVar "ABC", "ab", "!"))
    "abcab!"
;;
