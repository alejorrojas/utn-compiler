package code;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char

//Definiciones generales
texto=[a-zA-Z_,0-9,/,\.]+
espacio=[ \t\r\n]+
signos=[\,,\+,\:,*/\[\]{}\.;\-_=@\"!¡¿?\|#\\)()%&·$]+

//Definiciones de Link, ImageData y VideoData
textoURL=[a-zA-Z0-9:_\-/\.&#=]+
url="https://"+{textoURL}|"http://"+{textoURL}|"ftp://"+{textoURL}|"ftps://"+{textoURL}
AperturaLink="<link xlink:href:\""+{url}+"\" >"|"<link xlink:href:\""+{url}+"\">"
videodata="<videodata fileref=\""+({url}|{texto})+"\" />"|"<videodata fileref:\""+({url}|{texto})+"\"/>"
imagedata="<imagedata fileref=\""+({url}|{texto})+"\" />"|"<imagedata fileref:\""+({url}|{texto})+"\"/>"



%{
    /**
    * Crea y devuelve un nuevo simbolo para luego ser utilizado en parser
    */
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}

%%

"<!DOCTYPE article>" {return new Symbol(sym.EncabezadoXML, yychar, yyline, yytext());}
"<article>" {return new Symbol(sym.AperturaArticulo, yychar, yyline, yytext());}
"</article>" {return new Symbol(sym.CierreArticulo, yychar, yyline, yytext());}
"<date>" {return new Symbol(sym.AperturaDate, yychar, yyline, yytext());}
"</date>" {return new Symbol(sym.CierreDate, yychar, yyline, yytext());}
"<title>" { return new Symbol(sym.AperturaTitulo, yychar, yyline, yytext());}
"</title>" {return new Symbol(sym.CierreTitulo, yychar, yyline, yytext());}
"<info>" {return new Symbol(sym.AperturaInfo, yychar, yyline, yytext());}
"</info>" {return new Symbol(sym.CierreInfo, yychar, yyline, yytext());}
"<itemizedlist>" {return new Symbol(sym.AperturaItemizedList, yychar, yyline, yytext());}
"</itemizedlist>" {return new Symbol(sym.CierreItemizedList, yychar, yyline, yytext());}
"<important>" {return new Symbol(sym.AperturaImportant, yychar, yyline, yytext());}
"</important>" {return new Symbol(sym.CierreImportant, yychar, yyline, yytext());}
"<para>" {return new Symbol(sym.AperturaPara, yychar, yyline, yytext());}
"</para>" {return new Symbol(sym.CierrePara, yychar, yyline, yytext());}
"<simpara>" {return new Symbol(sym.AperturaSimPara, yychar, yyline, yytext());}
"</simpara>" {return new Symbol(sym.CierreSimPara, yychar, yyline, yytext());}
"<address>" {return new Symbol(sym.AperturaAddress, yychar, yyline, yytext());}
"</address>" {return new Symbol(sym.CierreAddress, yychar, yyline, yytext());}
"<mediaobject>" {return new Symbol(sym.AperturaMediaObject, yychar, yyline, yytext());}
"</mediaobject>" {return new Symbol(sym.CierreMediaObject, yychar, yyline, yytext());}
"<informaltable>" {return new Symbol(sym.AperturaInformalTable, yychar, yyline, yytext());}
"</informaltable>" {return new Symbol(sym.CierreInformalTable, yychar, yyline, yytext());}
"<comment>" {return new Symbol(sym.AperturaComment, yychar, yyline, yytext());}
"</comment>" {return new Symbol(sym.CierreComment, yychar, yyline, yytext());}
"<abstract>" {return new Symbol(sym.AperturaAbstract, yychar, yyline, yytext());}
"</abstract>" {return new Symbol(sym.CierreAbstract, yychar, yyline, yytext());}
"<simplesect>" {return new Symbol(sym.AperturaSimpleSect, yychar, yyline, yytext());}
"</simplesect>" {return new Symbol(sym.CierreSimpleSect, yychar, yyline, yytext());}
"<section>" {return new Symbol(sym.AperturaSection, yychar, yyline, yytext());}
"</section>" {return new Symbol(sym.CierreSection, yychar, yyline, yytext());}
"<author>" {return new Symbol(sym.AperturaAuthor, yychar, yyline, yytext());}
"</author>" {return new Symbol(sym.CierreAuthor, yychar, yyline, yytext());}
"<copyright>" {return new Symbol(sym.AperturaCopyright, yychar, yyline, yytext());}
"</copyright>" {return new Symbol(sym.CierreCopyright, yychar, yyline, yytext());}
"<street>" {return new Symbol(sym.AperturaStreet, yychar, yyline, yytext());}
"</street>" {return new Symbol(sym.CierreStreet, yychar, yyline, yytext());}
"<city>" {return new Symbol(sym.AperturaCity, yychar, yyline, yytext());}
"</city>" {return new Symbol(sym.CierreCity, yychar, yyline, yytext());}
"<state>" {return new Symbol(sym.AperturaState, yychar, yyline, yytext());}
"</state>" {return new Symbol(sym.CierreState, yychar, yyline, yytext());}
"<phone>" {return new Symbol(sym.AperturaPhone, yychar, yyline, yytext());}
"</phone>" {return new Symbol(sym.CierrePhone, yychar, yyline, yytext());}
"<email>" {return new Symbol(sym.AperturaEmail, yychar, yyline, yytext());}
"</email>" {return new Symbol(sym.CierreEmail, yychar, yyline, yytext());}
"<firstname>" {return new Symbol(sym.AperturaFirstName, yychar, yyline, yytext());}
"</firstname>" {return new Symbol(sym.CierreFirstName, yychar, yyline, yytext());}
"<surname>" {return new Symbol(sym.AperturaSurname, yychar, yyline, yytext());}
"</surname>" {return new Symbol(sym.CierreSurname, yychar, yyline, yytext());}
"<year>" {return new Symbol(sym.AperturaYear, yychar, yyline, yytext());}
"</year>" {return new Symbol(sym.CierreYear, yychar, yyline, yytext());}
"<holder>" {return new Symbol(sym.AperturaHolder, yychar, yyline, yytext());}
"</holder>" {return new Symbol(sym.CierreHolder, yychar, yyline, yytext());}
"<emphasis>" {return new Symbol(sym.AperturaEmphasis, yychar, yyline, yytext());}
"</emphasis>" {return new Symbol(sym.CierreEmphasis, yychar, yyline, yytext());}
"<comment>" {return new Symbol(sym.AperturaComment, yychar, yyline, yytext());}
"</comment>" {return new Symbol(sym.CierreComment, yychar, yyline, yytext());}
"<tgroup>" {return new Symbol(sym.AperturaTgroup, yychar, yyline, yytext());}
"</tgroup>" {return new Symbol(sym.CierreTgroup, yychar, yyline, yytext());}
"<thead>" {return new Symbol(sym.AperturaThead, yychar, yyline, yytext());}
"</thead>" {return new Symbol(sym.CierreThead, yychar, yyline, yytext());}
"<tfoot>" {return new Symbol(sym.AperturaTfoot, yychar, yyline, yytext());}
"</tfoot>" {return new Symbol(sym.CierreTfoot, yychar, yyline, yytext());}
"<tbody>" {return new Symbol(sym.AperturaTbody, yychar, yyline, yytext());}
"</tbody>" {return new Symbol(sym.CierreTbody, yychar, yyline, yytext());}
"<row>" {return new Symbol(sym.AperturaRow, yychar, yyline, yytext());}
"</row>" {return new Symbol(sym.CierreRow, yychar, yyline, yytext());}
"<entry>" {return new Symbol(sym.AperturaEntry, yychar, yyline, yytext());}
"</entry>" {return new Symbol(sym.CierreEntry, yychar, yyline, yytext());}
"<entrytbl>" {return new Symbol(sym.AperturaEntrytbl, yychar, yyline, yytext());}
"</entrytbl>" {return new Symbol(sym.CierreEntrytbl, yychar, yyline, yytext());}
"<videoobject>" {return new Symbol(sym.AperturaVideoobject, yychar, yyline, yytext());}
"</videoobject>" {return new Symbol(sym.CierreVideoobject, yychar, yyline, yytext());}
"<imageobject>" {return new Symbol(sym.AperturaImageobject, yychar, yyline, yytext());}
"</imageobject>" {return new Symbol(sym.CierreImageobject, yychar, yyline, yytext());}
"<listitem>" {return new Symbol(sym.AperturaListItem, yychar, yyline, yytext());}
"</listitem>" {return new Symbol(sym.CierreListItem, yychar, yyline, yytext());}
{AperturaLink} {return new Symbol(sym.AperturaLink, yychar, yyline, yytext());}
"</link>" {return new Symbol(sym.CierreLink, yychar, yyline, yytext());}
{videodata} {return new Symbol(sym.Videodata, yychar, yyline, yytext());}
{imagedata} {return new Symbol(sym.Imagedata, yychar, yyline, yytext());}
{espacio} {/*IGNORE*/}
({texto}|{espacio}|{signos})* {
    System.out.print(yytext());
    return new Symbol(sym.Texto, yychar, yyline, yytext());
    }
 . {/*IGNORE*/}
