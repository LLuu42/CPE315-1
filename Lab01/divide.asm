# Program #3 (Divide)
# Tyler Mau
# CPE 315
# C Program:
###################################################
# #include <stdio.h>
#
# int main(int argc, const char * argv[]) {
#    int num1, num2, div;
#
#    printf("Enter 2 32-bit Integers: ");
#    scanf("%d %d", &num1, &num2);
#    printf("Enter Divisor: ");
#    scanf("%d", &div);
#
#    while ((div >> 1) != 0) {
#       div = div >> 1;
#       num2 = num2 >> 1;
#
#       if ((num1 & 1) == 1) {
#          num2 = num2 | (1 << 31);
#       }
#       else {
#          num2 = num2 & ~(1 << 31);
#       }
#       num1 = num1 >> 1;
#       num1 = num1 & ~(1 << 31);
#    }
#
#    printf("%d, %d\n", num1, num2);
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
	.asciiz " This program divides a 64-bit number with a 31-bit number. \n\n"

promptNum:
	.asciiz " Enter a 32-bit Integer: "

promptDiv:
	.asciiz " Enter Divisor: "

firstAnswer:
	.asciiz " \n Answer = "

secondAnswer:
	.asciiz ", "

#Text Area (i.e. instructions)
.text

loop:
	srl		$t0, $s2, 1
	srl		$s2, $s2, 1
	srl		$s1, $s1, 1

	and		$t1, $s0, 1
	srl		$s0, $s0, 1
	xor		$t3, $t2, -1
	and		$s0, $s0, $t3

	beq		$t1, 1, transfer
	bne		$t1, 1, removeNeg

	jr		$ra

transfer:
	or		$s1, $s1, $t2
	bne		$t0, 1, loop
	jr		$ra

removeNeg:
    xor		$t3, $t2, -1
    and		$s1, $s1, $t3
    bne		$t0, 1, loop
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
	ori     $a0, $a0,0x3F
	syscall

	# Read 1st integer from the user (5 is loaded into $v0, then a syscall)
	ori     $v0, $0, 5
	syscall

	# Clear $s0 for the answer
	ori     $s0, $0, 0

	# Add 1st integer to answer
	addu    $s0, $v0, $s0

	# Display second prompt
	ori     $v0, $0, 4
	lui     $a0, 0x1001
	ori     $a0, $a0,0x3F
	syscall

	# Read 2nd integer
	ori		$v0, $0, 5
	syscall
	# $v0 now has the value of the second integer

	# Add 2nd integer to register
	addu    $s1, $v0, $0

	# Display third prompt
	ori     $v0, $0, 4
	lui     $a0, 0x1001
	ori     $a0, $a0,0x59
	syscall

	# Read 3rd integer
	ori		$v0, $0, 5
	syscall
	# $v0 now has the value of the third integer

	# Add 3rd integer to register
	addu    $s2, $v0, $0

	# Divide Function
	ori		$t2, $0, 1
	sll		$t2, $t2, 31
	jal 	loop

	# Display the answer text
	ori     $v0, $0, 4
	lui     $a0, 0x1001
	ori     $a0, $a0,0x6A
	syscall

	# Display the answer
	# load 1 into $v0 to display an integer
	ori     $v0, $0, 1
	add 	$a0, $s0, $0
	syscall

	# Display the next text
	ori     $v0, $0, 4
	lui     $a0, 0x1001
	ori     $a0, $a0,0x77
	syscall

	# Display the answer
	# load 1 into $v0 to display an integer
	ori     $v0, $0, 1
	add 	$a0, $s1, $0
	syscall

	# Exit (load 10 into $v0)
	ori     $v0, $0, 10
	syscall

