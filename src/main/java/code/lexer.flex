package code;
import static code.Tokens.*;
%%
%class Lexer
%type Tokens

texto=[a-zA-Z_]+
numeros=[0-9]+
espacio=[ ,\t,\r,\n]+
article=<article\s*.*>\s*.*<\/article>
section=<sect\s*.*>\s*.*<\/sect>
title=<title\s*.*>\s*.*<\/title>

%{
    public String lexeme;
%}

%%
{article} {lexeme=yytext(); return Articulo;}
{section} {lexeme=yytext(); return Sección;}
{title} {lexeme=yytext(); return Titulo;}
{texto}({texto}|{numeros})* {lexeme=yytext(); return Texto;}
{espacio} {/*Ignore*/}
 . {return ERROR;}