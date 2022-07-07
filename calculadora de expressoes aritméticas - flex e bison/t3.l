%{
 #include "t3.tab.h"
 #include <stdlib.h>
 void yyerror(char *);
%} 
%%
[a-zA-Z] { yylval = *yytext - 'a'; return VARIAVEL;}
[0-9]+ { yylval = atoi(yytext); return NUMBER; }
[ \t] ;
"/" {return DIV;}
"=" {return IGUAL;}
"*" {return VEZES;}
"+" {return MAIS;}
"-" {return MENOS;}
"(" {return ABREP;}
")" {return FECHAP;}
"\n" {return ENTER;}
. yyerror("Caracter Invalido");
%%


int yywrap(void) {
 return 1;
}