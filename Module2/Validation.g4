grammar Validation;
program: statement* EOF;

statement
    : 'required' '(' ID ')' ';'
    | 'type' '(' ID ',' dataType ')' ';'
    | 'validate' '(' ID ',' NUMBER ',' NUMBER ')' ';'
    ;

dataType
    : 'number'
    | 'string'
    | 'boolean'
    ;

ID: [a-zA-Z_][a-zA-Z0-9_]*;
NUMBER: [0-9]+;
WS: [ \t\r\n]+ -> skip;