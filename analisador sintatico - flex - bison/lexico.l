%option noyywrap
%option yylineno
%{
  #include "sintatico.tab.h"
  int linha = 1;

%}
ID [a-zA-Z]+
number [0-9]*
comment [{a-zA-Z}]*
%%
"programa" {return PROGRAMA;}
"var" {return VAR;}
"inteiro" {return INTEIRO;}
"real" {return REAL;}
"booleano" {return BOOLEAN;}
"inicio" {return INI;}
"fim" {return FIM;}
"se" {return SE;}
"entao" {return ENTAO;}
"senao" {return SENAO;}
"enquanto" {return WHILE;}
"faca" {return DO;}
"leia" {return LER;}
"escreva" {return WR;}
"ou" {return OU;}
"div" {return DIV;}
"e" {return E;}
"verdadeiro" {return TRUE;}
"falso" {return FALSE;}
"nao" {return NAO;}
"numero" {return NUMBER;}
":=" {return ATRIB;}
"<>" {return DESIGUAL;}
"=" {return IGUAL;}
"<" {return MENOR;}
">" {return MAIOR;}
"," {return VIRGULA;}
":" {return DPONT;}
"<=" {return MENOR_IGUAL;}
">=" {return MAIOR_IGUAL;}
";" {return PONTO_V;}
"*" {return MULT;}
"+" {return MAIS;}
"-" {return MENOS;}
"(" {return ABPAR;}
")" {return FEPAR;}
{ID} {return ID;}
{number}+"."{number} {return NUM;}
{number}+","{number} {return NUM;}
{number} {return NUM;}
{comment}
" "
\n {printf("\n");linha++;}
%%
