/**
 * Simulator (Lab 3)
 * October 23, 2014
 *
 * @author Tyler Mau
 * @version 1.0
 */

import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;
import java.lang.IllegalAccessException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.io.FileWriter;
import java.lang.reflect.Method;
import java.lang.reflect.InvocationTargetException;
import java.io.PrintStream;

public class Simulator {
   
   private ArrayList<Label> labels;
   private ArrayList<Instruction> instructs;
   private PrintStream stream;
   
   private int pc, totPred, correctPred, ghrNum, ghr, pointLoc;
   private int[] regs = new int[32];
   private int[] mem = new int[8192];
   private int[] predTable = new int[255];
   
   public Simulator(ArrayList<Label> labels, ArrayList<Instruction> instructs, PrintStream ps, int ghrNum) {
      this.labels = new ArrayList<Label>(labels);
      this.instructs = new ArrayList<Instruction>(instructs);
      this.stream = ps;
      this.ghrNum = ghrNum;
      pc = totPred = correctPred = ghr = pointLoc = 0;
      for (int i = 0; i < predTable.length; i++) {
         predTable[i] = 0;
      }
      clear();
   }
   
   public void showHelp() {
      stream.println("\nh = show help" +
                     "\nd = dump register state" +
                     "\ns = single step through the program (i.e. execute 1 instruction and stop)" +
                     "\ns num = step through num instructions of the program" +
                     "\nr = run until the program ends" +
                     "\nm num1 num2 = display data memory from location num1 to num2" +
                     "\nc = clear all registers, memory, and the program counter to 0" +
                     "\no = output a comma separated listing of the x,y coordinates to a file called coordinates.csv" +
                     "\nb = outout the branch predictor accuracy" +
                     "\nq = exit the program");
   }
   
   public void dumpRegState() {
      //FileWriter file = new FileWriter(output);
      String regStates;
      
      regStates = String.format("\npc = %d\n", pc);
      regStates += String.format("$0 = %-11d $v0 = %-10d $v1 = %-10d $a0 = %-10d\n", regs[0], regs[2], regs[3], regs[4]);
      regStates += String.format("$a1 = %-10d $a2 = %-10d $a3 = %-10d $t0 = %-10d\n", regs[5], regs[6], regs[7], regs[8]);
      regStates += String.format("$t1 = %-10d $t2 = %-10d $t3 = %-10d $t4 = %-10d\n", regs[9], regs[10], regs[11], regs[12]);
      regStates += String.format("$t5 = %-10d $t6 = %-10d $t7 = %-10d $s0 = %-10d\n", regs[13], regs[14], regs[15], regs[16]);
      regStates += String.format("$s1 = %-10d $s2 = %-10d $s3 = %-10d $s4 = %-10d\n", regs[17], regs[18], regs[19], regs[20]);
      regStates += String.format("$s5 = %-10d $s6 = %-10d $s7 = %-10d $t8 = %-10d\n", regs[21], regs[22], regs[23], regs[24]);
      regStates += String.format("$t9 = %-10d $sp = %-10d $ra = %-10d", regs[25], regs[29], regs[31]);
      
      stream.println(regStates);

   }
   
   public int next() {
      try {
         Method method = this.getClass().getDeclaredMethod(instructs.get(pc).getInstr());
         
         try {
            method.invoke(this);
         }
         catch(IllegalAccessException e) {
         }
         catch(InvocationTargetException e) {
         }
      }
      catch (NoSuchMethodException e) {
         System.err.println("No Such Method");
      }
      
      return 1;
   }
   
   public int next(int num) {
      int count = 0;
      
      for (int i = 0; i < num; i++) {
         count += next();
      }
      return count;
   }
   
   public void run() {
      while (pc < instructs.size()) {
         next();
      }
   }
   
   public void memory(int num1, int num2) {
      
      for (int i = num1; i <= num2; i++) {
         stream.println(String.format("\n[%d] = %d", i, mem[i]));
      }
      
   }
   
   public void clear() {
      Arrays.fill(regs, 0);
      Arrays.fill(mem, 0);
   }
   
   public int getTotalPredictions() {
      return totPred;
   }
   
   public int getCorrectPredictions() {
      return correctPred;
   }
   
   public double getAccuracy() {
      return ((double)correctPred / (double)totPred) * 100;
   }
   
   private void and() {
      int rd, rs, rt;
      Instruction instr = instructs.get(pc);
      
      rd = instr.getRD();
      rs = instr.getRS();
      rt = instr.getRT();
      regs[rd] = regs[rs] & regs[rt];
      pc++;
   }
   
   private void or() {
      int rd, rs, rt;
      Instruction instr = instructs.get(pc);
      
      rd = instr.getRD();
      rs = instr.getRS();
      rt = instr.getRT();
      regs[rd] = regs[rs] | regs[rt];
      pc++;
   }
   
   private void add() {
      int rd, rs, rt;
      Instruction instr = instructs.get(pc);
      
      rd = instr.getRD();
      rs = instr.getRS();
      rt = instr.getRT();
      regs[rd] = regs[rs] + regs[rt];
      pc++;
   }
   
   private void addi() {
      int rt, rs, imm;
      Instruction instr = instructs.get(pc);
      
      rt = instr.getRT();
      rs = instr.getRS();
      imm = instr.getImm();
      regs[rt] = regs[rs] + imm;
      pc++;
   }
   
   private void sll() {
      int rd, rs, rt, shift;
      Instruction instr = instructs.get(pc);
      
      rd = instr.getRD();
      rt = instr.getRT();
      shift = instr.getShamt();
      regs[rd] = regs[rt] << shift;
      pc++;
   }
   
   private void sub() {
      int rd, rs, rt;
      Instruction instr = instructs.get(pc);
      
      rd = instr.getRD();
      rs = instr.getRS();
      rt = instr.getRT();
      regs[rd] = regs[rs] - regs[rt];
      pc++;
   }
   
   private void slt() {
      int rd, rs, rt;
      Instruction instr = instructs.get(pc);
      
      rd = instr.getRD();
      rs = instr.getRS();
      rt = instr.getRT();
      
      if (regs[rs] < regs[rt]) {
         regs[rd] = 1;
      }
      else {
         regs[rd] = 0;
      }
      pc++;
   }
   
   private void beq() {
      int rt, rs, addr = pc;
      boolean taken = false;
      Instruction instr = instructs.get(pc);
      
      rt = instr.getRT();
      rs = instr.getRS();
      
      for (int i = 0; i < labels.size(); i++) {
         if (labels.get(i).getLabel().equals(instr.getLabel())) {
            addr = labels.get(i).getAddr() - instr.getAddr();
            addr--;
            instr.setLabAddr(addr);
         }
      }
      
      if (regs[rt] == regs[rs]) {
         pc += addr + 1;
         taken = true;
      }
      else {
         pc++;
         taken = false;
      }
      predict(taken);
   }
   
   private void bne() {
      int rt, rs, addr = pc;
      boolean taken = false;
      Instruction instr = instructs.get(pc);
      
      rt = instr.getRT();
      rs = instr.getRS();
      
      for (int i = 0; i < labels.size(); i++) {
         if (labels.get(i).getLabel().equals(instr.getLabel())) {
            addr = labels.get(i).getAddr() - instr.getAddr();
            addr--;
            instr.setLabAddr(addr);
         }
      }
      
      if (regs[rt] != regs[rs]) {
         pc += addr + 1;
         taken = true;
      }
      else {
         pc++;
         taken = false;
      }
      predict(taken);
   }
   
   private void lw() {
      int rt, rs, addr;
      Instruction instr = instructs.get(pc);
      
      rt = instr.getRT();
      rs = instr.getRS();
      addr = instr.getLabAddr();
      
      regs[rt] = mem[addr + regs[rs]];
      pc++;
   }
   
   private void sw() {
      int rt, rs, addr;
      Instruction instr = instructs.get(pc);
      
      rt = instr.getRT();
      rs = instr.getRS();
      addr = instr.getLabAddr();
      
      mem[addr + regs[rs]] = regs[rt];
      pc++;
   }
   
   private void j() {
      int addr = pc;
      Instruction instr = instructs.get(pc);
      
      for (int i = 0; i < labels.size(); i++) {
         if (labels.get(i).getLabel().equals(instr.getLabel())) {
            addr = labels.get(i).getAddr();
            instr.setLabAddr(addr);
         }
      }
      pc = addr;
   }
   
   private void jr() {
      Instruction instr = instructs.get(pc);
      
      pc = regs[instr.getRS()];
   }
   
   private void jal() {
      int addr = pc;
      Instruction instr = instructs.get(pc);
      
      for (int i = 0; i < labels.size(); i++) {
         if (labels.get(i).getLabel().equals(instr.getLabel())) {
            addr = labels.get(i).getAddr();
            instr.setLabAddr(addr);
         }
      }
      regs[31] = pc + 1;
      pc = addr;
   }

   private void predict(boolean taken) {
      int prediction, ghrTemp;
      int mask = 1;
      
      for (int i = 1; i < ghrNum; i++) {
         mask = (mask << 1) + 1;
      }
      
      ghrTemp = ghr & mask;
      
      totPred++;
      prediction = predTable[ghrTemp];
      
      if (taken == true) {
         if (prediction > 1) {
            correctPred++;
         }
         if (prediction < 3) {
            predTable[ghrTemp]++;
         }
         ghr = (ghr << 1) + 1;
      }
      else {
         if (prediction < 2) {
            correctPred++;
         }
         if (prediction > 0) {
            predTable[ghrTemp]--;
         }
         ghr = ghr << 1;
      }
   }
   
   public void outputCoordinates() {
      try {
         PrintStream stream = new PrintStream("coordinates.csv");
         
         for (int i = 0; i < regs[29] - 1; i += 2) {
            stream.println(String.format("%d,%d", mem[i], mem[i + 1]));
         }
      } catch (FileNotFoundException e) {
         System.err.println("Error: File Not Found.");
      }
   }
   
   /*
   public void createStickMan() {
      try {
         PrintStream stream = new PrintStream("coordinates.csv");
         
         for (int i = 0; i < pointLoc; i += 2) {
            stream.println(String.format("%d,%d", mem[i], mem[i + 1]));
         }
      } catch (FileNotFoundException e) {
         System.err.println("Error: File Not Found.");
      }
   }
   
   
   private void Line(int x0, int y0, int x1, int y1) {
      int st, dy, dx, error, y, ystep, temp;
      
      if (Math.abs(y1 - y0) > Math.abs(x1 - x0)) {
         st = 1;
      }
      else {
         st = 0;
      }
      
      if (st == 1) {
         temp = x0;
         x0 = y0;
         y0 = temp;
         
         temp = x1;
         x1 = y1;
         y1 = temp;
      }
      
      if (x0 > x1) {
         temp = x0;
         x0 = x1;
         x1 = temp;
         
         temp = y0;
         y0 = y1;
         y1 = temp;
      }
      
      dx = x1 - x0;
      dy = Math.abs(y1 - y0);
      error = 0;
      y = y0;
      
      if (y0 < y1) {
         ystep = 1;
      }
      else {
         ystep = -1;
      }
      
      for (int i = x0; i < x1 + 1; i++) {
         if (st == 1) {
            plot(y, i);
         }
         else {
            plot(i, y);
         }
         error = error + dy;
         
         if (2 * error >= dx) {
            y = y + ystep;
            error = error - dx;
         }
      }
   }
   
   
   private void Circle(int xc, int yc, int r) {
      int x, y, g, diagonalInc, rightInc;
      
      x = 0;
      y = r;
      g = 3 - 2 * r;
      diagonalInc = 10 - 4 * r;
      rightInc = 6;
      
      while (x <= y) {
         plot(xc + x, yc + y);
         plot(xc + x, yc - y);
         plot(xc - x, yc + y);
         plot(xc - x, yc - y);
         plot(xc + y, yc + x);
         plot(xc + y, yc - x);
         plot(xc - y, yc + x);
         plot(xc - y, yc - x);
         
         if (g >= 0) {
            g += diagonalInc;
            diagonalInc += 8;
            y -= 1;
         }
         else {
            g += rightInc;
            diagonalInc += 4;
         }
         
         rightInc += 4;
         x += 1;
      }
   }
   
   private void plot(int x, int y) {
      mem[pointLoc++] = x;
      mem[pointLoc++] = y;
   }*/
}