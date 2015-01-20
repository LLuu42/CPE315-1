# Bresenham Line and Circle Algorithms
# Draws Stick Figure

main:
   addi   $a0, $0, 30
   addi   $a1, $0, 100
   addi   $a2, $0, 20
   jal    Circle

   addi   $a0, $0, 30
   addi   $a1, $0, 80
   addi   $a2, $0, 30
   addi	  $a3, $0, 30
   jal    Line
   
   addi   $a0, $0, 20
   addi   $a1, $0, 1
   addi   $a2, $0, 30
   addi	  $a3, $0, 30
   jal    Line
   
   addi   $a0, $0, 40
   addi   $a1, $0, 1
   addi   $a2, $0, 30
   addi	  $a3, $0, 30
   jal    Line
   
   addi   $a0, $0, 15
   addi   $a1, $0, 60
   addi   $a2, $0, 30
   addi	  $a3, $0, 50
   jal    Line
   
   addi   $a0, $0, 30
   addi   $a1, $0, 50
   addi   $a2, $0, 45
   addi	  $a3, $0, 60
   jal    Line
   
   addi   $a0, $0, 24
   addi   $a1, $0, 105
   addi   $a2, $0, 3
   jal    Circle
   
   addi   $a0, $0, 36
   addi   $a1, $0, 105
   addi   $a2, $0, 3
   jal    Circle
   
   addi   $a0, $0, 25
   addi   $a1, $0, 90
   addi   $a2, $0, 35
   addi	  $a3, $0, 90
   jal    Line
   
   addi   $a0, $0, 25
   addi   $a1, $0, 90
   addi   $a2, $0, 20
   addi	  $a3, $0, 95
   jal    Line
   
   addi   $a0, $0, 35
   addi   $a1, $0, 90
   addi   $a2, $0, 40
   addi	  $a3, $0, 95
   jal    Line
   
   j      End

Circle:
   add    $t0, $0, $0           # x = 0
   add    $t1, $a2, $0          # y = r
   addi   $t3, $0, 3
   sll    $t2, $a2, 1           # r * 2
   sub    $t2, $t3, $t2         # g = 3 - 2 * r

   addi   $t4, $0, 10
   sll    $t3, $a2, 2           # r * 4
   sub    $t3, $t4, $t3         # diagonalInc = 10 - 4 * r
   
   addi   $t4, $0, 6            # rightInc = 0
   
   addi   $t5, $t1, 1           # y + 1
   
   CircleLoop:
      beq    $t0, $t5, EndCircleLoop
      
      # plot(xc + x, yc + y)
      add    $t6, $a0, $t0
      add    $t7, $a1, $t1
      
      sw     $t6, 0($sp)
      sw     $t7, 1($sp)
      addi   $sp, $sp, 2
      
      # plot(xc + x, yc - y)
      add    $t6, $a0, $t0
      sub    $t7, $a1, $t1
      
      sw     $t6, 0($sp)
      sw     $t7, 1($sp)
      addi   $sp, $sp, 2
      
      # plot(xc - x, yc + y)
      sub    $t6, $a0, $t0
      add    $t7, $a1, $t1
      
      sw     $t6, 0($sp)
      sw     $t7, 1($sp)
      addi   $sp, $sp, 2
      
      # plot(xc - x, yc - y)
      sub    $t6, $a0, $t0
      sub    $t7, $a1, $t1
      
      sw     $t6, 0($sp)
      sw     $t7, 1($sp)
      addi   $sp, $sp, 2
      
      # plot(xc + y, yc + x)
      add    $t6, $a0, $t1
      add    $t7, $a1, $t0
      
      sw     $t6, 0($sp)
      sw     $t7, 1($sp)
      addi   $sp, $sp, 2
      
      # plot(xc + y, yc - x)
      add    $t6, $a0, $t1
      sub    $t7, $a1, $t0
      
      sw     $t6, 0($sp)
      sw     $t7, 1($sp)
      addi   $sp, $sp, 2
      
      # plot(xc - y, yc + x)
      sub    $t6, $a0, $t1
      add    $t7, $a1, $t0
      
      sw     $t6, 0($sp)
      sw     $t7, 1($sp)
      addi   $sp, $sp, 2
      
      # plot(xc - y, yc - x)
      sub    $t6, $a0, $t1
      sub    $t7, $a1, $t0
      
      sw     $t6, 0($sp)
      sw     $t7, 1($sp)
      addi   $sp, $sp, 2


      slt    $t6, $t2, $0
      bne    $t6, $0, GELSE
      
      add    $t2, $t2, $t3
      addi   $t3, $t3, 8
      addi    $t5, $t1, 1
      addi   $t1, $t1, -1
      
      j      skipGELSE
      
      GELSE:
         add    $t2, $t2, $t4
         addi   $t3, $t3, 4
      
      skipGELSE:
      
      addi   $t4, $t4, 4        # rightInc += 4
      addi   $t0, $t0, 1        # x += 1
      
      j      CircleLoop
      
   EndCircleLoop:
      jr     $ra
  
Line: #a0 = x0, a1 = y0, a2 = x1, a3 = y1

   slt    $t0, $a2, $a0         # Check if x1 < x0
   beq    $t0, $0, skipabsdx    # Skip abs

   sub    $t0, $a0, $a2         # dx = x0 - x1
   j      L1

   skipabsdx:
      sub    $t0, $a2, $a0      # dx = x1 - x0

   L1:

      slt    $t1, $a3, $a1      # Check if y1 < y0
      beq    $t1, $0, skipabsdy # Skip abs

      sub    $t1, $a1, $a3      # dy = y0 - y1
      j	     L2

   skipabsdy:
      sub    $t1, $a3, $a1      # dy = y1 - y0

   L2:
      addi   $t3, $0, 1         # st = 1
      slt    $t2, $t0, $t1      # Checks if dx < dy
      bne    $t2, $0, skipst

      add    $t3, $0, $0        # st = 0

      skipst:

      beq    $t3, $0, skip1

      add    $t4, $a0, $0
      add    $a0, $a1, $0
      add    $a1, $t4, $0

      add    $t4, $a2, $0
      add    $a2, $a3, $0
      add    $a3, $t4, $0

      skip1:

      slt    $t4, $a2, $a0
      beq    $t4, $0, skip2

      add    $t4, $a0, $0
      add    $a0, $a2, $0
      add    $a2, $t4, $0

      add    $t4, $a1, $0
      add    $a1, $a3, $0
      add    $a3, $t4, $0

      skip2:

      sub    $t0, $a2, $a0       # dx = x1 - x0

      slt    $t1, $a3, $a1       # Check if y1 < y0
      beq    $t1, $0, skipabsdy2 # Skip abs

      sub    $t1, $a1, $a3       # dy = y0 - y1
      j	     L3

      skipabsdy2:
      sub    $t1, $a3, $a1       # dy = y1 - y0

      L3:

      add    $t2, $0, $0         # error = 0
      add    $t4, $a1, $0        # y = y0

      addi   $t5, $0, 1	         # ystep = 1
      slt    $t6, $a1, $a3       # Check if y0 < y1
      bne    $t6, $0, skip3

      addi   $t5, $0, -1         # ystep = -1

      skip3:

      add    $t6, $a0, $0        # i = x0
      addi   $t7, $a2, 1

      LineLoop:
         beq   $t6, $t7, ExitLineLoop

         beq   $t3, $0, STELSE

         sw    $t4, 0($sp)
         sw    $t6, 1($sp)
         addi  $sp, $sp, 2

         j     L4

         STELSE:
            sw    $t4, 1($sp)
            sw    $t6, 0($sp)
            addi  $sp, $sp, 2

         L4:

         add   $t2, $t2, $t1      # error = error + dy
         sll   $t8, $t2,  1       # error * 2
         slt   $t9, $t8, $t0      # Checks if error * 2 < dx

         bne   $t9, $0, skip4

         add   $t4, $t4, $t5
         sub   $t2, $t2, $t0

         skip4:

         addi   $t6, $t6, 1       #i++
         j      LineLoop

         ExitLineLoop:
            jr   $ra

End: