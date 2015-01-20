/**
 * Lab 3
 * October 23, 2014
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
import java.io.PrintStream;

public class lab3 {

   public static void main(String args[]) {
      Assembler assembler = new Assembler(args);
      ArrayList<Label> labels = assembler.getLabelList();
      ArrayList<Instruction> instructs = assembler.getInstrList();
      PrintStream ps;
      Scanner scanner;
      Scanner scan;
      String line, fileName;
      char choice;
      boolean quit = false, scriptMode = false;
      int num1, num2, index;

      scanner = new Scanner(System.in);
      ps = new PrintStream(System.out);

      if (args.length > 1) {
         scriptMode = true;

         try {
            fileName = new String(args[0]);
            index = fileName.indexOf('.');
            fileName = fileName.substring(0, index) + ".output";
            ps = new PrintStream(System.out);

            scanner = new Scanner(new File(args[1]));
         }
         catch(FileNotFoundException e) {
            System.err.println("Error: File Not Found");
         }
      }

      Simulator sim = new Simulator(labels, instructs, ps);

      while (!quit) {
         ps.print("mips> ");
         line = scanner.nextLine();
         choice = line.charAt(0);

         if (scriptMode) {
            ps.print(line + "\n");
         }

         switch(choice) {
            case 'h':
               sim.showHelp();
               ps.println();
               break;
            case 'd':
               sim.dumpRegState();
               ps.println();
               break;
            case 's':
               int count;

               if (line.length() > 1) {
                  scan = new Scanner(line);
                  scan.next();
                  count = sim.next(scan.nextInt());
               }
               else {
                  count = sim.next();
               }
               ps.println(String.format("%9d instruction(s) executed", count));
               break;
            case 'r':
               sim.run();
               break;
            case 'm':
               scan = new Scanner(line);
               scan.next();
               num1 = scan.nextInt();
               num2 = scan.nextInt();
               sim.memory(num1, num2);
               ps.println();
               break;
            case 'c':
               sim.clear();
               ps.println("        Simulator reset\n");
               break;
            case 'q':
               quit = true;
               break;
            default:
               System.err.println("Invalid Command: Use 'h' to see valid commands.\n");
               break;
         }
      }
   }
}
