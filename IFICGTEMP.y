%{
#include<stdio.h>
#include<string.h>

struct qua
{
	char *ans,*op1,*op2,*op;
}q[100];
int c=0;
%}


%token ID NUM
%right '='
%left '+' '-'
%left '*' '/'
%left UMINUS
%%
S:ID{push();} '='{push();} E{codegen_assign();};
E:E'+'{push();} T{codegen();}
|E'-'{push();} T{codegen();}
| T
;
T:T'*'{push();} F{codegen();}
|T'/'{push();} F{codegen();}
|F
;
F:'(' E ')'
|'-'{push();} F{codegen_umin();} %prec UMINUS
|ID{push();}
|NUM{push();}
;
%%

#include "lex.yy.c"
#include<ctype.h>
char st[100][10];
int top=0;
char i_[2]="0";
char temp[2]="t";

main()
{
printf("Enter the expression : ");
yyparse();
}

push()
{
strcpy(st[++top],yytext);
}

codegen()
{
strcpy(temp,"t");
strcat(temp,i_);

q[c].ans=malloc(strlen(temp+1));

q[c].op1=malloc(strlen(st[top-2]));

q[c].op2=malloc(strlen(st[top]));

q[c].op=malloc(strlen(st[top-1]));

strcpy(q[c].ans,temp);
strcpy(q[c].op1,st[top-2]);
strcpy(q[c].op2,st[top]);
strcpy(q[c].op,st[top-1]);

printf("%s = %s %s %s\n",q[c].ans,q[c].op1,q[c].op,q[c].op2);
top-=2;
c++;
strcpy(st[top],temp);
i_[0]++;
}

codegen_umin()
{
strcpy(temp,"t");
strcat(temp,i_);
printf("%s = -%s\n",temp,st[top]);
top--;
strcpy(st[top],temp);
i_[0]++;
}

codegen_assign()
{
printf("%s = %s\n",st[top-2],st[top]);
top-=2;
}
