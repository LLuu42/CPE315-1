/**
 * Converter: Converts Instructions to Machine Code
 * October 15, 2014
 *
 * @author Tyler Mau
 * @version 1.0
 */

import java.util.ArrayList;

public class Converter {
   
   private ArrayList<Label> labels;

   public Converter () {
   }

   public Converter (ArrayList<Label> labels) {
      this.labels = new ArrayList<Label>(labels);
   }
   
   public String convert(Instruction instr) {
      int addr = 0;
      String machineCode = new String();
      //System.out.println(instr.getInstr());
                         
      if (instr.getType() == 'R') {
         machineCode = new String(convertR(instr));
      }
      else if (instr.getType() == 'I') {
         machineCode = new String(convertI(instr));
      }
      else if (instr.getType() == 'J') {
         machineCode = new String(convertJ(instr));
      }
      else {
      }
      return machineCode;
   }
   
   private String convertR(Instruction instr) {
      String machineCode;
      
      if (instr.getInstr().equals("jr")) {
         //System.out.println(instr.getOpcode() + " " + instr.getRS() + " 0 " + instr.getFunct());
         machineCode = new String(opcodeToBin(instr.getOpcode()) + " " +
                                  regToBin(instr.getRS()) + " 000000000000000 " +
                                  functToBin(instr.getFunct()));
      }
      else {
         //System.out.println(instr.getOpcode() + " " + instr.getRS() + " " + instr.getRT() + " " + instr.getRD() + " " + instr.getShamt() + " " + instr.getFunct());
         machineCode = new String(opcodeToBin(instr.getOpcode()) + " " +
                                  regToBin(instr.getRS()) + " " +
                                  regToBin(instr.getRT()) + " " +
                                  regToBin(instr.getRD()) + " " +
                                  regToBin(instr.getShamt()) + " " +
                                  functToBin(instr.getFunct()));
      }
      return machineCode;
   }
   
   private String convertI(Instruction instr) {
      int addr = 0;
      String machineCode;
      
      if (instr.getInstr().equals("bne") || instr.getInstr().equals("beq")) {
         for (int i = 0; i < labels.size(); i++) {
            if (labels.get(i).getLabel().equals(instr.getLabel())) {
               addr = labels.get(i).getAddr() - instr.getAddr();
               addr--;
               instr.setLabAddr(addr);
            }
         }
         //System.out.println(instr.getOpcode() + " " + instr.getRS() + " " + instr.getRT() + " " + instr.getLabAddr());
         machineCode = new String(opcodeToBin(instr.getOpcode()) + " " +
                                  regToBin(instr.getRS()) + " " +
                                  regToBin(instr.getRT()) + " " +
                                  labAddrToBin(instr.getLabAddr()));
      }
      else if (instr.getInstr().equals("lw") || instr.getInstr().equals("sw")) {
         //System.out.println(instr.getOpcode() + " " + instr.getRS() + " " + instr.getRT() + " " + instr.getLabAddr());
         machineCode = new String(opcodeToBin(instr.getOpcode()) + " " +
                                  regToBin(instr.getRS()) + " " +
                                  regToBin(instr.getRT()) + " " +
                                  labAddrToBin(instr.getLabAddr()));
      }
      else {
         //System.out.println(instr.getOpcode() + " " + instr.getRS() + " " + instr.getRT() + " " + instr.getImm());
         machineCode = new String(opcodeToBin(instr.getOpcode()) + " " +
                                  regToBin(instr.getRS()) + " " +
                                  regToBin(instr.getRT()) + " " +
                                  labAddrToBin(instr.getImm()));
      }
      return machineCode;
   }
   
   private String convertJ(Instruction instr) {
      int addr = 0;
      String machineCode;
      
      for (int i = 0; i < labels.size(); i++) {
         if (labels.get(i).getLabel().equals(instr.getLabel())) {
            addr = labels.get(i).getAddr();
            instr.setLabAddr(addr);
         }
      }
      //System.out.println(instr.getOpcode() + " " + instr.getLabAddr());
      machineCode = new String(opcodeToBin(instr.getOpcode()) + " " +
                               jAddrToBin(instr.getLabAddr()));
      return machineCode;
   }
   
   private String opcodeToBin(int opcode) {
      return String.format("%6s", Integer.toBinaryString(opcode)).replace(' ', '0');
   }
   
   private String regToBin(int reg) {
      return String.format("%5s", Integer.toBinaryString(reg)).replace(' ', '0');
   }
   
   private String functToBin(int funct) {
      return String.format("%6s", Integer.toBinaryString(funct)).replace(' ', '0');
   }
   
   private String labAddrToBin(int addr) {
      if (addr < 0) {
         return String.format("%16s", Integer.toBinaryString(addr)).replace(' ', '0').substring(16, 32);
      }
      else {
         return String.format("%16s", Integer.toBinaryString(addr)).replace(' ', '0');
      }
   }
   
   private String jAddrToBin(int addr) {
      return String.format("%26s", Integer.toBinaryString(addr)).replace(' ', '0');
   }
}