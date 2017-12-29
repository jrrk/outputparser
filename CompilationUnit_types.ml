  open CompilationUnit
let getstr = function
| ABSTRACT  -> "ABSTRACT"
| ACCEPT  -> "ACCEPT"
| AMPERSAND  -> "AMPERSAND"
| AT  -> "AT"
| BACKQUOTE  -> "BACKQUOTE"
| BACKSLASH  -> "BACKSLASH"
| CARET  -> "CARET"
| CASE  -> "CASE"
| CATCH  -> "CATCH"
| CHARACTERLITERAL  _ -> "CHARACTERLITERAL"
| CLASS  -> "CLASS"
| COLON  -> "COLON"
| COMMA  -> "COMMA"
| CONS1  _ -> "CONS1"
| CONS2  _ -> "CONS2"
| CONS3  _ -> "CONS3"
| CONS4  _ -> "CONS4"
| DEF  -> "DEF"
| DEFAULT  -> "DEFAULT"
| DO  -> "DO"
| DOLLAR  -> "DOLLAR"
| DOT  -> "DOT"
| DOUBLEQUOTE  -> "DOUBLEQUOTE"
| ELSE  -> "ELSE"
| EMPTY_TOKEN  -> "EMPTY_TOKEN"
| END  -> "END"
| EOF_TOKEN  -> "EOF_TOKEN"
| EQGT  -> "EQGT"
| EQUALS  -> "EQUALS"
| ERROR  -> "ERROR"
| ERROR_TOKEN  -> "ERROR_TOKEN"
| EXTENDS  -> "EXTENDS"
| FALSE  -> "FALSE"
| FINAL  -> "FINAL"
| FINALLY  -> "FINALLY"
| FLOATINGPOINTLITERAL  _ -> "FLOATINGPOINTLITERAL"
| FOR  -> "FOR"
| FOR_SOME  -> "FOR_SOME"
| GREATER  -> "GREATER"
| HASH  -> "HASH"
| HYPHEN  -> "HYPHEN"
| IF  -> "IF"
| IMPLICIT  -> "IMPLICIT"
| IMPORT  -> "IMPORT"
| INTEGERLITERAL  _ -> "INTEGERLITERAL"
| LAZY  -> "LAZY"
| LBRACE  -> "LBRACE"
| LBRACK  -> "LBRACK"
| LESS  -> "LESS"
| LINEFEED  -> "LINEFEED"
| LPAREN  -> "LPAREN"
| MATCH  -> "MATCH"
| NEW  -> "NEW"
| NEWLINE  -> "NEWLINE"
| NULL  -> "NULL"
| OBJECT  -> "OBJECT"
| OVERRIDE  -> "OVERRIDE"
| PACKAGE  -> "PACKAGE"
| PERCENT  -> "PERCENT"
| PLAINID  _ -> "PLAINID"
| PLING  -> "PLING"
| PLUS  -> "PLUS"
| PRIVATE  -> "PRIVATE"
| PROTECTED  -> "PROTECTED"
| QUERY  -> "QUERY"
| QUOTE  -> "QUOTE"
| RBRACE  -> "RBRACE"
| RBRACK  -> "RBRACK"
| RETURN  -> "RETURN"
| RPAREN  -> "RPAREN"
| SEALED  -> "SEALED"
| SEMICOLON  -> "SEMICOLON"
| SLASH  -> "SLASH"
| SLIST  _ -> "SLIST"
| STAR  -> "STAR"
| STRINGLITERAL  _ -> "STRINGLITERAL"
| SUPER  -> "SUPER"
| THIS  -> "THIS"
| THROW  -> "THROW"
| TILDE  -> "TILDE"
| TLIST  _ -> "TLIST"
| TRAIT  -> "TRAIT"
| TRUE  -> "TRUE"
| TRY  -> "TRY"
| TUPLE2  _ -> "TUPLE2"
| TUPLE3  _ -> "TUPLE3"
| TUPLE4  _ -> "TUPLE4"
| TUPLE5  _ -> "TUPLE5"
| TUPLE6  _ -> "TUPLE6"
| TUPLE7  _ -> "TUPLE7"
| TYPE  -> "TYPE"
| UNDERSCORE  -> "UNDERSCORE"
| VAL  -> "VAL"
| VAR  -> "VAR"
| VARID  -> "VARID"
| VBAR  -> "VBAR"
| WHILE  -> "WHILE"
| WITH  -> "WITH"
| YIELD  -> "YIELD"

let (typehash:(string,unit)Hashtbl.t) = Hashtbl.create 257