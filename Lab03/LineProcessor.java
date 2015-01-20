/**
 * LineProcessor: Processes Each Line in Assembly File
 * October 15, 2014
 *
 * @author Tyler Mau
 * @version 1.0
 */

public class LineProcessor {
   
   /* Line Types: Comment, Label, Label w/Instruction, Instruction */
   private String type, fullLine, line, instr, label;
   
   public LineProcessor() {
   }
   
   public LineProcessor(String line) {
      this.fullLine = new String(line);
      instr = null;
      determineType(line);
   }
   
   public String removeComment() {
      return line;
   }
   
   /* Returns null if no instruction in line */
   public String getInstruction() {
      return instr;
   }
   
   public String getLabel() {
      return label;
   }
   
   public String getFullLine() {
      return fullLine;
   }
   
   public String getType() {
      return type;
   }
   
   private void determineType(String newLine) {
      int index;
      boolean comment = false;
      
      type = new String("Unknown");
      
      newLine = newLine.trim();
      
      /* Determines if line is a comment */
      if (newLine.charAt(0) == '#') {
         type = new String("Comment");
         line = null;
         comment = true;
      }
      /* Determines if line contains a comment */
      else if (newLine.contains("#")) {
         index = newLine.indexOf('#');
         line = newLine.substring(0, index);
         line = line.trim();
         comment = true;
      }
      else {
         line = new String(newLine);
         line = line.trim();
      }

      /* If line is a comment */
      if (line != null) {
         /* Determines if line contains a label */
         if (line.contains(":")) {
            /* If line only contains label */
            if (line.indexOf(":") == line.length() - 1) {
               type = new String("Label");
               index = line.indexOf(":");
               label = line.substring(0, index).trim();
            }
            /* If line contains label and instruction */
            else {
               type = new String("Label w/Instruction");
               index = line.indexOf(":");
               instr = line.substring(index + 1, line.length());
               instr = instr.trim();
               label = line.substring(0, index).trim();
            }
         }
         /* Otherwise, line must be an instruction */
         else {
            type = new String("Instruction");
            instr = line;
         }
      }
   }
}