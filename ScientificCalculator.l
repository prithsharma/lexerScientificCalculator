digit	[0-9]
hexNo	0x[0-9ABCDEF]+
letter	[A-Za-z]
%{
	int count;
%}
%%
\(	printf("(T_BRAC_BEGIN,\"(\")\n");
\)	printf("(T_BRAC_END,\")\")\n");
\+	printf("(T_ADD,\"+\")\n");
\-	printf("(T_SUB,\"-\")\n");
\*	printf("(T_MULT,\"*\")\n");
\/	printf("(T_DIV,\"/\")\n");
{digit}*\.{digit}+[eE]{digit}+	printf("(T_DEC_EXP,\"%s\")\n",yytext);
{digit}*\.{digit}+	printf("(T_DEC_REAL,\"%s\")\n",yytext);
{hexNo}	printf("(T_HEX_INT,\"%s\")\n",yytext);
{digit}+	printf("(T_DEC_INT,\"%s\")\n",yytext);
\n|[ ]	;
[\n]+	printf("\n");
.	printf("NOT IN DICT!!!\n");
%%
int yywrap(void){
	return 1;
}
int main(void){
	yylex();
	return 0;
}

