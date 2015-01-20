# Program #1 (Mod)
# Tyler Mau
# CPE 315
# C Program:
###################################################
# #include <stdio.h>
# #include <stdlib.h>
#
# int main(int argc, const char * argv[]) {
#    int num, div, mod;
#   
#    printf("Enter a numerator: ");
#    scanf("%d", &num);
#    printf("Enter a divisor: ");
#    scanf("%d", &div);
#   
#    mod = num & (div - 1);
#    printf("Mod = %d\n", mod);
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
	.asciiz " This program finds the remainder of division. \n\n"

promptNum:
	.asciiz " Enter a numerator: "

promptDiv:
	.asciiz " Enter a divisor: "

sumText: 
	.asciiz " \n Mod = "

#Text Area (i.e. instructions)
.text

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
	ori     $a0, $a0,0x32
	syscall

	# Read 1st integer from the user (5 is loaded into $v0, then a syscall)
	ori     $v0, $0, 5
	syscall

	# Clear $s0 for the answer
	ori     $s0, $0, 0	

	# Add 1st integer to answer 
	addu    $s0, $v0, $s0
	
	# Display second prompt (4 is loaded into $v0 to display)
	ori     $v0, $0, 4			
	lui     $a0, 0x1001
	ori     $a0, $a0,0x48
	syscall

	# Read 2nd integer 
	ori		$v0, $0, 5			
	syscall
	# $v0 now has the value of the second integer
	
	# Mod Function
	sub		$v0, $v0, 1
    and		$s0, $s0, $v0

	# Display the mod text
	ori     $v0, $0, 4			
	lui     $a0, 0x1001
	ori     $a0, $a0,0x5C
	syscall
	
	# Display the remainder
	# load 1 into $v0 to display an integer
	ori     $v0, $0, 1			
	add 	$a0, $s0, $0
	syscall
	
	# Exit (load 10 into $v0)
	ori     $v0, $0, 10
	syscall

