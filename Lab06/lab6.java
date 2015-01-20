/** Lab 6
 *  Tyler Mau
 *  December 5, 2014
 */

import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;

public class lab6 {
   public static void main(String args[]) {
      try {
         Scanner scanner = new Scanner(new File(args[0]));
         int[][] cache1 = new int[512][1];
         int[][] cache2 = new int[256][2];
         int[][] cache3 = new int[128][4];
         int[][] cache4 = new int[256][2];
         int[][] cache5 = new int[128][4];
         int[][] cache6 = new int[32][4];
         int[][] cache7 = new int[1024][1];

         int[][] lru5 = new int[128][4];
         for (int i = 0; i < 128; i++) {
            lru5[i][1] = 1;
            lru5[i][2] = 2;
            lru5[i][3] = 3;
         }

         int[][] lru6 = new int[32][4];
         for (int i = 0; i < 32; i++) {
            lru6[i][1] = 1;
            lru6[i][2] = 2;
            lru6[i][3] = 3;
         }

         int[][] lru = new int[256][4];
         int[] hits = new int[7];
         int[] misses = new int[7];
         int addr, index, blockOffset, temp, tag;
         double rate;

         while (scanner.hasNextInt()) {
            scanner.nextInt();
            addr = scanner.nextInt(16);
            addr = addr / 4;

            /* Cache 1 */
            index = addr % 512;
            if (cache1[index][0] != addr) {
               cache1[index][0] = addr;
               misses[0]++;
            }
            else {
               hits[0]++;
            }

            /* Cache 2 */
            index = (addr/2) % 256;
            blockOffset = addr % 2;
            if (cache2[index][blockOffset] != addr) {
               temp = addr - blockOffset;
               for (int i = 0; i < 2; i++) {
                  cache2[index][i] = temp++;;
               }
               misses[1]++;
            }
            else {
               hits[1]++;
            }

            /* Cache 3 */
            index = (addr/4) % 128;
            blockOffset = addr % 4;
            if (cache3[index][blockOffset] != addr) {
               temp = addr - blockOffset;
               for (int i = 0; i < 4; i++) {
                  cache3[index][i] = temp++;;
               }
               misses[2]++;
            }
            else {
               hits[2]++;
            }

            /* Cache 4 */
            index = addr % 256;
            tag = addr / 256;
            if (cache4[index][0] != tag && cache4[index][1] != tag) {
               if (lru[index][0] == 0) {
                  cache4[index][0] = tag;
                  lru[index][0] = 1;
               }
               else {
                  cache4[index][1] = tag;
                  lru[index][0] = 0;
               }
               misses[3]++;
            }
            else {
               if (cache4[index][0] == tag) {
                  lru[index][0] = 1;
               }
               else {
                  lru[index][0] = 0;
               }
               hits[3]++;
            }

            /* Cache 5 */
            temp = 0;
            index = addr % 128;
            tag = addr / 128;

            //System.out.println(lru5[0] + " " + lru5[1] + " " + lru5[2] + " " + lru5[3]);

            if (cache5[index][0] == tag) {
               hits[4]++;

               for (int i = 0; i < 4; i++) {
                  if (lru5[index][i] == 0) {
                     temp = i;
                     break;
                  }
               }

               for (int i = temp; i < 3; i++) {
                  lru5[index][i] = lru5[index][i+1];
               }
               lru5[index][3] = 0;
            }
            else if (cache5[index][1] == tag) {
               hits[4]++;

               for (int i = 0; i < 4; i++) {
                  if (lru5[index][i] == 1) {
                     temp = i;
                     break;
                  }
               }

               for (int i = temp; i < 3; i++) {
                  lru5[index][i] = lru5[index][i+1];
               }
               lru5[index][3] = 1;
            }
            else if (cache5[index][2] == tag) {
               hits[4]++;

               for (int i = 0; i < 4; i++) {
                  if (lru5[index][i] == 2) {
                     temp = i;
                     break;
                  }
               }

               for (int i = temp; i < 3; i++) {
                  lru5[index][i] = lru5[index][i+1];
               }
               lru5[index][3] = 2;
            }
            else if (cache5[index][3] == tag) {
               hits[4]++;

               for (int i = 0; i < 4; i++) {
                  if (lru5[index][i] == 3) {
                     temp = i;
                     break;
                  }
               }

               for (int i = temp; i < 3; i++) {
                  lru5[index][i] = lru5[index][i+1];
               }
               lru5[index][3] = 3;
            }
            else {
               temp = lru5[index][0];
               cache5[index][temp] = tag;

               for (int i = 0; i < 3; i++) {
                  lru5[index][i] = lru5[index][i+1];
               }
               lru5[index][3] = temp;

               misses[4]++;
            }

            /* Cache 6 */

            temp = 0;
            index = (addr / 4) % 32;
            tag = (addr / 4) / 32;

            //System.out.println(lru5[0] + " " + lru5[1] + " " + lru5[2] + " " + lru5[3]);

            if (cache6[index][0] == tag) {
               hits[5]++;

               for (int i = 0; i < 4; i++) {
                  if (lru6[index][i] == 0) {
                     temp = i;
                     break;
                  }
               }

               for (int i = temp; i < 3; i++) {
                  lru6[index][i] = lru6[index][i+1];
               }
               lru6[index][3] = 0;
            }
            else if (cache6[index][1] == tag) {
               hits[5]++;

               for (int i = 0; i < 4; i++) {
                  if (lru6[index][i] == 1) {
                     temp = i;
                     break;
                  }
               }

               for (int i = temp; i < 3; i++) {
                  lru6[index][i] = lru6[index][i+1];
               }
               lru6[index][3] = 1;
            }
            else if (cache6[index][2] == tag) {
               hits[5]++;

               for (int i = 0; i < 4; i++) {
                  if (lru6[index][i] == 2) {
                     temp = i;
                     break;
                  }
               }

               for (int i = temp; i < 3; i++) {
                  lru6[index][i] = lru6[index][i+1];
               }
               lru6[index][3] = 2;
            }
            else if (cache6[index][3] == tag) {
               hits[5]++;

               for (int i = 0; i < 4; i++) {
                  if (lru6[index][i] == 3) {
                     temp = i;
                     break;
                  }
               }

               for (int i = temp; i < 3; i++) {
                  lru6[index][i] = lru6[index][i+1];
               }
               lru6[index][3] = 3;
            }
            else {
               temp = lru6[index][0];
               cache6[index][temp] = tag;

               for (int i = 0; i < 3; i++) {
                  lru6[index][i] = lru6[index][i+1];
               }
               lru6[index][3] = temp;

               misses[5]++;
            }

            /* Cache 7 */
            index = addr % 1024;
            if (cache7[index][0] != addr) {
               cache7[index][0] = addr;
               misses[6]++;
            }
            else {
               hits[6]++;
            }
         }


         rate = ((double)hits[0] / (double)(hits[0] + misses[0])) * (double)100;
         System.out.println("Cache #1\n" +
                            "Cache size: 2048B  Associativity: 1  Block size: 1");
         System.out.println(String.format("Hits: %d   Hit Rate: %.2f%%",
                                           hits[0], rate));
         System.out.println("---------------------------");

         rate = ((double)hits[1] / (double)(hits[1] + misses[1])) * (double)100;
         System.out.println("Cache #2\n" +
                            "Cache size: 2048B  Associativity: 1  Block size: 2");
         System.out.println(String.format("Hits: %d   Hit Rate: %.2f%%",
                                           hits[1], rate));
         System.out.println("---------------------------");

         rate = ((double)hits[2] / (double)(hits[2] + misses[2])) * (double)100;
         System.out.println("Cache #3\n" +
                            "Cache size: 2048B  Associativity: 1  Block size: 4");
         System.out.println(String.format("Hits: %d   Hit Rate: %.2f%%",
                                           hits[2], rate));
         System.out.println("---------------------------");

         rate = ((double)hits[3] / (double)(hits[3] + misses[3])) * (double)100;
         System.out.println("Cache #4\n" +
                            "Cache size: 2048B  Associativity: 2  Block size: 1");
         System.out.println(String.format("Hits: %d   Hit Rate: %.2f%%",
                                           hits[3], rate));
         System.out.println("---------------------------");

         rate = ((double)hits[4] / (double)(hits[4] + misses[4])) * (double)100;
         System.out.println("Cache #5\n" +
                            "Cache size: 2048B  Associativity: 4  Block size: 1");
         System.out.println(String.format("Hits: %d   Hit Rate: %.2f%%",
                                           hits[4], rate));
         System.out.println("---------------------------");

         rate = ((double)hits[5] / (double)(hits[5] + misses[5])) * (double)100;
         System.out.println("Cache #6\n" +
                            "Cache size: 2048B  Associativity: 4  Block size: 4");
         System.out.println(String.format("Hits: %d   Hit Rate: %.2f%%",
                                           hits[5], rate));
         System.out.println("---------------------------");

         rate = ((double)hits[6] / (double)(hits[6] + misses[6])) * (double)100;
         System.out.println("Cache #7\n" +
                            "Cache size: 4096B  Associativity: 1  Block size: 1");
         System.out.println(String.format("Hits: %d   Hit Rate: %.2f%%",
                                           hits[6], rate));
         System.out.println("---------------------------");
      }
      catch (FileNotFoundException e) {
      }
   }
}
