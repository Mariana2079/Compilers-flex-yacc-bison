%{
 #include <stdio.h>
 void yyerror(char *);
 int yylex(void);
 int vet[20];
%}
%token NUMBER VARIAVEL
%token ABREP FECHAP MAIS MENOS VEZES DIV IGUAL ENTER
%left MAIS MENOS IGUAL 
%left DIV VEZES 
%%
program:
 program statement ENTER
 | /* NULL */
 ;
statement:
 expression  { printf("%d\n", $1); }
 | VARIAVEL IGUAL expression { vet[$1] = $3; }
 ;
expression:
 NUMBER
 | VARIAVEL { $$ = vet[$1]; }
 | MENOS expression { $$ = -$2; }
 | expression MAIS expression { $$ = $1 + $3; }
 | expression MENOS expression { $$ = $1 - $3; }
 | expression VEZES expression { $$ = $1 * $3; }
 | expression DIV expression { $$ = $1 / $3; }
 | ABREP expression FECHAP { $$ = $2; }
 ;
%%
void yyerror(char *s) {
 fprintf(stderr, "%s\n", s);
}
int main(void) {
 yyparse();
}