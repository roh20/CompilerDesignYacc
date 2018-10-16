%{
#include<stdio.h>

%}
%token ID
%token FOR BRAC BRACE SEMI EQ DIGIT OP CO CC


%%
E1:E{printf("For detected");}
expr: ID OP DIGIT;
body: expr;
E:FOR BRAC ID EQ DIGIT SEMI expr SEMI expr BRACE CO body CC;


%%


int main() {
	do{

    yyparse();
}while(1);
    return 0;
}


int yyerror(){}

int yywrap(){}
