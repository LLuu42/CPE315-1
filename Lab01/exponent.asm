# Program #1 (Mod)
# Tyler Mau
# CPE 315
# C Program:
###################################################
# #include <stdio.h>
#
# int main(int argc, const char * argv[]) {
#    int x, y, result, temp, num;
#
#    printf("Enter x Value: ");
#    scanf("%d", &x);
#    printf("Enter y Value: ");
#    scanf("%d", &y);
#
#    result = x;
#    temp = x;
#
#    while (--y) {
#       num = x;
#       while (--num){
#          result += temp;
#       }
#       temp = result;
#    }
#
#    printf("%d\n", result);
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
	.asciiz " This program calculates x ^ y.\n\n"

promptNum:
	.asciiz " Enter base (x) value: "

promptExp:
	.asciiz " Enter exponent (y) value: "

answerText:
	.asciiz " \n Answer = "

#Text Area (i.e. instructions)
.text

loop:
	or		$t2, $0, $s0
	sub		$t2, $t2, 1
	bne		$t2, $0, innerLoop
	or		$t1, $0, $t0
	jr		$ra

innerLoop:
	add		$t0, $t0, $t1
	sub		$t2, $t2, 1
	bne		$t2, $0, innerLoop
	or		$t1, $0, $t0
	sub		$s1, $s1, 1
	bne		$s1, $0, loop
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
	ori     $a0, $a0,0x22
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
	ori     $a0, $a0,0x3A
	syscall

	# Read 2nd integer
	ori		$v0, $0, 5
	syscall
	# $v0 now has the value of the second integer

	# Exponent Function
	or		$t0, $0, $s0
	or		$t1, $0, $s0
	or		$s1, $0, $v0
	sub		$s1, $s1, 1
	jal		loop
	or		$s0, $0, $t0

	# Display the text
	ori     $v0, $0, 4
	lui     $a0, 0x1001
	ori     $a0, $a0,0x56
	syscall

	# Display the Answer
	# load 1 into $v0 to display an integer
	ori     $v0, $0, 1
	add 	$a0, $s0, $0
	syscall

	# Exit (load 10 into $v0)
	ori     $v0, $0, 10
	syscall

