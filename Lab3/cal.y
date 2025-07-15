%{
#include<stdio.h>
void yyerror(char *s);
int yylex();
%}

%token NUM ADD SUB MUL DIV (this line is for the previuos code)
%start cal (this line is for the previuos code)

%token INT_TYPE INT_NUM FLOAT_TYPE FLOAT_NUM ASSIGN SEMI ID
%start stmts

%% ( this code block is for the previuous code)
cal: cal exp {printf("RESULT = %d\n", $2);}
    |
    ;

exp: exp ADD term {$$=$1+$3; printf("exp ADD term %d+%d=%d\n", $1, $3, $$);}
    |exp SUB term {$$=$1-$3; printf("exp SUB term %d-%d=%d\n", $1, $3, $$);}
    |term {$$=$1; printf("term %d=%d\n", $$, $1);}
    ;

term: term MUL NUM {$$=$1*$3; printf("term MUL NUM %d*%d=%d\n", $1, $3, $$);}
    |term DIV NUM {$$=$1/$3; printf("term DIV NUM %d/%d=%d\n", $1, $3, $$);}
    |NUM {$$=$1; printf("NUM %d=%d\n", $$, $1);}
    ; 
%%

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

