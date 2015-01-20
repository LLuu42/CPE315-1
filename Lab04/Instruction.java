/**
 * Instruction: Instruction Class
 * October 15, 2014
 *
 * @author Tyler Mau
 * @version 1.0
 */

import java.lang.Math;
import java.util.ArrayList;

public class Instruction {

   private String fullLine, instr, label;
   private int opcode, rs, rt, rd, shamt, funct, imm, addr, labAddr;
   private char type;
   
   public Instruction () {
   }
   
   public Instruction (String line, int addr) {
      String args;
   
      this.addr = addr;
      shamt = 0;
      imm = 0;
      
      args = parseInstr(line);
      instrInfo();
      
      if (type == 'R') {
         parseR(args);
      }
      else if (type == 'I') {
         parseI(args);
      }
      else if (type == 'J') {
         parseJ(args);
      }
      else {
         
      }
   }
   
   private String parseInstr(String line) {
      int index;
      
      if (line.contains("$")) {
         index = line.indexOf('$');
         instr = line.substring(0, index).trim();
         return line.substring(index + 1, line.length()).trim();
      }
      else {
         index = line.indexOf(' ');
         instr = line.substring(0, index).trim();
         return line.substring(index, line.length()).trim();
      }
   }
   
   private void instrInfo() {
      
      if (instr.equals("and")) {
         opcode = 0x00;
         type = 'R';
         funct = 0x24;
      }
      else if (instr.equals("or")) {
         opcode = 0x00;
         type = 'R';
         funct = 0x25;
      }
      else if (instr.equals("add")) {
         opcode = 0x00;
         type = 'R';
         funct = 0x20;
      }
      else if (instr.equals("addi")) {
         opcode = 0x08;
         type = 'I';
         funct = -1;
      }
      else if (instr.equals("sll")) {
         opcode = 0x00;
         type = 'R';
         funct = 0x00;
      }
      else if (instr.equals("sub")) {
         opcode = 0x00;
         type = 'R';
         funct = 0x22;
      }
      else if (instr.equals("slt")) {
         opcode = 0x00;
         type = 'R';
         funct = 0x2A;
      }
      else if (instr.equals("beq")) {
         opcode = 0x04;
         type = 'I';
         funct = -1;
      }
      else if (instr.equals("bne")) {
         opcode = 0x05;
         type = 'I';
         funct = -1;
      }
      else if (instr.equals("lw")) {
         opcode = 0x23;
         type = 'I';
         funct = -1;
      }
      else if (instr.equals("sw")) {
         opcode = 0x2B;
         type = 'I';
         funct =-1;
      }
      else if (instr.equals("j")) {
         opcode = 0x02;
         type = 'J';
         funct = -1;
      }
      else if (instr.equals("jr")) {
         opcode = 0x00;
         type = 'R';
         funct = 0x08;
      }
      else if (instr.equals("jal")) {
         opcode = 0x03;
         type = 'J';
         funct = -1;
      }
      else {
         type = 'L';
      }
   }
   
   /* Register in form 't0' */
   private int registerInfo(String register) {
      int reg;
      
      if (register.equals("0") || register.equals("zero")) {
         reg = 0;
      }
      else if (register.charAt(0) == 'v') {
         reg = 2 + (register.charAt(1) - 48);
      }
      else if (register.charAt(0) == 'a') {
         reg = 4 + (register.charAt(1) - 48);
      }
      else if (register.charAt(0) == 's') {
         if (register.charAt(1) == 'p') {
            reg = 29;
         }
         else {
            reg = 16 + (register.charAt(1) - 48);
         }
      }
      else if (register.charAt(0) == 't') {
         if (register.charAt(1) >= '8') {
            reg = 25 - (9 - (register.charAt(1) - 48));
         }
         else {
            reg = 8 + (register.charAt(1) - 48);
         }
      }
      else if (register.equals("ra")) {
         reg = 31;
      }
      else {
         /* If this point is reached, register is invalid */
         reg = -1;
      }
      
      return reg;
   }
   
   private void parseR(String args) {
      int index1, index2;
      String reg;
      
      if (instr.equals("jr")) {
         /* Get value for jump register */
         rs = registerInfo(args);
      }
      else if (instr.equals("sll")) {
         rs = 0;
         
         /* Get value for rd */
         index1 = args.indexOf(',');
         reg = args.substring(0, index1);
         rd = registerInfo(reg);
         args = args.substring(index1 + 1, args.length()).trim();
         
         /* Get value for rt */
         index1 = args.indexOf('$');
         index2 = args.indexOf(',');
         reg = args.substring(index1 + 1, index2);
         rt = registerInfo(reg);
         args = args.substring(index2 + 1, args.length()).trim();
         
         /* Get value for shift */
         index1 = args.indexOf('$');
         reg = args.substring(index1 + 1, args.length()).trim();
         shamt = reg.charAt(0) - 48;
         
      }
      else {
         /* Get value for rd */
         index1 = args.indexOf(',');
         reg = args.substring(0, index1);
         rd = registerInfo(reg);
         args = args.substring(index1 + 1, args.length()).trim();
         
         /* Get value for rs */
         index1 = args.indexOf('$');
         index2 = args.indexOf(',');
         reg = args.substring(index1 + 1, index2);
         rs = registerInfo(reg);
         args = args.substring(index2 + 1, args.length()).trim();
         
         /* Get value for rt */
         index1 = args.indexOf('$');
         reg = args.substring(index1 + 1, args.length()).trim();
         rt = registerInfo(reg);
         
      }
   }
   
   private void parseI(String args) {
      int index1, index2, i, j = 0, neg = 1, offset = 0;
      String reg;
      
      if (instr.equals("bne") || instr.equals("beq")) {
         /* Get value for rs */
         index1 = args.indexOf(',');
         reg = args.substring(0, index1);
         rs = registerInfo(reg);
         args = args.substring(index1 + 1, args.length()).trim();
         
         /* Get value for rt */
         index1 = args.indexOf('$');
         index2 = args.indexOf(',');
         reg = args.substring(index1 + 1, index2);
         rt = registerInfo(reg);
         args = args.substring(index2 + 1, args.length()).trim();
         
         /* Can't determine address of labels until second pass */
         labAddr = addr;
         label = args.trim();
      }
      else if (instr.equals("lw") || instr.equals("sw")) {
         /* Get value for rt */
         index1 = args.indexOf(',');
         reg = args.substring(0, index1);
         rt = registerInfo(reg);
         args = args.substring(index1 + 1, args.length()).trim();
         
         index1 = args.indexOf('(');
         reg = args.substring(0, index1);
         
         if (reg.charAt(0) == '-') {
            neg = -1;
            reg = reg.substring(1, reg.length());
         }
         
         for (i = reg.length() - 1; i >= 0; i--, j++) {
            labAddr += Math.pow((double)10, (double)i) * (reg.charAt(j) - 48);
         }
         labAddr *= neg;
         
         /* Get value for rs */
         index2 = args.indexOf(')');
         reg = args.substring(index1 + 2, index2).trim();
         rs = registerInfo(reg);
      }
      else {
         /* Get value for rt */
         index1 = args.indexOf(',');
         reg = args.substring(0, index1);
         rt = registerInfo(reg);
         args = args.substring(index1 + 1, args.length()).trim();
         
         /* Get value for rs */
         index1 = args.indexOf('$');
         index2 = args.indexOf(',');
         reg = args.substring(index1 + 1, index2);
         rs = registerInfo(reg);
         args = args.substring(index2 + 1, args.length()).trim();
         
         /* Get value for imm */
         index1 = args.indexOf('$');
         reg = args.substring(index1 + 1, args.length()).trim();
         
         if (reg.charAt(0) == '-') {
            neg = -1;
            reg = reg.substring(1, reg.length());
         }
         
         for (i = reg.length() - 1; i >= 0; i--, j++) {
            imm += Math.pow((double)10, (double)i) * (reg.charAt(j) - 48);
         }
         imm *= neg;
      }
   }
   
   private void parseJ(String args) {
      labAddr = 0;
      label = args.trim();
   }
   
   public void setLabAddr(int addr) {
      this.labAddr = addr;
   }
   
   public String getInstr() {
      return instr;
   }
   
   public char getType() {
      return type;
   }
   
   public int getOpcode() {
      return opcode;
   }
   
   public int getRS() {
      return rs;
   }
   
   public int getRT() {
      return rt;
   }
   
   public int getRD() {
      return rd;
   }
   
   public int getShamt() {
      return shamt;
   }
   
   public int getFunct() {
      return funct;
   }
   
   public int getImm() {
      return imm;
   }
   
   public int getAddr() {
      return addr;
   }
   
   public int getLabAddr() {
      return labAddr;
   }
   
   public String getLabel() {
      return label;
   }
}