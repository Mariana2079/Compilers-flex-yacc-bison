programa test ;
var
v : inteiro ;
i , max , juro : inteiro ;
inicio
enquanto v <> -1 faca
inicio
leia ( v ) ;    { leia o valor inicial }
leia ( juro ) ; { leia a taxa de juros }
leia ( max ) ;  { leia o periodo }
valor := 1 ;
i := 1 ;
enquanto i <= max { (1+juro) elevado a n } faca
inicio
valor := valor * ( 1.0 + juro ) ;
i := i + 1 ;
fim
escreva ( v@lor ) ;
fim
fim