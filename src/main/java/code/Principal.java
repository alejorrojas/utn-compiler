
package code;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;


/**
 *
 * @author alejo
 */
public class Principal {

 public static void main(String[] args) throws Exception {
        String rutaLexer = "C:/Users/alejo/Desktop/proyectos/utn/utn-parser/src/main/java/code/lexerCup.flex";
        String[] rutaSintaxis = {"-parser", "Sintax", "C:/Users/alejo/Desktop/proyectos/utn/utn-parser/src/main/java/code/sintaxis.cup"};
        
        generarLexerParser(rutaLexer, rutaSintaxis);
    }
    public static void generarLexerParser(String pathLexer, String[] pathSintaxis) throws IOException, Exception{
        File archivoLexer = new File(pathLexer);
        JFlex.Main.generate(archivoLexer);
        java_cup.Main.main(pathSintaxis);
        
        Path rutaSym = Paths.get("C:/Users/alejo/Desktop/proyectos/utn/utn-parser/src/main/java/code/sym.java");
        if (Files.exists(rutaSym)) {
            Files.delete(rutaSym);
        }
        Files.move(
                Paths.get("C:/Users/alejo/Desktop/proyectos/utn/utn-parser/sym.java"), 
                Paths.get("C:/Users/alejo/Desktop/proyectos/utn/utn-parser/src/main/java/code/sym.java")
        );
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