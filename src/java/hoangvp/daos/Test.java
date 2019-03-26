/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangvp.daos;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Danze
 */
public class Test {
    public static void main(String[] args) {
        try {
            File dir = new File("flags");
            String name;
            if (dir.isDirectory()) {
                for (File f : dir.listFiles()) {
                    name = "";
                    for (int i = 0; i < f.getName().length() - 4; i++) {
                        name += f.getName().toUpperCase().charAt(i);
                    }
                    Files.copy(f.toPath(), new File("flag/" + name + ".png").toPath(), StandardCopyOption.REPLACE_EXISTING);
                }
            }
        } catch (IOException ex) {
            Logger.getLogger(Test.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
