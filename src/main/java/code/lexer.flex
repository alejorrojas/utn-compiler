package code;
import static code.Tokens.*;
%%
%class Lexer
%type Tokens
%line

texto=[a-zA-Z_]+
numeros=[0-9]+
espacio=[ ,\t,\r,\n]+
articleApertura=<article>
sectionApertura=<sect>
title=<title\s*.*>\s*.*<\/title>
    
%{
    public String lexeme;
%}

%%
{articleApertura} {lexeme=yytext(); return AperturaArticulo;}
"</article>" {lexeme=yytext(); return CierreArticulo;}
{sectionApertura} {lexeme=yytext(); return AperturaSeccion;}
"</sect>" {lexeme=yytext(); return CierreSeccion;}
{title} {lexeme=yytext(); return Titulo;}
{texto}({texto}|{numeros})* {lexeme=yytext(); return Texto;}
{numeros} {lexeme=yytext(); return Numero;}
"\n"    {return Linea;}
">" | "<"   {return Linea;}
{espacio} {/*Ignore*/}
 . {return ERROR;}