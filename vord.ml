open String
open Source_text_edited
let getstr = function

| ACCEPT -> uppercase("ACCEPT") 
| ALWAYS_UNDERSCORE_COMB -> uppercase("ALWAYS_UNDERSCORE_COMB") 
| ALWAYS_UNDERSCORE_FF -> uppercase("ALWAYS_UNDERSCORE_FF") 
| ALWAYS_UNDERSCORE_LATCH -> uppercase("ALWAYS_UNDERSCORE_LATCH") 
| ALWAYS -> uppercase("ALWAYS") 
| AMPERSAND -> uppercase("AMPERSAND") 
| AND -> uppercase("AND") 
| ASSERT -> uppercase("ASSERT") 
| ASSIGN -> uppercase("ASSIGN") 
| ASSUME -> uppercase("ASSUME") 
| AT -> uppercase("AT") 
| AUTOMATIC -> uppercase("AUTOMATIC") 
| BACKQUOTE -> uppercase("BACKQUOTE") 
| BACKSLASH -> uppercase("BACKSLASH") 
| BEGIN -> uppercase("BEGIN") 
| BIND -> uppercase("BIND") 
| BIT -> uppercase("BIT") 
| BREAK -> uppercase("BREAK") 
| BUFIF0 -> uppercase("BUFIF0") 
| BUFIF1 -> uppercase("BUFIF1") 
| BUF -> uppercase("BUF") 
| BYTE -> uppercase("BYTE") 
| CARET -> uppercase("CARET") 
| CASE -> uppercase("CASE") 
| CASEX -> uppercase("CASEX") 
| CASEZ -> uppercase("CASEZ") 
| CHANDLE -> uppercase("CHANDLE") 
| CLOCKING -> uppercase("CLOCKING") 
| CMOS -> uppercase("CMOS") 
| COLON -> uppercase("COLON") 
| COMMA -> uppercase("COMMA") 
| CONS1 _-> uppercase("CONS1") 
| CONS2 _-> uppercase("CONS2") 
| CONS3 _-> uppercase("CONS3") 
| CONS4 _-> uppercase("CONS4") 
| CONST_HYPHEN_IN_HYPHEN_LEX -> uppercase("CONST_HYPHEN_IN_HYPHEN_LEX") 
| CONST_HYPHEN_THEN_HYPHEN_REF -> uppercase("CONST_HYPHEN_THEN_HYPHEN_REF") 
| CONST -> uppercase("CONST") 
| CONTEXT -> uppercase("CONTEXT") 
| CONTINUE -> uppercase("CONTINUE") 
| COVERAGE_UNDERSCORE_OFF -> uppercase("COVERAGE_UNDERSCORE_OFF") 
| COVERAGE_UNDERSCORE_ON -> uppercase("COVERAGE_UNDERSCORE_ON") 
| COVER -> uppercase("COVER") 
| DEASSIGN -> uppercase("DEASSIGN") 
| DEFAULT -> uppercase("DEFAULT") 
| DEFPARAM -> uppercase("DEFPARAM") 
| DISABLE -> uppercase("DISABLE") 
| DOLLAR_END -> uppercase("DOLLAR_END") 
| DOLLAR -> uppercase("DOLLAR") 
| DOT -> uppercase("DOT") 
| DOUBLEQUOTE -> uppercase("DOUBLEQUOTE") 
| DO -> uppercase("DO") 
| EDGE -> uppercase("EDGE") 
| ELSE -> uppercase("ELSE") 
| EMPTY_TOKEN -> uppercase("EMPTY_TOKEN") 
| ENDCASE -> uppercase("ENDCASE") 
| ENDCLOCKING -> uppercase("ENDCLOCKING") 
| ENDFUNCTION -> uppercase("ENDFUNCTION") 
| ENDGENERATE -> uppercase("ENDGENERATE") 
| ENDINTERFACE -> uppercase("ENDINTERFACE") 
| ENDMODULE -> uppercase("ENDMODULE") 
| ENDPACKAGE -> uppercase("ENDPACKAGE") 
| ENDPRIMITIVE -> uppercase("ENDPRIMITIVE") 
| ENDPROGRAM -> uppercase("ENDPROGRAM") 
| ENDPROPERTY -> uppercase("ENDPROPERTY") 
| ENDSPECIFY -> uppercase("ENDSPECIFY") 
| ENDTABLE -> uppercase("ENDTABLE") 
| ENDTASK -> uppercase("ENDTASK") 
| END -> uppercase("END") 
| ENUM -> uppercase("ENUM") 
| EOF_TOKEN -> uppercase("EOF_TOKEN") 
| EQUALS -> uppercase("EQUALS") 
| ERROR_TOKEN -> uppercase("ERROR_TOKEN") 
| ERROR -> uppercase("ERROR") 
| EXPORT -> uppercase("EXPORT") 
| EXTERN -> uppercase("EXTERN") 
| FINAL -> uppercase("FINAL") 
| FLOATING_HYPHEN_POINT_BLANK_NUMBER -> uppercase("FLOATING_HYPHEN_POINT_BLANK_NUMBER") 
| FOREACH -> uppercase("FOREACH") 
| FOREVER -> uppercase("FOREVER") 
| FORKJOIN -> uppercase("FORKJOIN") 
| FOR -> uppercase("FOR") 
| FUNCTION -> uppercase("FUNCTION") 
| GENERATE -> uppercase("GENERATE") 
| GENVAR -> uppercase("GENVAR") 
| GLOBAL_HYPHEN_IN_HYPHEN_LEX -> uppercase("GLOBAL_HYPHEN_IN_HYPHEN_LEX") 
| GLOBAL_HYPHEN_THEN_HYPHEN_CLOCKING -> uppercase("GLOBAL_HYPHEN_THEN_HYPHEN_CLOCKING") 
| GREATER -> uppercase("GREATER") 
| HASH -> uppercase("HASH") 
| HYPHEN -> uppercase("HYPHEN") 
| IDENTIFIER_HYPHEN_IN_HYPHEN_LEX -> uppercase("IDENTIFIER_HYPHEN_IN_HYPHEN_LEX") 
| IDENTIFIER _-> uppercase("IDENTIFIER") 
| IFF -> uppercase("IFF") 
| IF -> uppercase("IF") 
| IMPORT -> uppercase("IMPORT") 
| INITIAL -> uppercase("INITIAL") 
| INOUT -> uppercase("INOUT") 
| INPUT -> uppercase("INPUT") 
| INSIDE -> uppercase("INSIDE") 
| INTEGER_BLANK_NUMBER -> uppercase("INTEGER_BLANK_NUMBER") 
| INTEGER -> uppercase("INTEGER") 
| INTERFACE -> uppercase("INTERFACE") 
| INT -> uppercase("INT") 
| LBRACE -> uppercase("LBRACE") 
| LBRACK -> uppercase("LBRACK") 
| LESS -> uppercase("LESS") 
| LINEFEED -> uppercase("LINEFEED") 
| LINT_UNDERSCORE_OFF -> uppercase("LINT_UNDERSCORE_OFF") 
| LINT_UNDERSCORE_ON -> uppercase("LINT_UNDERSCORE_ON") 
| LOCALPARAM -> uppercase("LOCALPARAM") 
| LOGIC -> uppercase("LOGIC") 
| LONGINT -> uppercase("LONGINT") 
| LPAREN -> uppercase("LPAREN") 
| MODPORT -> uppercase("MODPORT") 
| MODULE -> uppercase("MODULE") 
| NAND -> uppercase("NAND") 
| NEGEDGE -> uppercase("NEGEDGE") 
| NMOS -> uppercase("NMOS") 
| NOR -> uppercase("NOR") 
| NOTIF0 -> uppercase("NOTIF0") 
| NOTIF1 -> uppercase("NOTIF1") 
| NOT -> uppercase("NOT") 
| OR -> uppercase("OR") 
| OUTPUT -> uppercase("OUTPUT") 
| PACKAGE_HYPHEN_IDENTIFIER -> uppercase("PACKAGE_HYPHEN_IDENTIFIER") 
| PACKAGE -> uppercase("PACKAGE") 
| PACKED -> uppercase("PACKED") 
| PARAMETER -> uppercase("PARAMETER") 
| PERCENT -> uppercase("PERCENT") 
| PLING -> uppercase("PLING") 
| PLUS -> uppercase("PLUS") 
| PMOS -> uppercase("PMOS") 
| POSEDGE -> uppercase("POSEDGE") 
| PRIMITIVE -> uppercase("PRIMITIVE") 
| PRIORITY -> uppercase("PRIORITY") 
| PRLOWER_THAN_ELSE -> uppercase("PRLOWER_THAN_ELSE") 
| PRNEGATION -> uppercase("PRNEGATION") 
| PROGRAM -> uppercase("PROGRAM") 
| PROPERTY -> uppercase("PROPERTY") 
| PRREDUCTION -> uppercase("PRREDUCTION") 
| PRUNARYARITH -> uppercase("PRUNARYARITH") 
| PULLDOWN -> uppercase("PULLDOWN") 
| PULLUP -> uppercase("PULLUP") 
| PURE -> uppercase("PURE") 
| Q_AMPERSAND__AMPERSAND__AMPERSAND_ -> uppercase("Q_AMPERSAND__AMPERSAND__AMPERSAND_") 
| Q_AMPERSAND__AMPERSAND_ -> uppercase("Q_AMPERSAND__AMPERSAND_") 
| Q_AMPERSAND__EQUALS_ -> uppercase("Q_AMPERSAND__EQUALS_") 
| Q_AT__AT_ -> uppercase("Q_AT__AT_") 
| Q_BACKQUOTE_SYSTEMC_UNDERSCORE_CTOR_BLANK_BLOCK -> uppercase("Q_BACKQUOTE_SYSTEMC_UNDERSCORE_CTOR_BLANK_BLOCK") 
| Q_BACKQUOTE_SYSTEMC_UNDERSCORE_DTOR_BLANK_BLOCK -> uppercase("Q_BACKQUOTE_SYSTEMC_UNDERSCORE_DTOR_BLANK_BLOCK") 
| Q_BACKQUOTE_SYSTEMC_UNDERSCORE_HEADER_BLANK_BLOCK -> uppercase("Q_BACKQUOTE_SYSTEMC_UNDERSCORE_HEADER_BLANK_BLOCK") 
| Q_BACKQUOTE_SYSTEMC_UNDERSCORE_IMPLEMENTATION_BLANK_BLOCK -> uppercase("Q_BACKQUOTE_SYSTEMC_UNDERSCORE_IMPLEMENTATION_BLANK_BLOCK") 
| Q_BACKQUOTE_SYSTEMC_UNDERSCORE_IMP_UNDERSCORE_HEADER_BLANK_BLOCK -> uppercase("Q_BACKQUOTE_SYSTEMC_UNDERSCORE_IMP_UNDERSCORE_HEADER_BLANK_BLOCK") 
| Q_BACKQUOTE_SYSTEMC_UNDERSCORE_INTERFACE_BLANK_BLOCK -> uppercase("Q_BACKQUOTE_SYSTEMC_UNDERSCORE_INTERFACE_BLANK_BLOCK") 
| Q_CARET__EQUALS_ -> uppercase("Q_CARET__EQUALS_") 
| Q_CARET__TILDE_ -> uppercase("Q_CARET__TILDE_") 
| Q_COLON__COLON_ -> uppercase("Q_COLON__COLON_") 
| Q_COLON__EQUALS_ -> uppercase("Q_COLON__EQUALS_") 
| Q_COLON__SLASH_ -> uppercase("Q_COLON__SLASH_") 
| Q_DOLLAR_ACOSH -> uppercase("Q_DOLLAR_ACOSH") 
| Q_DOLLAR_ACOS -> uppercase("Q_DOLLAR_ACOS") 
| Q_DOLLAR_ASINH -> uppercase("Q_DOLLAR_ASINH") 
| Q_DOLLAR_ASIN -> uppercase("Q_DOLLAR_ASIN") 
| Q_DOLLAR_ATAN2 -> uppercase("Q_DOLLAR_ATAN2") 
| Q_DOLLAR_ATANH -> uppercase("Q_DOLLAR_ATANH") 
| Q_DOLLAR_ATAN -> uppercase("Q_DOLLAR_ATAN") 
| Q_DOLLAR_BITSTOREAL -> uppercase("Q_DOLLAR_BITSTOREAL") 
| Q_DOLLAR_BITS -> uppercase("Q_DOLLAR_BITS") 
| Q_DOLLAR_CEIL -> uppercase("Q_DOLLAR_CEIL") 
| Q_DOLLAR_CLOG2 -> uppercase("Q_DOLLAR_CLOG2") 
| Q_DOLLAR_COSH -> uppercase("Q_DOLLAR_COSH") 
| Q_DOLLAR_COS -> uppercase("Q_DOLLAR_COS") 
| Q_DOLLAR_COUNTONES -> uppercase("Q_DOLLAR_COUNTONES") 
| Q_DOLLAR_C -> uppercase("Q_DOLLAR_C") 
| Q_DOLLAR_DIMENSIONS -> uppercase("Q_DOLLAR_DIMENSIONS") 
| Q_DOLLAR_DISPLAY -> uppercase("Q_DOLLAR_DISPLAY") 
| Q_DOLLAR_ERROR -> uppercase("Q_DOLLAR_ERROR") 
| Q_DOLLAR_EXP -> uppercase("Q_DOLLAR_EXP") 
| Q_DOLLAR_FATAL -> uppercase("Q_DOLLAR_FATAL") 
| Q_DOLLAR_FCLOSE -> uppercase("Q_DOLLAR_FCLOSE") 
| Q_DOLLAR_FDISPLAY -> uppercase("Q_DOLLAR_FDISPLAY") 
| Q_DOLLAR_FEOF -> uppercase("Q_DOLLAR_FEOF") 
| Q_DOLLAR_FFLUSH -> uppercase("Q_DOLLAR_FFLUSH") 
| Q_DOLLAR_FGETC -> uppercase("Q_DOLLAR_FGETC") 
| Q_DOLLAR_FGETS -> uppercase("Q_DOLLAR_FGETS") 
| Q_DOLLAR_FINISH -> uppercase("Q_DOLLAR_FINISH") 
| Q_DOLLAR_FLOOR -> uppercase("Q_DOLLAR_FLOOR") 
| Q_DOLLAR_FOPEN -> uppercase("Q_DOLLAR_FOPEN") 
| Q_DOLLAR_FSCANF -> uppercase("Q_DOLLAR_FSCANF") 
| Q_DOLLAR_FWRITE -> uppercase("Q_DOLLAR_FWRITE") 
| Q_DOLLAR_HIGH -> uppercase("Q_DOLLAR_HIGH") 
| Q_DOLLAR_HYPOT -> uppercase("Q_DOLLAR_HYPOT") 
| Q_DOLLAR_INCREMENT -> uppercase("Q_DOLLAR_INCREMENT") 
| Q_DOLLAR_INFO -> uppercase("Q_DOLLAR_INFO") 
| Q_DOLLAR_ISUNKNOWN -> uppercase("Q_DOLLAR_ISUNKNOWN") 
| Q_DOLLAR_ITOR -> uppercase("Q_DOLLAR_ITOR") 
| Q_DOLLAR__LBRACE_DPI_HYPHEN_SYS_RBRACE_ -> uppercase("Q_DOLLAR__LBRACE_DPI_HYPHEN_SYS_RBRACE_") 
| Q_DOLLAR__LBRACE_IGNORED_HYPHEN_BBOX_HYPHEN_SYS_RBRACE_ -> uppercase("Q_DOLLAR__LBRACE_IGNORED_HYPHEN_BBOX_HYPHEN_SYS_RBRACE_") 
| Q_DOLLAR_LEFT -> uppercase("Q_DOLLAR_LEFT") 
| Q_DOLLAR_LN -> uppercase("Q_DOLLAR_LN") 
| Q_DOLLAR_LOG10 -> uppercase("Q_DOLLAR_LOG10") 
| Q_DOLLAR_LOW -> uppercase("Q_DOLLAR_LOW") 
| Q_DOLLAR_ONEHOT0 -> uppercase("Q_DOLLAR_ONEHOT0") 
| Q_DOLLAR_ONEHOT -> uppercase("Q_DOLLAR_ONEHOT") 
| Q_DOLLAR_PAST -> uppercase("Q_DOLLAR_PAST") 
| Q_DOLLAR_POW -> uppercase("Q_DOLLAR_POW") 
| Q_DOLLAR_RANDOM -> uppercase("Q_DOLLAR_RANDOM") 
| Q_DOLLAR_READMEMB -> uppercase("Q_DOLLAR_READMEMB") 
| Q_DOLLAR_READMEMH -> uppercase("Q_DOLLAR_READMEMH") 
| Q_DOLLAR_REALTIME -> uppercase("Q_DOLLAR_REALTIME") 
| Q_DOLLAR_REALTOBITS -> uppercase("Q_DOLLAR_REALTOBITS") 
| Q_DOLLAR_RIGHT -> uppercase("Q_DOLLAR_RIGHT") 
| Q_DOLLAR_RTOI -> uppercase("Q_DOLLAR_RTOI") 
| Q_DOLLAR_SFORMATF -> uppercase("Q_DOLLAR_SFORMATF") 
| Q_DOLLAR_SFORMAT -> uppercase("Q_DOLLAR_SFORMAT") 
| Q_DOLLAR_SIGNED -> uppercase("Q_DOLLAR_SIGNED") 
| Q_DOLLAR_SINH -> uppercase("Q_DOLLAR_SINH") 
| Q_DOLLAR_SIN -> uppercase("Q_DOLLAR_SIN") 
| Q_DOLLAR_SIZE -> uppercase("Q_DOLLAR_SIZE") 
| Q_DOLLAR_SQRT -> uppercase("Q_DOLLAR_SQRT") 
| Q_DOLLAR_SSCANF -> uppercase("Q_DOLLAR_SSCANF") 
| Q_DOLLAR_STIME -> uppercase("Q_DOLLAR_STIME") 
| Q_DOLLAR_STOP -> uppercase("Q_DOLLAR_STOP") 
| Q_DOLLAR_SWRITE -> uppercase("Q_DOLLAR_SWRITE") 
| Q_DOLLAR_SYSTEM -> uppercase("Q_DOLLAR_SYSTEM") 
| Q_DOLLAR_TANH -> uppercase("Q_DOLLAR_TANH") 
| Q_DOLLAR_TAN -> uppercase("Q_DOLLAR_TAN") 
| Q_DOLLAR_TEST_DOLLAR_PLUSARGS -> uppercase("Q_DOLLAR_TEST_DOLLAR_PLUSARGS") 
| Q_DOLLAR_TIME -> uppercase("Q_DOLLAR_TIME") 
| Q_DOLLAR_UNIT -> uppercase("Q_DOLLAR_UNIT") 
| Q_DOLLAR_UNPACKED_UNDERSCORE_DIMENSIONS -> uppercase("Q_DOLLAR_UNPACKED_UNDERSCORE_DIMENSIONS") 
| Q_DOLLAR_UNSIGNED -> uppercase("Q_DOLLAR_UNSIGNED") 
| Q_DOLLAR_VALUE_DOLLAR_PLUSARGS -> uppercase("Q_DOLLAR_VALUE_DOLLAR_PLUSARGS") 
| Q_DOLLAR_WARNING -> uppercase("Q_DOLLAR_WARNING") 
| Q_DOLLAR_WRITEMEMH -> uppercase("Q_DOLLAR_WRITEMEMH") 
| Q_DOLLAR_WRITE -> uppercase("Q_DOLLAR_WRITE") 
| Q_DOT__STAR_ -> uppercase("Q_DOT__STAR_") 
| Q_EQUALS__EQUALS__EQUALS_ -> uppercase("Q_EQUALS__EQUALS__EQUALS_") 
| Q_EQUALS__EQUALS__QUERY_ -> uppercase("Q_EQUALS__EQUALS__QUERY_") 
| Q_EQUALS__EQUALS_ -> uppercase("Q_EQUALS__EQUALS_") 
| Q_EQUALS__GREATER_ -> uppercase("Q_EQUALS__GREATER_") 
| Q_GREATER__EQUALS_ -> uppercase("Q_GREATER__EQUALS_") 
| Q_GREATER__GREATER__EQUALS_ -> uppercase("Q_GREATER__GREATER__EQUALS_") 
| Q_GREATER__GREATER__GREATER__EQUALS_ -> uppercase("Q_GREATER__GREATER__GREATER__EQUALS_") 
| Q_GREATER__GREATER__GREATER_ -> uppercase("Q_GREATER__GREATER__GREATER_") 
| Q_GREATER__GREATER_ -> uppercase("Q_GREATER__GREATER_") 
| Q_HASH__HASH_ -> uppercase("Q_HASH__HASH_") 
| Q_HYPHEN__COLON_ -> uppercase("Q_HYPHEN__COLON_") 
| Q_HYPHEN__EQUALS_ -> uppercase("Q_HYPHEN__EQUALS_") 
| Q_HYPHEN__GREATER__GREATER_ -> uppercase("Q_HYPHEN__GREATER__GREATER_") 
| Q_HYPHEN__GREATER_ -> uppercase("Q_HYPHEN__GREATER_") 
| Q_HYPHEN__HYPHEN_FILE -> uppercase("Q_HYPHEN__HYPHEN_FILE") 
| Q_HYPHEN__HYPHEN_LINES -> uppercase("Q_HYPHEN__HYPHEN_LINES") 
| Q_HYPHEN__HYPHEN_MSG -> uppercase("Q_HYPHEN__HYPHEN_MSG") 
| Q_HYPHEN__HYPHEN_ -> uppercase("Q_HYPHEN__HYPHEN_") 
| Q_LBRACK__EQUALS_ -> uppercase("Q_LBRACK__EQUALS_") 
| Q_LBRACK__HYPHEN__GREATER_ -> uppercase("Q_LBRACK__HYPHEN__GREATER_") 
| Q_LBRACK__STAR_ -> uppercase("Q_LBRACK__STAR_") 
| Q_LESS__EQUALS__HYPHEN_IGNORED -> uppercase("Q_LESS__EQUALS__HYPHEN_IGNORED") 
| Q_LESS__EQUALS_ -> uppercase("Q_LESS__EQUALS_") 
| Q_LESS__LESS__EQUALS_ -> uppercase("Q_LESS__LESS__EQUALS_") 
| Q_LESS__LESS_ -> uppercase("Q_LESS__LESS_") 
| Q_PERCENT__EQUALS_ -> uppercase("Q_PERCENT__EQUALS_") 
| Q_PLING__EQUALS__EQUALS_ -> uppercase("Q_PLING__EQUALS__EQUALS_") 
| Q_PLING__EQUALS__QUERY_ -> uppercase("Q_PLING__EQUALS__QUERY_") 
| Q_PLING__EQUALS_ -> uppercase("Q_PLING__EQUALS_") 
| Q_PLUS__COLON_ -> uppercase("Q_PLUS__COLON_") 
| Q_PLUS__EQUALS_ -> uppercase("Q_PLUS__EQUALS_") 
| Q_PLUS__PLUS_ -> uppercase("Q_PLUS__PLUS_") 
| Q_QUOTE__LBRACE_ -> uppercase("Q_QUOTE__LBRACE_") 
| Q_QUOTE_ -> uppercase("Q_QUOTE_") 
| Q_SLASH__EQUALS_ -> uppercase("Q_SLASH__EQUALS_") 
| Q_SLASH__STAR_VERILATOR_BLANK_CLOCKER_STAR__SLASH_ -> uppercase("Q_SLASH__STAR_VERILATOR_BLANK_CLOCKER_STAR__SLASH_") 
| Q_SLASH__STAR_VERILATOR_BLANK_CLOCK_UNDERSCORE_ENABLE_STAR__SLASH_ -> uppercase("Q_SLASH__STAR_VERILATOR_BLANK_CLOCK_UNDERSCORE_ENABLE_STAR__SLASH_") 
| Q_SLASH__STAR_VERILATOR_BLANK_COVERAGE_UNDERSCORE_BLOCK_UNDERSCORE_OFF_STAR__SLASH_ -> uppercase("Q_SLASH__STAR_VERILATOR_BLANK_COVERAGE_UNDERSCORE_BLOCK_UNDERSCORE_OFF_STAR__SLASH_") 
| Q_SLASH__STAR_VERILATOR_BLANK_FULL_UNDERSCORE_CASE_STAR__SLASH_ -> uppercase("Q_SLASH__STAR_VERILATOR_BLANK_FULL_UNDERSCORE_CASE_STAR__SLASH_") 
| Q_SLASH__STAR_VERILATOR_BLANK_INLINE_UNDERSCORE_MODULE_STAR__SLASH_ -> uppercase("Q_SLASH__STAR_VERILATOR_BLANK_INLINE_UNDERSCORE_MODULE_STAR__SLASH_") 
| Q_SLASH__STAR_VERILATOR_BLANK_ISOLATE_UNDERSCORE_ASSIGNMENTS_STAR__SLASH_ -> uppercase("Q_SLASH__STAR_VERILATOR_BLANK_ISOLATE_UNDERSCORE_ASSIGNMENTS_STAR__SLASH_") 
| Q_SLASH__STAR_VERILATOR_BLANK_NO_UNDERSCORE_CLOCKER_STAR__SLASH_ -> uppercase("Q_SLASH__STAR_VERILATOR_BLANK_NO_UNDERSCORE_CLOCKER_STAR__SLASH_") 
| Q_SLASH__STAR_VERILATOR_BLANK_NO_UNDERSCORE_INLINE_UNDERSCORE_MODULE_STAR__SLASH_ -> uppercase("Q_SLASH__STAR_VERILATOR_BLANK_NO_UNDERSCORE_INLINE_UNDERSCORE_MODULE_STAR__SLASH_") 
| Q_SLASH__STAR_VERILATOR_BLANK_NO_UNDERSCORE_INLINE_UNDERSCORE_TASK_STAR__SLASH_ -> uppercase("Q_SLASH__STAR_VERILATOR_BLANK_NO_UNDERSCORE_INLINE_UNDERSCORE_TASK_STAR__SLASH_") 
| Q_SLASH__STAR_VERILATOR_BLANK_PARALLEL_UNDERSCORE_CASE_STAR__SLASH_ -> uppercase("Q_SLASH__STAR_VERILATOR_BLANK_PARALLEL_UNDERSCORE_CASE_STAR__SLASH_") 
| Q_SLASH__STAR_VERILATOR_BLANK_PUBLIC_STAR__SLASH_ -> uppercase("Q_SLASH__STAR_VERILATOR_BLANK_PUBLIC_STAR__SLASH_") 
| Q_SLASH__STAR_VERILATOR_BLANK_PUBLIC_UNDERSCORE_FLAT_STAR__SLASH_ -> uppercase("Q_SLASH__STAR_VERILATOR_BLANK_PUBLIC_UNDERSCORE_FLAT_STAR__SLASH_") 
| Q_SLASH__STAR_VERILATOR_BLANK_PUBLIC_UNDERSCORE_FLAT_UNDERSCORE_RD_STAR__SLASH_ -> uppercase("Q_SLASH__STAR_VERILATOR_BLANK_PUBLIC_UNDERSCORE_FLAT_UNDERSCORE_RD_STAR__SLASH_") 
| Q_SLASH__STAR_VERILATOR_BLANK_PUBLIC_UNDERSCORE_FLAT_UNDERSCORE_RW_STAR__SLASH_ -> uppercase("Q_SLASH__STAR_VERILATOR_BLANK_PUBLIC_UNDERSCORE_FLAT_UNDERSCORE_RW_STAR__SLASH_") 
| Q_SLASH__STAR_VERILATOR_BLANK_PUBLIC_UNDERSCORE_MODULE_STAR__SLASH_ -> uppercase("Q_SLASH__STAR_VERILATOR_BLANK_PUBLIC_UNDERSCORE_MODULE_STAR__SLASH_") 
| Q_SLASH__STAR_VERILATOR_BLANK_SC_UNDERSCORE_BV_STAR__SLASH_ -> uppercase("Q_SLASH__STAR_VERILATOR_BLANK_SC_UNDERSCORE_BV_STAR__SLASH_") 
| Q_SLASH__STAR_VERILATOR_BLANK_SC_UNDERSCORE_CLOCK_STAR__SLASH_ -> uppercase("Q_SLASH__STAR_VERILATOR_BLANK_SC_UNDERSCORE_CLOCK_STAR__SLASH_") 
| Q_SLASH__STAR_VERILATOR_BLANK_SFORMAT_STAR__SLASH_ -> uppercase("Q_SLASH__STAR_VERILATOR_BLANK_SFORMAT_STAR__SLASH_") 
| Q_STAR__EQUALS_ -> uppercase("Q_STAR__EQUALS_") 
| Q_STAR__GREATER_ -> uppercase("Q_STAR__GREATER_") 
| Q_STAR__STAR_ -> uppercase("Q_STAR__STAR_") 
| Q_TILDE__AMPERSAND_ -> uppercase("Q_TILDE__AMPERSAND_") 
| Q_TILDE__VBAR_ -> uppercase("Q_TILDE__VBAR_") 
| QUERY -> uppercase("QUERY") 
| QUOTE -> uppercase("QUOTE") 
| Q_VBAR__EQUALS__GREATER_ -> uppercase("Q_VBAR__EQUALS__GREATER_") 
| Q_VBAR__EQUALS_ -> uppercase("Q_VBAR__EQUALS_") 
| Q_VBAR__HYPHEN__GREATER_ -> uppercase("Q_VBAR__HYPHEN__GREATER_") 
| Q_VBAR__VBAR_ -> uppercase("Q_VBAR__VBAR_") 
| RANDC -> uppercase("RANDC") 
| RAND -> uppercase("RAND") 
| RBRACE -> uppercase("RBRACE") 
| RBRACK -> uppercase("RBRACK") 
| RCMOS -> uppercase("RCMOS") 
| REALTIME -> uppercase("REALTIME") 
| REAL -> uppercase("REAL") 
| REF -> uppercase("REF") 
| REG -> uppercase("REG") 
| REPEAT -> uppercase("REPEAT") 
| RESTRICT -> uppercase("RESTRICT") 
| RETURN -> uppercase("RETURN") 
| RNMOS -> uppercase("RNMOS") 
| RPAREN -> uppercase("RPAREN") 
| RPMOS -> uppercase("RPMOS") 
| RTRANIF0 -> uppercase("RTRANIF0") 
| RTRANIF1 -> uppercase("RTRANIF1") 
| RTRAN -> uppercase("RTRAN") 
| SCALARED -> uppercase("SCALARED") 
| SEMICOLON -> uppercase("SEMICOLON") 
| SHORTINT -> uppercase("SHORTINT") 
| SHORTREAL -> uppercase("SHORTREAL") 
| SIGNED -> uppercase("SIGNED") 
| SLASH -> uppercase("SLASH") 
| SLIST _-> uppercase("SLIST") 
| SPECIFY -> uppercase("SPECIFY") 
| SPECPARAM -> uppercase("SPECPARAM") 
| STAR -> uppercase("STAR") 
| STATIC -> uppercase("STATIC") 
| STRING0 -> uppercase("STRING0") 
| STRING10 -> uppercase("STRING10") 
| STRING11 -> uppercase("STRING11") 
| STRING12 -> uppercase("STRING12") 
| STRING13 -> uppercase("STRING13") 
| STRING14 -> uppercase("STRING14") 
| STRING15 -> uppercase("STRING15") 
| STRING1 -> uppercase("STRING1") 
| STRING2 -> uppercase("STRING2") 
| STRING3 -> uppercase("STRING3") 
| STRING4 -> uppercase("STRING4") 
| STRING5 -> uppercase("STRING5") 
| STRING6 -> uppercase("STRING6") 
| STRING7 -> uppercase("STRING7") 
| STRING8 -> uppercase("STRING8") 
| STRING9 -> uppercase("STRING9") 
| STRING_HYPHEN_IGNORED -> uppercase("STRING_HYPHEN_IGNORED") 
| STRING -> uppercase("STRING") 
| STRUCT -> uppercase("STRUCT") 
| SUPPLY0 -> uppercase("SUPPLY0") 
| SUPPLY1 -> uppercase("SUPPLY1") 
| TABLE_BLANK_LINE -> uppercase("TABLE_BLANK_LINE") 
| TABLE -> uppercase("TABLE") 
| TASK -> uppercase("TASK") 
| TILDE -> uppercase("TILDE") 
| TIME_BLANK_NUMBER -> uppercase("TIME_BLANK_NUMBER") 
| TIMEPRECISION -> uppercase("TIMEPRECISION") 
| TIMEUNIT -> uppercase("TIMEUNIT") 
| TIME -> uppercase("TIME") 
| TIMING_BLANK_SPEC_BLANK_ELEMENT -> uppercase("TIMING_BLANK_SPEC_BLANK_ELEMENT") 
| TLIST _-> uppercase("TLIST") 
| TRACING_UNDERSCORE_OFF -> uppercase("TRACING_UNDERSCORE_OFF") 
| TRACING_UNDERSCORE_ON -> uppercase("TRACING_UNDERSCORE_ON") 
| TRANIF0 -> uppercase("TRANIF0") 
| TRANIF1 -> uppercase("TRANIF1") 
| TRAN -> uppercase("TRAN") 
| TRI0 -> uppercase("TRI0") 
| TRI1 -> uppercase("TRI1") 
| TRI -> uppercase("TRI") 
| TRUE -> uppercase("TRUE") 
| TUPLE10 _-> uppercase("TUPLE10") 
| TUPLE2 _-> uppercase("TUPLE2") 
| TUPLE3 _-> uppercase("TUPLE3") 
| TUPLE4 _-> uppercase("TUPLE4") 
| TUPLE5 _-> uppercase("TUPLE5") 
| TUPLE6 _-> uppercase("TUPLE6") 
| TUPLE7 _-> uppercase("TUPLE7") 
| TUPLE8 _-> uppercase("TUPLE8") 
| TUPLE9 _-> uppercase("TUPLE9") 
| TYPEDEF -> uppercase("TYPEDEF") 
| TYPE_HYPHEN_IDENTIFIER -> uppercase("TYPE_HYPHEN_IDENTIFIER") 
| TYPE -> uppercase("TYPE") 
| UNDERSCORE -> uppercase("UNDERSCORE") 
| UNION -> uppercase("UNION") 
| UNIQUE0 -> uppercase("UNIQUE0") 
| UNIQUE -> uppercase("UNIQUE") 
| UNSIGNED -> uppercase("UNSIGNED") 
| VAR -> uppercase("VAR") 
| VBAR -> uppercase("VBAR") 
| VECTORED -> uppercase("VECTORED") 
| VOID -> uppercase("VOID") 
| WHILE -> uppercase("WHILE") 
| WIRE -> uppercase("WIRE") 
| WREAL -> uppercase("WREAL") 
| XNOR -> uppercase("XNOR") 
| XOR -> uppercase("XOR") 
| YP_LOGIFF -> uppercase("YP_LOGIFF") 
