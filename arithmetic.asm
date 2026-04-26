# arithmetic.asm program
# CS 64, Z.Matni
#
# 1. Prompt the user for 3 inputs: a, b, c
# 2. Calculate 64*( a - 4*b) + 9*c using only one mult instruction
# 3. Print out the result

.text
main:
	# TODO: Write your code here!

	#take in 3 inputs from user a,b,c and store in registers t0, t1, t2 respectively
	li $v0, 5
	syscall
	move $t0, $v0
	li $v0, 5
	syscall
	move $t1, $v0
	li $v0, 5
	syscall
	move $t2, $v0

	#store value for multiplying c by 9 in temp register, then mult and store back in $t2
	li $t3, 9
	mult $t2, $t3
	mflo $t2

	#bitshift b by 2 to mult by 4 and subtract 4b from a then store in $a0
	sll $t1, $t1, 2
	sub $a0, $t0, $t1

	# bitshift left a0 by 6 to multiply it by 64
	sll $a0, $a0, 6
	
	# add the 9c in t2 to a0 and print result
	add $a0, $a0, $t2
	li $v0, 1
	syscall

exit:
	# Exit SPIM: Write your code here!
	li $v0, 10
	syscall
