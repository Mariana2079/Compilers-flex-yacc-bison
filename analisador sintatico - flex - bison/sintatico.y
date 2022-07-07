%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
int yyparse(void);
void yyerror (const char *);

%}

%token PROGRAMA VAR INTEIRO REAL BOOLEAN INI FIM SE ENTAO SENAO WHILE DO LER WR OU DIV E TRUE FALSE NAO NUM ATRIB DESIGUAL IGUAL MENOR MAIOR MENOR_IGUAL MAIOR_IGUAL PONTO_V MULT MAIS MENOS ID FLOAT ABPAR FEPAR VIRGULA DPONT NUMBER
%right ENTAO SENAO
                                                                                                                                                                                                                                                                                                              %expect 1
%%
programa: PROGRAMA identificador PONTO_V bloco { printf("\nSINTATICAMENTE CORRETO!\n");}
bloco: VAR declaracao INI comandos FIM { printf("bloco->var <declaracao> inicio <comandos> fim\n");}
declaracao: nome_var DPONT tipo PONTO_V { printf("declaracao -> nome_var : <tipo> ;\n");}
| nome_var DPONT tipo PONTO_V declaracao { printf("declaracao -> nome_var : tipo ; declaracao\n");}
;
nome_var: identificador { printf("nome_var -> <identificador>\n");}
| identificador VIRGULA nome_var { printf("nome_var -> <identificador> , <nome_var>\n");}
;
tipo: INTEIRO  { printf("tipo -> inteiro\n");}
| REAL  { printf("tipo -> real\n");}
| BOOLEAN  { printf("tipo -> booleano\n");}
;
comandos: comando { printf("comandos -> <comando>\n");}
| comando PONTO_V comandos %prec "comando"{ printf("comandos <comando> ; <comandos>\n");}
;
comando: atribuicao { printf("comando -> <atribuicao> \n");}
| condicional { printf("comando -> <condicional>\n");}
| enquanto { printf("comando -> <enquanto>\n");}
| leitura { printf("comando -> <leitura>\n");}
| escrita { printf("comando -> <escrita>\n");}
;
atribuicao: identificador ATRIB expressao { printf("atribuicao -> <identificador> := <expressao>\n");}
condicional: SE expressao ENTAO comandos { printf("condicional -> se <expressao> entao <comandos> \n");}
|SE expressao ENTAO comandos SENAO comandos { printf("condicional -> se <expressao> entao <comandos> senao <comandos>\n");}
;
enquanto: WHILE expressao DO comandos { printf("enquanto ->enquanto <expressao> faca <comandos>\n");}
leitura: LER ABPAR identificador FEPAR { printf("leitura -> leia (<identificador>)\n");}
escrita: WR ABPAR identificador FEPAR { printf("escrita -> escreva (<identificador>)\n");}
expressao: simples { printf("expressao -><simples>\n");}
| simples op_relacional simples { printf("expressao -><simples> <op_relacional> <simples>\n");}
;
op_relacional: DESIGUAL { printf("op_relacional -> <>\n");}
| IGUAL { printf("op_relacional -> = \n");}
| MENOR { printf("op_relacional -> < \n");}
| MAIOR { printf("op_relacional -> > \n");}
| MENOR_IGUAL { printf("op_relacional -> <=\n");}
| MAIOR_IGUAL { printf("op_relacional -> >=\n");}
;
op: MULT { printf("op-> *\n");}
| DIV { printf("op-> div\n");}
| E { printf("op-> e\n");}
;
simples: termo operador termo  { printf("simples -> <termo> <operador> <termo>\n");}
| termo  { printf("simples -> <termo>\n");}
;
operador: MAIS  { printf("operador -> +\n");}
| MENOS  { printf("operador -> -\n");}
| OU  { printf("operador -> ou\n");}
;
termo: fator  { printf("termo -> <fator>\n");}
| fator op fator  { printf("termo -> <fator> <op> <fator>\n");}
;

fator: identificador  { printf("fator -> <identificador>\n");}
| numero  { printf("fator -> <numero>\n");}
| ABPAR expressao FEPAR  { printf("fator -> (<expressao>)\n");}
| TRUE  { printf("fator -> verdadeiro\n");}
| FALSE  { printf("fator -> falso\n");}
| NAO fator  { printf("fator -> nao <fator>\n");}
;
identificador: ID { printf("identificador -> id\n");}
numero: NUM { printf(" numero -> num\n");}

%%
extern FILE * yyin;

int main (int argc, char** argv)
{

    FILE *file;
    file = fopen(argv[1], "r");
      if (!file)
        {
          printf("Arquivo nao encontrado!");
          exit(1);
        }
    yyin=file;

  yyparse();
}

void yyerror (const char * s)
{
 extern int yylineno;
 extern char * yytext;
 printf("SINTATICAMENTE INCORRETO!\n");
 }
