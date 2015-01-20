# Program #2 (Parity)
# Tyler Mau
# CPE 315
# C Program:
###################################################
# #include <stdio.h>
# #include <stdlib.h>
#
# int main(int argc, const char * argv[]) {
#    int num, parity = 0, answer;
#    printf("Enter a number: ");
#    scanf("%d", &num);
#
#    for (int i = 0; i < 16; i++) {
#       parity += (1 & num);
#       num = num >> 1;
#    }
#   
#    answer = ((parity & 1) ^ -1) & 1;
#   
#    printf("\nParity = %d\n", answer);
#    
#    return 0;
# }
###################################################

.globl welcome
.globl promptNum
.globl promptDiv
.globl sumText

#  Data Area
.data

welcome:
	.asciiz " This program finds the parity of a number. \n\n"

promptNum:
	.asciiz " Enter a number: "

sumText: 
	.asciiz " \n Parity = "

#Text Area (i.e. instructions)
.text

loop:
	andi	$t1, $s0, 1
	add		$t0, $t0, $t1
	srl		$s0, $s0, 1
	bne		$s0, $0, loop
	jr		$ra

main:

	# Display the welcome message
	ori     $v0, $0, 4			

	# This generates the starting address for the welcome message.
	# (assumes the register first contains 0).
	lui     $a0, 0x1001
	syscall

	# Display first prompt
	ori     $v0, $0, 4			
	
	# This is the starting address of the prompt
	lui     $a0, 0x1001
	ori     $a0, $a0,0x2F
	syscall

	# Read 1st integer from the user (5 is loaded into $v0, then a syscall)
	ori     $v0, $0, 5
	syscall

	# Clear $s0 for the answer
	ori     $s0, $0, 0	

	# Add 1st integer to answer 
	addu    $s0, $v0, $s0
	
	# Parity Function
	ori		$t0, $0, 0
	jal 	loop
    and		$s0, $t0, 1
    xor		$s0, $s0, -1
    and		$s0, $s0, 1

	# Display the parity text
	ori     $v0, $0, 4			
	lui     $a0, 0x1001
	ori     $a0, $a0,0x42
	syscall
	
	# Display the parity
	# load 1 into $v0 to display an integer
	ori     $v0, $0, 1			
	add 	$a0, $s0, $0
	syscall
	
	# Exit (load 10 into $v0)
	ori     $v0, $0, 10
	syscall

