
package code;
import java.io.File;

/**
 *
 * @author alejo
 */
public class Principal {

    public static void main(String[] args) {
        String ruta = "C:/Users/alejo/Desktop/proyectos/utn/neatbeans-lexer/src/main/java/code/lexer.flex";
        generarLexer(ruta);
    }
    public static void generarLexer(String ruta){
        File archivo = new File(ruta);
        JFlex.Main.generate(archivo);
    }
}