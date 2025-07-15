%option noyywrap

%{
//Roll Number: 221115053
//
%}

letter [a-zA-Z]
digit [0-9]
delim [ \t]
under [_]
num {digit}{digit}*
float_num {num}*[.]{num}
%%

{num} {printf("%s -> INT_NUMBER\n", yytext);} 
{float_num} {printf("%s -> FLOAT_NUMBER\n", yytext);}


"+" {printf("%s -> ADD\n", yytext);}
"int" {printf("%s -> INT_TYPE\n", yytext);}
"float" {printf("%s -> FLOAT_TYPE\n", yytext);}
"while" {printf("%s -> WHILE\n", yytext);}
"if" {printf("%s -> IF\n", yytext);}
"(" {printf("%s -> LP\n", yytext);}
")" {printf("%s -> RP\n", yytext);}
"{" {printf("%s -> LB\n", yytext);}
"}" {printf("%s -> RB\n", yytext);}
"=" {printf("%s -> ASSIGN\n", yytext);}
";" {printf("%s -> SEMI\n", yytext);}
"for"   {printf("%s -> FOR\n", yytext);}
"else"  {printf("%s ->  ELSE\n", yytext);}
"return" {printf("%s -> RETURN\n", yytext);}

({under}|{letter})({under}|{letter}|{digit})* {printf("%s -> ID\n", yytext);}

{delim} {}
%%

int main()
{
  yylex();
  return 0;
}
