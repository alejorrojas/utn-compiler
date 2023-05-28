package code;
import static code.Tokens.*;
%%
%class Lexer
%type Tokens
%line

texto=[a-zA-Z_,0-9,/,\.]+
espacio=[ \t\r\n]+
signos=[\,,\+,\:,*/\[\]{}\.;\-_=@\"!¡¿?\|#\\)()%·$]+
url="https://".+|"http://".+|"ftp://".+|"ftps://".+
link="<link xlink:href:\""+{url}+"\" />"
videodata="<videodata fileref:\""+({url}|{texto})+"\" />"
imagedata="<imagedata fileref:\""+({url}|{texto})+"\" />"
 
%{
    public String lexeme;
%}

%%
"<!DOCTYPE article>" {lexeme=yytext(); return EncabezadoXML;}
"<article>" {lexeme=yytext(); return AperturaArticulo;}
"</article>" {lexeme=yytext(); return CierreArticulo;}
"<sect>" {lexeme=yytext(); return AperturaSeccion;}
"</sect>" {lexeme=yytext(); return CierreSeccion;}
"<title>" {lexeme=yytext(); return AperturaTitulo;}
"</title>" {lexeme=yytext(); return CierreTitulo;}
"<info>" {lexeme=yytext(); return AperturaInfo;}
"</info>" {lexeme=yytext(); return CierreInfo;}
"<itemizedlist>" {lexeme=yytext(); return AperturaItemizedList;}
"</itemizedlist>" {lexeme=yytext(); return CierreItemizedList;}
"<important>" {lexeme=yytext(); return AperturaImportant;}
"</important>" {lexeme=yytext(); return CierreImportant;}
"<para>" {lexeme=yytext(); return AperturaPara;}
"</para>" {lexeme=yytext(); return CierrePara;}
"<simpara>" {lexeme=yytext(); return AperturaSimPara;}
"</simpara>" {lexeme=yytext(); return CierreSimPara;}
"<address>" {lexeme=yytext(); return AperturaAddress;}
"</address>" {lexeme=yytext(); return CierreAddress;}
"<mediaobject>" {lexeme=yytext(); return AperturaMediaObject;}
"</mediaobject>" {lexeme=yytext(); return CierreMediaObject;}
"<informaltable>" {lexeme=yytext(); return AperturaInformalTable;}
"</informaltable>" {lexeme=yytext(); return CierreInformalTable;}
"<comment>" {lexeme=yytext(); return AperturaComment;}
"</comment>" {lexeme=yytext(); return CierreComment;}
"<abstract>" {lexeme=yytext(); return AperturaAbstract;}
"</abstract>" {lexeme=yytext(); return CierreAbstract;}
"<simplesect>" {lexeme=yytext(); return AperturaSimpleSect;}
"</simplesect>" {lexeme=yytext(); return CierreSimpleSect;}
"<section>" {lexeme=yytext(); return AperturaSection;}
"</section>" {lexeme=yytext(); return CierreSection;}
"<author>" {lexeme=yytext(); return AperturaAuthor;}
"</author>" {lexeme=yytext(); return CierreAuthor;}
"<copyright>" {lexeme=yytext(); return AperturaCopyright;}
"</copyright>" {lexeme=yytext(); return CierreCopyright;}
"<street>" {lexeme=yytext(); return AperturaStreet;}
"</street>" {lexeme=yytext(); return CierreStreet;}
"<city>" {lexeme=yytext(); return AperturaCity;}
"</city>" {lexeme=yytext(); return CierreCity;}
"<state>" {lexeme=yytext(); return AperturaState;}
"</state>" {lexeme=yytext(); return CierreState;}
"<phone>" {lexeme=yytext(); return AperturaPhone;}
"</phone>" {lexeme=yytext(); return CierrePhone;}
"<email>" {lexeme=yytext(); return AperturaEmail;}
"</email>" {lexeme=yytext(); return CierreEmail;}
"<firstname>" {lexeme=yytext(); return AperturaFirstName;}
"</firstname>" {lexeme=yytext(); return CierreFirstName;}
"<surname>" {lexeme=yytext(); return AperturaSurname;}
"</surname>" {lexeme=yytext(); return CierreSurname;}
"<year>" {lexeme=yytext(); return AperturaYear;}
"</year>" {lexeme=yytext(); return CierreYear;}
"<holder>" {lexeme=yytext(); return AperturaHolder;}
"</holder>" {lexeme=yytext(); return CierreHolder;}
"<emphasis>" {lexeme=yytext(); return AperturaEmphasis;}
"</emphasis>" {lexeme=yytext(); return CierreEmphasis;}
"<comment>" {lexeme=yytext(); return AperturaComment;}
"</comment>" {lexeme=yytext(); return CierreComment;}
"<tgroup>" {lexeme=yytext(); return AperturaTgroup;}
"</tgroup>" {lexeme=yytext(); return CierreTgroup;}
"<thead>" {lexeme=yytext(); return AperturaThead;}
"</thead>" {lexeme=yytext(); return CierreThead;}
"<tfoot>" {lexeme=yytext(); return AperturaTfoot;}
"</tfoot>" {lexeme=yytext(); return CierreTfoot;}
"<tbody>" {lexeme=yytext(); return AperturaTbody;}
"</tbody>" {lexeme=yytext(); return CierreTbody;}
"<row>" {lexeme=yytext(); return AperturaRow;}
"</row>" {lexeme=yytext(); return CierreRow;}
"<entry>" {lexeme=yytext(); return AperturaEntry;}
"</entry>" {lexeme=yytext(); return CierreEntry;}
"<entrybl>" {lexeme=yytext(); return AperturaEntrybl;}
"</entrybl>" {lexeme=yytext(); return CierreEntrybl;}
"<videoobject>" {lexeme=yytext(); return AperturaVideobject;}
"</videoobject>" {lexeme=yytext(); return CierreVideoobject;}
"<imageobject>" {lexeme=yytext(); return AperturaImageobject;}
"</imageobject>" {lexeme=yytext(); return CierreImageobject;}
"<listitem>" {lexeme=yytext(); return AperturaListItem;}
"</listitem>" {lexeme=yytext(); return CierreListItem;}
{link} {lexeme=yytext(); return Link;}
{url} {lexeme=yytext(); return Url;}
{videodata} {lexeme=yytext(); return Videodata;}
{imagedata} {lexeme=yytext(); return Imagedata;}
"\n" {return Linea;}
{espacio} {/*IGNORE*/}
({texto}|{espacio}|{signos})* {lexeme=yytext(); return Texto;}
. {lexeme=yytext(); return Texto;}