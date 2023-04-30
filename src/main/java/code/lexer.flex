package code;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char

encabezado=<!Doctype article> 
articleApertura=<article>
texto=[a-zA-Z_]+
numeros=[0-9]+
espacio=[ ,\t,\r,\n]+
infoApertura=<info>
titleApertura=<title>
itemizedlistApertura=<itemizedlist>
importantApertura=<important>
paraApertura=<para>
addressApertura=<address>
mediaobjectApertura=<mediaobject>
informaltableApertura=<informaltable>
commentApertura=<comment>
abstractApertura=<abstract>
simplesectApertura=<simplesect>
dateApertura=<date>
copyrightApertura=<copyright>

%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}

%%

"<!Doctype article>" {return new Symbol(sym.Encabezado, yychar, yyline, yytext());}
{articleApertura} {return new Symbol(sym.ArticleApertura, yychar, yyline, yytext());}
"</article>" {return new Symbol(sym.ArticleCierre, yychar, yyline, yytext());}
{infoApertura} {return new Symbol(sym.AperturaInfo, yychar, yyline, yytext());}
"</info>" {return new Symbol(sym.CierreInfo, yychar, yyline, yytext());}
{titleApertura} {return new Symbol(sym.AperturaTitulo, yychar, yyline, yytext());}
"</title>" {return new Symbol(sym.CierreTitulo, yychar, yyline, yytext());}
{itemizedlistApertura} {return new Symbol(sym.AperturaListaPuntos, yychar, yyline, yytext());}
"</itemizedlist>" {return new Symbol(sym.CierreListaPuntos, yychar, yyline, yytext());}
{importantApertura} {return new Symbol(sym.AperturaImportante, yychar, yyline, yytext());}
"</important>" {return new Symbol(sym.CierreImportante, yychar, yyline, yytext());}
{paraApertura} {return new Symbol(sym.AperturaParrafo, yychar, yyline, yytext());}
"</para>" {return new Symbol(sym.CierreParrafo, yychar, yyline, yytext());}
{addressApertura} {return new Symbol(sym.AperturaDireccion, yychar, yyline, yytext());}
"</address>" {return new Symbol(sym.CierreDireccion, yychar, yyline, yytext());}
{mediaobjectApertura} {return new Symbol(sym.AperturaObjetoMedios, yychar, yyline, yytext());}
"</mediaobject>" {return new Symbol(sym.CierreObjetoMedios, yychar, yyline, yytext());}
{informaltableApertura} {return new Symbol(sym.AperturaTablaInformal, yychar, yyline, yytext());}
"</informaltable>" {return new Symbol(sym.CierreTablaInformal, yychar, yyline, yytext());}
{commentApertura} {return new Symbol(sym.AperturaComentario, yychar, yyline, yytext());}
"</comment>" {return new Symbol(sym.CierreComentario, yychar, yyline, yytext());}
{abstractApertura} {return new Symbol(sym.AperturaResumen, yychar, yyline, yytext());}
"</abstract>" {return new Symbol(sym.CierreResumen, yychar, yyline, yytext());}
{simplesectApertura} {return new Symbol(sym.AperturaSeccionSimple, yychar, yyline, yytext());}
"</simplesect>" {return new Symbol(sym.CierreSeccionSimple, yychar, yyline, yytext());}
{dateApertura} {return new Symbol(sym.AperturaFecha, yychar, yyline, yytext());}
"</date>" {return new Symbol(sym.CierreFecha, yychar, yyline, yytext());}
{copyrightApertura} {return new Symbol(sym.AperturaDerechos, yychar, yyline, yytext());}
"</copyright>" {return new Symbol(sym.CierreDerechos, yychar, yyline, yytext());}
{espacio} {/*Ignore*/}
{texto}({texto}|{numeros}|{espacio} )* {return new Symbol(sym.Texto, yychar, yyline, yytext());}
 . {return new Symbol(sym.ERROR, yychar, yyline, yytext());}
