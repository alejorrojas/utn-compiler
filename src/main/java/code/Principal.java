
package code;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;


/**
 * Invoca y genera las clases por default de las librerias 
 */
public class Principal {

 public static void main(String[] args) throws Exception {
        //Ruta del lexer
        String rutaLexer = "C:/Users/alejo/Desktop/proyectos/utn/utn-parser/src/main/java/code/lexerCup.flex";
        //Ruta del parser
        String[] rutaSintaxis = {"-parser", "Sintax", "C:/Users/alejo/Desktop/proyectos/utn/utn-parser/src/main/java/code/sintaxis.cup"};

        generarLexerParser(rutaLexer, rutaSintaxis);
    }
    
    /**
    * Llama y genera los archivos correspondientes a las librerias JCUP y JFLEX 
    * Mueve los archivos generados al package de desarrollo code
    * @param pathLexer  Ruta del lexer
    * @param pathSintaxis  Ruta del parser
     *@throws java.io.IOException
    */
    public static void generarLexerParser(String pathLexer, String[] pathSintaxis) throws IOException, Exception{
        File archivoLexer = new File(pathLexer);
        JFlex.Main.generate(archivoLexer);
        java_cup.Main.main(pathSintaxis);
        
        //Mueve el archivo sym.java dentro del package de desarrollo code
        Path rutaSym = Paths.get("C:/Users/alejo/Desktop/proyectos/utn/utn-parser/src/main/java/code/sym.java");
             if (Files.exists(rutaSym)) {
            Files.delete(rutaSym);
        }
        Files.move(
                Paths.get("C:/Users/alejo/Desktop/proyectos/utn/utn-parser/sym.java"), 
                Paths.get("C:/Users/alejo/Desktop/proyectos/utn/utn-parser/src/main/java/code/sym.java")
        );
        
        //Mueve el archivo Sintax.java dentro del package de desarrollo code
        Path rutaSin = Paths.get("C:/Users/alejo/Desktop/proyectos/utn/utn-parser/src/main/java/code/Sintax.java");
        if (Files.exists(rutaSin)) {
            Files.delete(rutaSin);
        }
        Files.move(
                Paths.get("C:/Users/alejo/Desktop/proyectos/utn/utn-parser/Sintax.java"), 
                Paths.get("C:/Users/alejo/Desktop/proyectos/utn/utn-parser/src/main/java/code/Sintax.java")
        );
 
    }
}