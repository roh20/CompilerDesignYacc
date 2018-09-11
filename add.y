%{
#include<stdio.h>
#include<ctype.h>
#include<math.h>

%}
%token NUM
%left '+' '-' 
%left '*' '/'
%left '%'

%%
A:E {printf("%d",$1);}; 
E: E '+' E {$$= $1 + $3 ;}
| E '-' E {$$=$1 - $3;}
| E '*' E {$$=$1 * $3;}
| E '/' E {$$=$1 / $3;}
| E '%' E {$$=$1 % $3;}
|NUM {$$=$1 ;};


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
			scanf("%d",&yylval);
			return NUM;
		
		}
		return c;

	}
}
int main()
{
	while(1)
		yyparse();
}



int yyerror(){printf("e");}

