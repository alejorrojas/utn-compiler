package code;
import java_cup.runtime.Symbol;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char

//Definiciones generales
texto=[a-zA-Z_,0-9,/,áéíóú]+
espacio=[ \t\r\n]+
signos=[\,,\+,\:,*/\[\]{}\.;\-_=@\"!¡¿?\|#\\)()%&·$]+

//Definiciones de Link, ImageData y VideoData
textoURL=[a-zA-Z0-9:_\-/\.&#?=]+
LinkUrl="https://"+{textoURL}+"\""+({espacio})*+">"|"http://"+{textoURL}+"\""+({espacio})*+">"|"ftp://"+{textoURL}+"\""+({espacio})*+">"|"ftps://"+{textoURL}+"\""+({espacio})*+">"
DataUrl="https://"+{textoURL}|"http://"+{textoURL}|"ftp://"+{textoURL}|"ftps://"+{textoURL}
videodata="<videodata fileref=\""+({DataUrl}|{texto})+"\" />"|"<videodata fileref:\""+({DataUrl}|{texto})+"\"/>"
imagedata="<imagedata fileref=\""+({DataUrl}|{texto})+"\" />"|"<imagedata fileref:\""+({DataUrl}|{texto})+"\"/>"



%{
    
    BufferedWriter writer;  
    Boolean isSection = false;
    Boolean isInfo = false;

    /**
    * Inicializa el Writter para escribir sobre el HTML
    */
    public void InitFileWritter() throws IOException{
        this.writer = new BufferedWriter(new FileWriter("index.html"));
        this.Write("<html>\n"
            +"<head><title>UTN Parser</title></head>\n"
            +"<body>\n");
       
    }
    
    /**
    * Invoca al writter y nos permite escribir sobre el HTML
    * @param token String a escribir sobre el archivo de salida
    */
    public void Write(String token) throws IOException{
        this.writer.write(token);
    }

    /**
    * Cierra el archivo y agrega etiquetas de cierre HTML
    */
    public void CloseFileWritter() throws IOException{
        this.Write("</body>\n" + "</html>\n");
        this.writer.close();
    }

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

"<!DOCTYPE article>" { return new Symbol(sym.EncabezadoXML, yychar, yyline, yytext());}
"<article>" {return new Symbol(sym.AperturaArticulo, yychar, yyline, yytext());}
"</article>" {return new Symbol(sym.CierreArticulo, yychar, yyline, yytext());}
"<date>" {
    if(this.isInfo == true){
        this.Write("<p>");
    }
    return new Symbol(sym.AperturaDate, yychar, yyline, yytext());}
"</date>" {
    if(this.isInfo == true){
        this.Write("<p>"+"\n");
    }
    return new Symbol(sym.CierreDate, yychar, yyline, yytext());}
"<title>" { 
    if(this.isInfo == true){
        this.Write("<p>");
    }else if(this.isSection == true){
        this.Write("<h2>");
    }else{
        this.Write("<h1>");
    }
    return new Symbol(sym.AperturaTitulo, yychar, yyline, yytext());}
"</title>" {
    if(this.isInfo == true){
        this.Write("</p>"+"\n");
    }else if(this.isSection == true){
        this.Write("</h2>"+"\n");
    }else{
        this.Write("</h1>"+"\n");
    }
    return new Symbol(sym.CierreTitulo, yychar, yyline, yytext());}
"<info>" {
    this.isInfo = true;
    this.Write("<div style='background-color: green; color: white; font-size: 8px;'>"+"\n");
    return new Symbol(sym.AperturaInfo, yychar, yyline, yytext());}
"</info>" {
    this.isInfo = false;
    this.Write("</div>"+"\n");
    return new Symbol(sym.CierreInfo, yychar, yyline, yytext());}
"<itemizedlist>" {
    this.Write("<ul>"+"\n");
    return new Symbol(sym.AperturaItemizedList, yychar, yyline, yytext());}
"</itemizedlist>" {
    this.Write("</ul>"+"\n");
    return new Symbol(sym.CierreItemizedList, yychar, yyline, yytext());}
"<important>" {
    this.Write("<div style='background-color: red; color: white;'>");
    return new Symbol(sym.AperturaImportant, yychar, yyline, yytext());}
"</important>" {
    this.Write("</div>"+"\n");
    return new Symbol(sym.CierreImportant, yychar, yyline, yytext());}
"<para>" {
    this.Write("<p>");
    return new Symbol(sym.AperturaPara, yychar, yyline, yytext());}
"</para>" {
    this.Write("</p>"+"\n");
    return new Symbol(sym.CierrePara, yychar, yyline, yytext());}
"<simpara>" {
    this.Write("<p>");
    return new Symbol(sym.AperturaSimPara, yychar, yyline, yytext());}
"</simpara>" {
    this.Write("</p>"+"\n");
    return new Symbol(sym.CierreSimPara, yychar, yyline, yytext());}
"<address>" {
    if(this.isInfo == true){
        this.Write("<p>");
    }
    return new Symbol(sym.AperturaAddress, yychar, yyline, yytext());}
"</address>" {
    if(this.isInfo == true){
        this.Write("</p>"+"\n");
    }
    return new Symbol(sym.CierreAddress, yychar, yyline, yytext());}
"<mediaobject>" {
    if(this.isInfo == true){
        this.Write("<p>");
    }
    return new Symbol(sym.AperturaMediaObject, yychar, yyline, yytext());}
"</mediaobject>" {
    if(this.isInfo == true){
        this.Write("</p>"+"\n");
    }
    return new Symbol(sym.CierreMediaObject, yychar, yyline, yytext());}
"<informaltable>" {return new Symbol(sym.AperturaInformalTable, yychar, yyline, yytext());}
"</informaltable>" {return new Symbol(sym.CierreInformalTable, yychar, yyline, yytext());}
"<comment>" {return new Symbol(sym.AperturaComment, yychar, yyline, yytext());}
"</comment>" {return new Symbol(sym.CierreComment, yychar, yyline, yytext());}
"<abstract>" {
    if(this.isInfo == true){
        this.Write("<p>");
    }
    return new Symbol(sym.AperturaAbstract, yychar, yyline, yytext());}
"</abstract>" {
    if(this.isInfo == true){
        this.Write("</p>"+"\n");
    }
    return new Symbol(sym.CierreAbstract, yychar, yyline, yytext());}
"<simplesect>" {
    this.isSection = true;
    return new Symbol(sym.AperturaSimpleSect, yychar, yyline, yytext());}
"</simplesect>" {
    this.isSection = false;
    return new Symbol(sym.CierreSimpleSect, yychar, yyline, yytext());}
"<section>" {
    this.isSection = true;
    return new Symbol(sym.AperturaSection, yychar, yyline, yytext());}
"</section>" {
    this.isSection = false;
    return new Symbol(sym.CierreSection, yychar, yyline, yytext());}
"<author>" {
    if(this.isInfo == true){
        this.Write("<p>");
    }
    return new Symbol(sym.AperturaAuthor, yychar, yyline, yytext());}
"</author>" {
    if(this.isInfo == true){
        this.Write("</p>"+"\n");
    }
    return new Symbol(sym.CierreAuthor, yychar, yyline, yytext());}
"<copyright>" {
    if(this.isInfo == true){
        this.Write("<p>");
    }
    return new Symbol(sym.AperturaCopyright, yychar, yyline, yytext());}
"</copyright>" {
    if(this.isInfo == true){
        this.Write("</p>"+"\n");
    }
    return new Symbol(sym.CierreCopyright, yychar, yyline, yytext());}
"<street>" {
     if(this.isInfo == true){
        this.Write("<p>");
    }
    return new Symbol(sym.AperturaStreet, yychar, yyline, yytext());}
"</street>" {
    if(this.isInfo == true){
        this.Write("</p>"+"\n");
    }
    return new Symbol(sym.CierreStreet, yychar, yyline, yytext());}
"<city>" {
    if(this.isInfo == true){
        this.Write("<p>");
    }
    return new Symbol(sym.AperturaCity, yychar, yyline, yytext());}
"</city>" {
    if(this.isInfo == true){
       this.Write("</p>"+"\n");
    }
    return new Symbol(sym.CierreCity, yychar, yyline, yytext());}
"<state>" {
    if(this.isInfo == true){
        this.Write("<p>");
    }
    return new Symbol(sym.AperturaState, yychar, yyline, yytext());}
"</state>" {
    if(this.isInfo == true){
       this.Write("</p>"+"\n");
    }
    return new Symbol(sym.CierreState, yychar, yyline, yytext());}
"<phone>" {
    if(this.isInfo == true){
        this.Write("<p>");
    }
    return new Symbol(sym.AperturaPhone, yychar, yyline, yytext());}
"</phone>" {
    if(this.isInfo == true){
        this.Write("</p>"+"\n");
    }
    return new Symbol(sym.CierrePhone, yychar, yyline, yytext());}
"<email>" {
    if(this.isInfo == true){
        this.Write("<p>");
    }
    return new Symbol(sym.AperturaEmail, yychar, yyline, yytext());}
"</email>" {
    if(this.isInfo == true){
       this.Write("</p>"+"\n");
    }
    return new Symbol(sym.CierreEmail, yychar, yyline, yytext());}
"<firstname>" {
    if(this.isInfo == true){
        this.Write("<p>");
    }
    return new Symbol(sym.AperturaFirstName, yychar, yyline, yytext());}
"</firstname>" {
    if(this.isInfo == true){
        this.Write("</p>"+"\n");
    }
    return new Symbol(sym.CierreFirstName, yychar, yyline, yytext());}
"<surname>" {
    if(this.isInfo == true){
        this.Write("<p>");
    }
    return new Symbol(sym.AperturaSurname, yychar, yyline, yytext());}
"</surname>" {
    if(this.isInfo == true){
        this.Write("</p>"+"\n");
    }
    return new Symbol(sym.CierreSurname, yychar, yyline, yytext());}
"<year>" {
    if(this.isInfo == true){
        this.Write("<p>");
    }
    return new Symbol(sym.AperturaYear, yychar, yyline, yytext());}
"</year>" {
    if(this.isInfo == true){
        this.Write("</p>"+"\n");
    }
    return new Symbol(sym.CierreYear, yychar, yyline, yytext());}
"<holder>" {
    if(this.isInfo == true){
        this.Write("<p>");
    }
    return new Symbol(sym.AperturaHolder, yychar, yyline, yytext());}
"</holder>" {
    if(this.isInfo == true){
        this.Write("</p>"+"\n");
    }
    return new Symbol(sym.CierreHolder, yychar, yyline, yytext());}
"<emphasis>" {
     if(this.isInfo == true){
        this.Write("<p>");
    }
    return new Symbol(sym.AperturaEmphasis, yychar, yyline, yytext());}
"</emphasis>" {
    if(this.isInfo == true){
        this.Write("</p>"+"\n");
    }
    return new Symbol(sym.CierreEmphasis, yychar, yyline, yytext());}
"<comment>" {return new Symbol(sym.AperturaComment, yychar, yyline, yytext());}
"</comment>" {return new Symbol(sym.CierreComment, yychar, yyline, yytext());}
"<tgroup>" {
    this.Write("<table>"+"\n");
    return new Symbol(sym.AperturaTgroup, yychar, yyline, yytext());}
"</tgroup>" {
    this.Write("</table>"+"\n");
    return new Symbol(sym.CierreTgroup, yychar, yyline, yytext());}
"<thead>" {
    this.Write(yytext()+"\n");
    return new Symbol(sym.AperturaThead, yychar, yyline, yytext());}
"</thead>" {
    this.Write(yytext()+"\n");
    return new Symbol(sym.CierreThead, yychar, yyline, yytext());}
"<tfoot>" {
    this.Write(yytext()+"\n");
    return new Symbol(sym.AperturaTfoot, yychar, yyline, yytext());}
"</tfoot>" {
    this.Write(yytext()+"\n");
    return new Symbol(sym.CierreTfoot, yychar, yyline, yytext());}
"<tbody>" {
    this.Write(yytext()+"\n");
    return new Symbol(sym.AperturaTbody, yychar, yyline, yytext());}
"</tbody>" {
    this.Write(yytext()+"\n");
    return new Symbol(sym.CierreTbody, yychar, yyline, yytext());}
"<row>" {
    this.Write("<tr>");
    return new Symbol(sym.AperturaRow, yychar, yyline, yytext());}
"</row>" {
    this.Write("</tr>"+"\n");
    return new Symbol(sym.CierreRow, yychar, yyline, yytext());}
"<entry>" {
    this.Write("<td>");
    return new Symbol(sym.AperturaEntry, yychar, yyline, yytext());}
"</entry>" {
    this.Write("</td>");
    return new Symbol(sym.CierreEntry, yychar, yyline, yytext());}
"<entrytbl>" {
    this.Write("<td>");
    return new Symbol(sym.AperturaEntrytbl, yychar, yyline, yytext());}
"</entrytbl>" {
    this.Write("</td>");
    return new Symbol(sym.CierreEntrytbl, yychar, yyline, yytext());}
"<videoobject>" {
    return new Symbol(sym.AperturaVideoobject, yychar, yyline, yytext());}
"</videoobject>" {return new Symbol(sym.CierreVideoobject, yychar, yyline, yytext());}
"<imageobject>" {return new Symbol(sym.AperturaImageobject, yychar, yyline, yytext());}
"</imageobject>" {return new Symbol(sym.CierreImageobject, yychar, yyline, yytext());}
"<listitem>" {
    this.Write("<li>");
    return new Symbol(sym.AperturaListItem, yychar, yyline, yytext());}
"</listitem>" {
    this.Write("</li>"+"\n");
    return new Symbol(sym.CierreListItem, yychar, yyline, yytext());}
"<link xlink:href:"\" {
    System.out.print(yytext());
    this.Write("<a href=\"");
    return new Symbol(sym.AperturaLink, yychar, yyline, yytext());}
{LinkUrl} {
        this.Write(yytext());
        return new Symbol(sym.Url, yychar, yyline, yytext());}
"</link>" {
    this.Write("</a>"+"\n");
    return new Symbol(sym.CierreLink, yychar, yyline, yytext());}
{videodata} {return new Symbol(sym.Videodata, yychar, yyline, yytext());}
{imagedata} {return new Symbol(sym.Imagedata, yychar, yyline, yytext());}
{espacio} {/*IGNORE*/}
({texto}|{espacio}|{signos})* {
    this.Write(yytext());
    return new Symbol(sym.Texto, yychar, yyline, yytext());}
 . {/*IGNORE*/}
