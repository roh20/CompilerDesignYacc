%{
#include<stdio.h>
#include "y.tab.h"

%}

%%
for {return FOR;}
"(" {return BRAC;}
")" {return BRACE;}
[a-z]+ {return ID;}

";" {return SEMI;}

"=" {return EQ;}
[0-9]+ {return DIGIT;}

">" {return OP;} 

"{" {return CO;}
"}" {return CC;}

%%
