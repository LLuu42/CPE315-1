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
import java.io.FileWriter;

public class Assembler {
   
   private ArrayList<Label> labels;
   private ArrayList<Instruction> instructs;
   
   public Assembler(String[] args) {
      int addr = -1;
      LineProcessor lp;
      Instruction instr;
      Label label;
      String line;
      labels = new ArrayList<Label>();
      instructs = new ArrayList<Instruction>();
      
      try {
         
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
      }
      catch(FileNotFoundException e) {
         System.err.println("Error: File Not Found");
      }
   }
   
   public ArrayList<Label> getLabelList() {
      return labels;
   }
   
   public ArrayList<Instruction> getInstrList() {
      return instructs;
   }
}