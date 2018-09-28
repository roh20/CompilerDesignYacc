%{
#include<stdio.h>
#include<ctype.h>

#include<math.h>
int d;
int d1;
%}

%union
{
	float n;
}
%type <n> E
%token <n> FLOAT
%left '+' '-' 

%left '*' '/'
%left '&'
%left 't'
%token TAN
//%left '%'

%%
A:E {printf("%f\n",$1);}; 
E: E '+' E {$$= $1 + $3 ;}
| E '-' E {$$=$1 - $3;}
| E '*' E {$$=$1 * $3;}
| E '/' E {$$=$1 / $3;}

| '&' E {$$=sin($2*3.14/180);}
|  't' E {$$tan($2*3.14/180);}
//| E '%' E {$$=$1 % $3;}

|FLOAT {$$=$1 ;};


%%

yylex()
{
	int c;
	c=getchar();
	while(c!='\n')
	{
		if(isdigit(c))
		{
			ungetc(c,stdin);
			scanf("%f",&yylval);
			return FLOAT;
		
		}
		return c;

	}
}
int main()
{
	while(1)
		yyparse();
}



int yyerror(){}

