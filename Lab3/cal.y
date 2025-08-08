%{
#include<stdio.h>
void yyerror(char *s);
int yylex();
%}


%token INT_TYPE INT_NUM FLOAT_TYPE FLOAT_NUM ASSIGN SEMI ID
%start stmts



%% ( this is for current input file)

stmts : stmts stmt | ;

stmt : dclr_stmt | ass_stmt;

dclr_stmt : Type ID SEMI
           | Type ID ASSIGN NUM SEMI;

 Type : INT_TYPE | FLOAT_TYPE;

 NUM : INT_NUM | FLOAT_NUM;

 ass_stmt : ID ASSIGN NUM SEMI;

if_stmt : IF LP ID LT ID RP LCB stmts RCB;


 ass_stmt : ID ASSIGN exp;

 exp  : exp ADD term
      |exp SUB term
      |exp MUL term
      |exp DIV term
      | term ;

 term : ID | INT_NUM;

%%

void yyerror(char *s)
{
    fprintf(stderr, "error: %s", s);
}

int main()
{
    yyparse();
    printf("Parsing Finished\n");
}


