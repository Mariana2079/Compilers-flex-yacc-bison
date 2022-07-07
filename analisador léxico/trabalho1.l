%option noyywrap
%{
  #include <stdio.h>
  int linha = 1;
%}
ID [a-zA-Z@]+
numberFloat [0-9]*"."[0-9]+
numberInt [0-9]+
%%
"programa" {printf("[programa,%d]",linha);}
"var" {printf("[var,%d]",linha);}
"inteiro" {printf("[int,%d]",linha);}
"real" {printf("[real,%d]",linha);}
"booleano" {printf("[boolean,%d]",linha);}
"inicio" {printf("[ini,%d]",linha);}
"fim" {printf("[fim,%d]",linha);}
"se" {printf("[if,%d]",linha);}
"entao" {printf("[so,%d]",linha);}
"senao" {printf("[else,%d]",linha);}
"enquanto" {printf("[while,%d]",linha);}
"faca" {printf("[do,%d]",linha);}
"leia" {printf("[read,%d]",linha);}
"escreva" {printf("[wr,%d]",linha);}
"ou" {printf("[ou,%d]",linha);}
"div" {printf("[div,%d]",linha);}
"e" {printf("[e,%d]",linha);}
"verdadeiro" {printf("[vdd,%d]",linha);}
"falso" {printf("[false,%d]",linha);}
"nao" {printf("[nao,%d]",linha);}
"numero" {printf("[number,%d]",linha);}
":=" {printf("[atrib,%d]",linha);}
"<>" {printf("[desigual,%d]",linha);}
"=" {printf("[igual,%d]",linha);}
"<" {printf("[menor,%d]",linha);}
">" {printf("[maior,%d]",linha);}
"<=" {printf("[menor_igual,%d]",linha);}
">=" {printf("[maior_igual,%d]",linha);}
";" {printf("[scolon,%d]",linha);}
"*" {printf("[mult,%d]",linha);}
"+" {printf("[mais,%d]",linha);}
"-" {printf("[menos,%d]",linha);}
"," {printf("[virgula,%d]",linha);}
":" {printf("[dois pontos,%d]",linha);}
{ID} {printf("[id,%d]", linha);}
{numberInt} {printf("[numInt,%d]",linha);}
{numberFloat} {printf("[numFloat,%d]",linha);}
"{"[^}\n]*"}" ;
" "

\n {printf("\n");linha++;}
%%

int main(int argc, char const *argv[]) {
  yyin = fopen(argv[1], "r");
  yylex();
  fclose(yyin);
  return 0;
}
