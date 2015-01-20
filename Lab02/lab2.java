/**
 * Assembler (Lab 2)
 * October 15, 2014
 *
 * @author Tyler Mau
 * @version 1.0
 */

import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.io.PrintStream;

public class lab2 {
   public static void main(String[] args) {
      int addr = -1, index;
      LineProcessor lp;
      Instruction instr;
      Label label;
      String line, machineCode;
      ArrayList<Label> labels = new ArrayList<Label>();
      ArrayList<Instruction> instructs = new ArrayList<Instruction>();
      Converter converter;
      PrintStream file;

      try {
         file = new PrintStream(System.out);

         Scanner scanner = new Scanner(new File(args[0]));

         while (scanner.hasNextLine()) {
            line = scanner.nextLine();

            /* Don't process blank lines */
            if (line.trim().length() != 0) {
               lp = new LineProcessor(line);

               /* Don't count comments as addresses */
               if (!lp.getType().equals("Comment")) {
                  addr++;
               }

               /* Create label with address */
               if (lp.getType().equals("Label")) {
                  label = new Label(lp.getLabel(), addr);
                  labels.add(label);
                  addr--;
               }
               /* Create instruction with address */
               else if (lp.getInstruction() != null) {
                  if (lp.getType().equals("Label w/Instruction")) {
                     label = new Label(lp.getLabel(), addr);
                     labels.add(label);
                  }

                  instr = new Instruction(lp.getInstruction(), addr);
                  instructs.add(instr);

               }
               /* Do nothing for other cases such as comments and blank lines */
               else {
               }
            }
         }

         converter = new Converter(labels);

         for (int i = 0; i < instructs.size(); i++) {
            machineCode = new String(converter.convert(instructs.get(i)));
            file.println(machineCode);
            //System.out.println(machineCode);
         }
         //file.close();
         //System.out.println();
      }
      catch(FileNotFoundException e) {
         System.err.println("Error: File Not Found");
      }

   }
}
