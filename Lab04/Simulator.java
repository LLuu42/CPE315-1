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
   
   private int pc, temppc, counter, penalty, loaded, fall, instrCount, cycleCount;
   private boolean stall, squash;
   private int[] regs = new int[32];
   private int[] mem = new int[8192];
   private String[] pipelineRegs = new String[4];
   
   public Simulator(ArrayList<Label> labels, ArrayList<Instruction> instructs, PrintStream ps) {
      this.labels = new ArrayList<Label>(labels);
      this.instructs = new ArrayList<Instruction>(instructs);
      this.stream = ps;
      pc = counter = penalty = fall = instrCount = cycleCount = 0;
      loaded = -1;
      stall = squash = false;
      clear();
      
      for(int i = 0; i < 4; i++) {
         pipelineRegs[i] = new String("empty");
      }
   }
   
   public void showHelp() {
      stream.println("\nh = show help" +
                     "\nd = dump register state" +
                     "\np = show pipeline registers" +
                     "\ns = step through a single clock cycle step (i.e. simulate 1 cycle and stop)" +
                     "\ns num = step through num clock cycles" +
                     "\nr = run until the program ends and display timing summary" +
                     "\nm num1 num2 = display data memory from location num1 to num2" +
                     "\nc = clear all registers, memory, and the program counter to 0" +
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
      
      if (stall) {
         stall = false;
         loaded = -1;
         pipelineRegs[3] = pipelineRegs[2];
         pipelineRegs[2] = pipelineRegs[1];
         pipelineRegs[1] = new String("stall");
         cycleCount++;
      }
      else if (squash) {
         pipelineRegs[3] = pipelineRegs[2];
         pipelineRegs[2] = pipelineRegs[1];
         pipelineRegs[1] = pipelineRegs[0];
         pipelineRegs[0] = new String("squash");
         counter = pc;
         cycleCount++;
         squash = false;
      }
      else if (fall != 0) {
         if (fall > 1) {
            pipelineRegs[3] = pipelineRegs[2];
            pipelineRegs[2] = pipelineRegs[1];
            pipelineRegs[1] = pipelineRegs[0];
            pipelineRegs[0] = instructs.get(pc).getInstr();
         }
         else {
            pipelineRegs[3] = pipelineRegs[2];
            pipelineRegs[2] = new String("squash");
            pipelineRegs[1] = new String("squash");
            pipelineRegs[0] = new String("squash");
            pc = temppc;
         }
         counter++;
         cycleCount++;
         fall--;
      }
      else {
         try {
            Method method = this.getClass().getDeclaredMethod(instructs.get(pc).getInstr());
            
            try {
               pipelineRegs[3] = pipelineRegs[2];
               pipelineRegs[2] = pipelineRegs[1];
               pipelineRegs[1] = pipelineRegs[0];
               pipelineRegs[0] = instructs.get(pc).getInstr();
               counter++;
               cycleCount++;
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
   
   public void printPipeline() {
      String pipeRegs;
      
      pipeRegs = String.format("\n%-7s %-7s %-7s %-7s %-7s", "pc", "if/id", "id/exe", "exe/mem", "mem/wb");
      pipeRegs += String.format("\n%-7d %-7s %-7s %-7s %-7s", counter, pipelineRegs[0], pipelineRegs[1], pipelineRegs[2], pipelineRegs[3]);
      
      stream.println(pipeRegs);
   }
   
   public void run() {
      int cycles, instructions;
      double cpi;
      
      while (pc < instructs.size() || stall) {
         next();
      }
      
      cycles = cycleCount + 4;
      instructions = instrCount;
      cpi = (double)cycles / (double)instructions;
      
      stream.println("\nProgram complete");
      stream.println(String.format("CPI = %.3f   Cycles = %d   Instructions = %d\n", cpi, cycles, instructions));
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
   
   private void and() {
      int rd, rs, rt;
      Instruction instr = instructs.get(pc);
      
      rd = instr.getRD();
      rs = instr.getRS();
      rt = instr.getRT();
      
      if (rs == loaded || rt == loaded) {
         stall = true;
      }
      
      regs[rd] = regs[rs] & regs[rt];
      pc++;
      instrCount++;
   }
   
   private void or() {
      int rd, rs, rt;
      Instruction instr = instructs.get(pc);
      
      rd = instr.getRD();
      rs = instr.getRS();
      rt = instr.getRT();
      
      if (rs == loaded || rt == loaded) {
         stall = true;
      }
      
      regs[rd] = regs[rs] | regs[rt];
      pc++;
      instrCount++;
   }
   
   private void add() {
      int rd, rs, rt;
      Instruction instr = instructs.get(pc);
      
      rd = instr.getRD();
      rs = instr.getRS();
      rt = instr.getRT();
      
      if (rs == loaded || rt == loaded) {
         stall = true;
      }
      
      regs[rd] = regs[rs] + regs[rt];
      pc++;
      instrCount++;
   }
   
   private void addi() {
      int rt, rs, imm;
      Instruction instr = instructs.get(pc);
      
      rt = instr.getRT();
      rs = instr.getRS();
      imm = instr.getImm();
      
      if (rs == loaded) {
         stall = true;
      }
      
      regs[rt] = regs[rs] + imm;
      pc++;
      instrCount++;
   }
   
   private void sll() {
      int rd, rs, rt, shift;
      Instruction instr = instructs.get(pc);
      
      rd = instr.getRD();
      rt = instr.getRT();
      shift = instr.getShamt();
      
      if (rt == loaded) {
         stall = true;
      }
      
      regs[rd] = regs[rt] << shift;
      pc++;
      instrCount++;
   }
   
   private void sub() {
      int rd, rs, rt;
      Instruction instr = instructs.get(pc);
      
      rd = instr.getRD();
      rs = instr.getRS();
      rt = instr.getRT();
      
      if (rs == loaded || rt == loaded) {
         stall = true;
      }
      
      regs[rd] = regs[rs] - regs[rt];
      pc++;
      instrCount++;
   }
   
   private void slt() {
      int rd, rs, rt;
      Instruction instr = instructs.get(pc);
      
      rd = instr.getRD();
      rs = instr.getRS();
      rt = instr.getRT();
      
      if (rs == loaded || rt == loaded) {
         stall = true;
      }
      
      if (regs[rs] < regs[rt]) {
         regs[rd] = 1;
      }
      else {
         regs[rd] = 0;
      }
      pc++;
      instrCount++;
   }
   
   private void beq() {
      int rt, rs, addr = pc;
      Instruction instr = instructs.get(pc);
      
      rt = instr.getRT();
      rs = instr.getRS();
      
      if (rs == loaded || rt == loaded) {
         stall = true;
      }
      
      for (int i = 0; i < labels.size(); i++) {
         if (labels.get(i).getLabel().equals(instr.getLabel())) {
            addr = labels.get(i).getAddr() - instr.getAddr();
            addr--;
            instr.setLabAddr(addr);
         }
      }
      
      if (regs[rt] == regs[rs]) {
         temppc = pc + addr + 1;
         pc++;
         fall = 3;
      }
      else {
         pc++;
      }
      instrCount++;
   }
   
   private void bne() {
      int rt, rs, addr = pc;
      Instruction instr = instructs.get(pc);
      
      rt = instr.getRT();
      rs = instr.getRS();
      
      if (rs == loaded || rt == loaded) {
         stall = true;
      }
      
      for (int i = 0; i < labels.size(); i++) {
         if (labels.get(i).getLabel().equals(instr.getLabel())) {
            addr = labels.get(i).getAddr() - instr.getAddr();
            addr--;
            instr.setLabAddr(addr);
         }
      }
      
      if (regs[rt] != regs[rs]) {
         temppc = pc + addr + 1;
         pc++;
         fall = 3;
      }
      else {
         pc++;
      }
      instrCount++;
   }
   
   private void lw() {
      int rt, rs, addr;
      Instruction instr = instructs.get(pc);
      
      rt = instr.getRT();
      rs = instr.getRS();
      addr = instr.getLabAddr();
      
      loaded = rt;
      
      regs[rt] = mem[addr + regs[rs]];
      pc++;
      instrCount++;
   }
   
   private void sw() {
      int rt, rs, addr;
      Instruction instr = instructs.get(pc);
      
      rt = instr.getRT();
      rs = instr.getRS();
      addr = instr.getLabAddr();
      
      if (rt == loaded) {
         stall = true;
      }
      
      mem[addr + regs[rs]] = regs[rt];
      pc++;
      instrCount++;
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
      squash = true;
      instrCount++;
   }
   
   private void jr() {
      Instruction instr = instructs.get(pc);
      
      pc = regs[instr.getRS()];
      squash = true;
      instrCount++;
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
      squash = true;
      instrCount++;
   }
}