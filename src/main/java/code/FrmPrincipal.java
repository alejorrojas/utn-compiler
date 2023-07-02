package code;

import java.awt.Color;
import java.io.File;
import java.io.IOException;
import java.io.StringReader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.logging.Level;
import java.util.logging.Logger;
import java_cup.runtime.Symbol;
import javax.swing.JFileChooser;

/**
 *
 * @author alejo
 */
public class FrmPrincipal extends javax.swing.JFrame {

    /**
     * Creates new form FrmPrincipal
     */
    public FrmPrincipal() {
        initComponents();
        this.setLocationRelativeTo(null);
        this.getContentPane().setBackground(Color.darkGray);
        //Si existe un HTML previo, lo borra para que no se sobreescriba uno existente
        resetHTML();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        btnAnalizar = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        textoResultado = new javax.swing.JTextArea();
        btnReset = new javax.swing.JButton();
        jScrollPane2 = new javax.swing.JScrollPane();
        textoToAnalize = new javax.swing.JTextArea();
        btnAbrirArchivo = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setBackground(new java.awt.Color(51, 51, 51));
        setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));

        btnAnalizar.setBackground(new java.awt.Color(33, 35, 36));
        btnAnalizar.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        btnAnalizar.setForeground(new java.awt.Color(255, 255, 255));
        btnAnalizar.setText("Analizar");
        btnAnalizar.setToolTipText("");
        btnAnalizar.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(107, 107, 107)));
        btnAnalizar.setBorderPainted(false);
        btnAnalizar.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnAnalizar.setFocusPainted(false);
        btnAnalizar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAnalizarActionPerformed(evt);
            }
        });

        textoResultado.setEditable(false);
        textoResultado.setBackground(new java.awt.Color(43, 43, 43));
        textoResultado.setColumns(20);
        textoResultado.setFont(new java.awt.Font("Segoe UI", 0, 18)); // NOI18N
        textoResultado.setRows(5);
        textoResultado.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        textoResultado.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        textoResultado.setFocusable(false);
        textoResultado.setMargin(new java.awt.Insets(6, 6, 6, 6));
        jScrollPane1.setViewportView(textoResultado);

        btnReset.setBackground(new java.awt.Color(33, 35, 36));
        btnReset.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        btnReset.setForeground(new java.awt.Color(255, 255, 255));
        btnReset.setText("Limpiar");
        btnReset.setToolTipText("");
        btnReset.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(107, 107, 107)));
        btnReset.setBorderPainted(false);
        btnReset.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnReset.setFocusPainted(false);
        btnReset.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnResetActionPerformed(evt);
            }
        });

        textoToAnalize.setBackground(new java.awt.Color(43, 43, 43));
        textoToAnalize.setColumns(20);
        textoToAnalize.setFont(new java.awt.Font("Segoe UI", 0, 18)); // NOI18N
        textoToAnalize.setForeground(new java.awt.Color(204, 120, 50));
        textoToAnalize.setRows(5);
        textoToAnalize.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        jScrollPane2.setViewportView(textoToAnalize);

        btnAbrirArchivo.setBackground(new java.awt.Color(33, 35, 36));
        btnAbrirArchivo.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        btnAbrirArchivo.setForeground(new java.awt.Color(255, 255, 255));
        btnAbrirArchivo.setText("Abrir archivo");
        btnAbrirArchivo.setToolTipText("");
        btnAbrirArchivo.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(107, 107, 107)));
        btnAbrirArchivo.setBorderPainted(false);
        btnAbrirArchivo.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnAbrirArchivo.setFocusPainted(false);
        btnAbrirArchivo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAbrirArchivoActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(layout.createSequentialGroup()
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(btnReset, javax.swing.GroupLayout.PREFERRED_SIZE, 81, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(30, 30, 30)
                        .addComponent(jScrollPane2, javax.swing.GroupLayout.DEFAULT_SIZE, 629, Short.MAX_VALUE)
                        .addGap(90, 90, 90)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(btnAnalizar, javax.swing.GroupLayout.PREFERRED_SIZE, 144, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 630, Short.MAX_VALUE))))
                .addGap(127, 127, 127))
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(layout.createSequentialGroup()
                    .addGap(32, 32, 32)
                    .addComponent(btnAbrirArchivo, javax.swing.GroupLayout.PREFERRED_SIZE, 144, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addContainerGap(1330, Short.MAX_VALUE)))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(39, 39, 39)
                .addComponent(btnAnalizar, javax.swing.GroupLayout.PREFERRED_SIZE, 33, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(28, 28, 28)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1)
                    .addComponent(jScrollPane2, javax.swing.GroupLayout.DEFAULT_SIZE, 404, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(btnReset, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(12, 12, 12))
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(layout.createSequentialGroup()
                    .addGap(41, 41, 41)
                    .addComponent(btnAbrirArchivo, javax.swing.GroupLayout.PREFERRED_SIZE, 33, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addContainerGap(489, Short.MAX_VALUE)))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

     /**
     * Si existe un HTML previo, lo borra
     */
    private void resetHTML() {                                         
        //Borramos el HTML existente
        Path outputFilePath = Paths.get("index.html");
        if (Files.exists(outputFilePath)) {
            try {
                Files.delete(outputFilePath);
                System.out.print("HTML eliminado\n");

            } catch (IOException ex) {
                Logger.getLogger(FrmPrincipal.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        else{
             System.out.print("No existía HTML \n");
        }

    }    
    
     /**
     * Manejo del botón 'Analizar'
     * Crea el HTML de salida
     * Crea instancias del lexer y parser
     * Ejecuta el parsing e imprime un mensaje de error/exito
     */
    private void btnAnalizarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAnalizarActionPerformed

       
            //Creamos el archivo de salida
            File outputFile = new File("index.html");

 
            //Inicializamos el lexer y el parser
            Sintax sintax;
            LexerCup lexer;
            lexer = new code.LexerCup(new StringReader(textoToAnalize.getText()));
            sintax = new Sintax(lexer);
            
            try {
                //Ejecutamos el parser
                sintax.parse();
                
                //Mensaje final de exito
                textoResultado.setText("    Analisis exitoso");
                textoResultado.setForeground( new Color(42, 125, 55));


            } catch (Exception ex) {
                 //Si ocurre un error en el parsing, anulamos la creacion del HTML
                
                //Recuperamos el simbolo del error e imprimimos un mensaje
                Symbol symbol = sintax.getSymbol();
                textoResultado.setText("    Error. Linea: " + (symbol.right + 1) + " Columna: " + (symbol.left + 1) + " Texto: \"" + (symbol.value) + "\"" );
                textoResultado.setForeground( new Color(176, 0, 32));
                
               
                
                Logger.getLogger(FrmPrincipal.class.getName()).log(Level.SEVERE, ex.getMessage(), ex);
            }


    }//GEN-LAST:event_btnAnalizarActionPerformed

    /**
     * Manejo del botón 'Limpiar'
     * Setea el texto de analisis y de resultado en vacio
     * Si existe un HTML, lo borra
     */
    private void btnResetActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnResetActionPerformed
        resetHTML();
        textoToAnalize.setText("");
        textoResultado.setText("");
        

    }//GEN-LAST:event_btnResetActionPerformed
    
     /**
     * Manejo del botón 'Abrir Archivo'
     * Contiene la logica del FileChooser
     */
    private void btnAbrirArchivoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAbrirArchivoActionPerformed
       
        JFileChooser chooser = new JFileChooser();
        chooser.showOpenDialog(null);
         File archivo = new File(chooser.getSelectedFile().getAbsolutePath());
         String StringToAnalize;
        try {
            StringToAnalize = new String(Files.readAllBytes(archivo.toPath()));
            textoToAnalize.setText(StringToAnalize);
        } catch (IOException ex) {
            Logger.getLogger(FrmPrincipal.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_btnAbrirArchivoActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(FrmPrincipal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(FrmPrincipal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(FrmPrincipal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(FrmPrincipal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new FrmPrincipal().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAbrirArchivo;
    private javax.swing.JButton btnAnalizar;
    private javax.swing.JButton btnReset;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTextArea textoResultado;
    private javax.swing.JTextArea textoToAnalize;
    // End of variables declaration//GEN-END:variables
}
