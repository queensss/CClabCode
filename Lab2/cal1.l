%option noyywrap

%{
//Roll Number: 221-115-053
//
%}

digit [0-9]
delim [ \t]
letter[a-zA-Z]
under[_]

%%
{digit}{digit}* {printf("%s -> INT_NUMBER\n", yytext);}
"+" {printf("%s -> ADD\n", yytext);}
"-" {printf("%s -> SUB\n", yytext);}
"*" {printf("%s -> MUL\n", yytext);}
"/" {printf("%s -> DIV\n", yytext);}
"%" {printf("%s -> REM\n", yytext);}
"if" {printf("%s -> IF\n", yytext);}
"(" {printf("%s -> LP\n", yytext);}
">" {printf("%s -> GT\n", yytext);}
")" {printf("%s -> RP\n", yytext);}
"{" {printf("%s -> LCB\n", yytext);}
"=" {printf("%s -> ASSIGN\n", yytext);}
";" {printf("%s -> SEMI\n", yytext);}
"}" {printf("%s -> RCB\n", yytext);}
({under}|{letter})({under}|{letter}|{digit})* {printf("%s -> ID\n", yytext);}


{delim} {}
%%

int main()
{
  yylex();
  return 0;
}
