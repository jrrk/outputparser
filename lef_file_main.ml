
open Lef_file_edited
open Lef_file_lex

let parse_output_ast_from_chan ch =
  let lb = Lexing.from_channel ch in
  let output = try
      lef_file token lb
  with
    | Parsing.Parse_error ->
      let n = Lexing.lexeme_start lb in
      failwith (Printf.sprintf "Output.parse: parse error at character %d" n);
  in
  output

let parse arg =
  let ch = open_in arg in
  let rslt = parse_output_ast_from_chan ch in
  close_in ch;
  rslt

let _ = if Array.length Sys.argv > 1 then parse Sys.argv.(1) else parse "complete.5.8.lef"
