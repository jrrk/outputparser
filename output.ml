(**************************************************************************)
(*                                                                        *)
(* OCaml template Copyright (C) 2004-2010                                 *)
(*  Sylvain Conchon, Jean-Christophe Filliatre and Julien Signoles        *)
(* Adapted to boolean logic by Jonathan Kimmitt                           *)
(*  Copyright 2016 University of Cambridge                                *)
(*                                                                        *)
(*  This software is free software; you can redistribute it and/or        *)
(*  modify it under the terms of the GNU Library General Public           *)
(*  License version 2.1, with the special exception on linking            *)
(*  described in file LICENSE.                                            *)
(*                                                                        *)
(*  This software is distributed in the hope that it will be useful,      *)
(*  but WITHOUT ANY WARRANTY; without even the implied warranty of        *)
(*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.                  *)
(*                                                                        *)
(**************************************************************************)

open Output_types
open Output_parser

let parse_output_ast_from_chan ch =
  let lb = Lexing.from_channel ch in
  let output = try
      Output_parser.start Output_lexer.token lb
  with
    | Parsing.Parse_error ->
      let n = Lexing.lexeme_start lb in
      failwith (Printf.sprintf "Output.parse: parse error at character %d" n);
(*
    | _ ->
      failwith (Printf.sprintf "Parser error at line %d" !Scope.lincnt)
*)
  in
  output

let rec uniq = function
| [] -> []
| hd :: [] -> hd :: []
| hd :: scnd :: tl -> hd :: uniq (if hd == scnd then tl else scnd :: tl)

let parse arg =
  let ch = open_in arg in
  let (u,g,t,n,s) = parse_output_ast_from_chan ch in
  close_in ch;
  Template.template (uniq t) (uniq g)

let _ = if Array.length Sys.argv > 1 then parse Sys.argv.(1)
