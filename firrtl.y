%token CASE DEFAULT IF SWITCH WHILE DO FOR GOTO CONTINUE BREAK RETURN
%token  add
%token  AND
%token  andr
%token  asClock
%token  asSInt
%token  asUInt
%token  bits
%token  cat
%token  cvt
%token  circuit
%token  Clock
%token  data_type
%token  depth
%token  div
%token  dshl
%token  dshr
%token  else
%token  flip
%token  EQ
%token  extmodule
%token  geq
%token  gt
%token  head
%token  id
%token  input
%token  inst
%token  int
%token  invalid
%token  is
%token  leq
%token  lt
%token  mem
%token  MOD
%token  MODULE
%token  mul
%token  mux
%token  neg
%token  neq
%token  NEW
%token  node
%token  not
%token  OF
%token  old
%token  OR
%token  orr
%token  output
%token  pad
%token  printf
%token  reader
%token  read_latency
%token  read_under_write
%token  readwriter
%token  reg
%token  shl
%token  shr
%token  skip
%token  SInt
%token  stop
%token  string
%token  sub
%token  tail
%token  UNDEFINED
%token  UInt
%token  validif
%token  WHEN
%token  wire
%token  write_latency
%token  writer
%token  xor
%token  xorr

%start Circuit

%{
  // #include "firrtl.h"
%}

%%

Circuit:info_opt circuit id ':' '(' module_lst ')'  // Circuit
Module : info_opt MODULE id ':' '('  port_lst stmt  ')'  // Module
| info_opt  extmodule id ':' '('  port_lst  ')'  // External Module
port : info_opt  dir id ':' Type // Port
dir : input | output // Port Direction
int_opt : | '<' int '>'
Type : UInt int_opt  // Unsigned Integer
| SInt int_opt  // Signed Integer
| Clock // Clock
| '{' field_lst '}'  // Bundle
| Type '[' int ']'  // Vector
field : flip_opt id ':' Type // Bundle Field
stmt : info_opt  wire id ':' Type // Wire
| info_opt  reg id ':' Type  ','  exp  '['  exp  ','  exp_opt  // Register
| info_opt  mem id ':' '('  // Memory
data_type '=' '>' Type depth '=' '>' int read_latency '=' '>' int write_latency '=' '>' int read_under_write '=' '>' ruw reader '=' '>' id_lst writer '=' '>' id_lst readwriter '=' '>' id_lst  ')'  | info_opt  inst id OF id // Instance
| info_opt  node id '=' exp // Node
| info_opt  exp '<' '=' exp // Connect
| info_opt  exp '<' '-' exp // Partial Connect
| info_opt  exp is invalid // Invalidate
| info_opt  WHEN exp ':' stmt else_stmt_opt  // Conditional
| info_opt  stop'('  exp  ','  exp  ','  int  ')'  // Stop
| info_opt  printf'('  exp  ','  exp  ','  string  ','  exp_lst  ')'  // Printf
| info_opt  skip // Empty
| info_opt  '('  stmt_lst  ')'  // Statement Group
ruw : old | NEW | UNDEFINED // Read Under Write Flag
info : '@'  '['  string  ','  int  ','  int  ']'  // File Information Token

exp : UInt int_opt '('  int  ')'  // Literal Unsigned Integer
| UInt int_opt  '('  string  ')'  // Literal Unsigned Integer From Bits
| SInt int_opt  '('  int  ')'  // Literal Signed Integer
| SInt int_opt  '('  string  ')'  // Literal Signed Integer From Bits
| id // Reference
| exp '.' id // Subfield
| exp  '['  int  ']'  // Subindex
| exp  '['  exp  ']'  // Subaccess
| mux '('  exp  ','  exp  ','  exp  ')'  // Multiplexor
| validif '('  exp  ','  exp  ')'  // Conditionally Valid
| primop '('  exp_lst  ','  int_lst  ')' 

primop : add // Add
| sub // Subtract
| mul // Multiply
| div // Divide
| MOD // Modulo
| lt // Less Than
| leq // Less or Equal
| gt // Greater Than
| geq // Greater or Equal
| EQ // Equal
| neq // Not Equal
| pad // Pad
| asUInt // Interpret Bits as UInt
| asSInt // Interpret Bits as SInt
| asClock // Interpret as Clock
| shl // Shift Left
| shr // Shift Right
| dshl // Dynamic Shift Left
| dshr // Dynamic Shift Right
| cvt // Arithmetic Convert to Signed
| neg // Negate
| not // Not
| AND // And
| OR // Or
| xor // Xor
| andr // And Reduce
| orr // Or Reduce
| xorr // Xor Reduce
| cat // Concatenation
| bits // Bit Extraction
| head // Head
| tail // Tail

id_lst: id | id_lst id
exp_lst: exp | exp_lst exp
field_lst: field | field_lst field
int_lst: int | int_lst int
module_lst: Module | module_lst Module
port_lst: port | port_lst port
stmt_lst: stmt | stmt_lst stmt

info_opt: | info
else_stmt_opt: | else ':' stmt
exp_opt: | exp
flip_opt: | flip