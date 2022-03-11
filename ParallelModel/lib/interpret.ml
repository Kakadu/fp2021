(** Real monadic interpreter goes here *)

open Base
open Ast
(* open Utils

   module Interpret (M : MONAD_FAIL) : sig
     val run : _ Ast.t -> (int, Utils.error) M.t
   end = struct
     let run _ =
       (* implement interpreter here *)
       if true then M.fail (UnknownVariable "var") else failwith "not implemented"
     ;;
   end

   let parse_and_run str =
     let ans =
       let module I = Interpret (Result) in
       match Parser.parse str with
       | Caml.Result.Ok ast -> I.run ast
       | Caml.Result.Error _ ->
         Caml.Format.eprintf "Parsing error\n%!";
         Caml.exit 1
     in
     ans
   ;; *)

module type MONAD = sig
  type 'a t

  val return : 'a -> 'a t

  val ( >>= ) : 'a t -> ('a -> 'b t) -> 'b t

  val ( >> ) : 'a t -> 'b t -> 'b t
end

module type MONADERROR = sig
  include MONAD

  val error : string -> 'a t
end

module Result = struct
  type 'a t = ('a, string) Result.t

  let ( >>= ) = Result.bind

  let return = Result.ok

  let error = Result.error

  let ( >> ) x f = x >>= fun _ -> f
end

type key_t = string [@@deriving show]

type constructor_r = { key : key_t; args : (int * string) list; body : stmt }
