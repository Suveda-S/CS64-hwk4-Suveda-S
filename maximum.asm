# maximum.asm program
# CS 64, Z.Matni
#
# Get 3 integer inputs from the user (std.in)
# Reveal the maximum absolute value (e.g., entering -3, 2, 1 will give the answer 3)
# See assignment description for details

#Data Area (i.e. memory setup directive)
.data
	# TODO: Complete these incomplete declarations / initializations

	nextnum: .asciiz "Enter number:\n"
	max: .asciiz "Maximum: "
    newline: .asciiz "\n"

#Text Area (i.e. instructions/code directive)
.text

main:
	# TODO: Write your code here
    # You can have other labels expressed here, if you need to
	
	#take in the three nums and store them in $t0,1,2 respectively
	la $a0, nextnum

	#num 1
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	srl $t3, $t0, 31
	beq $t3, $zero, numtwo

	nor $t0, $t0, $zero
	addi $t0, $t0, 1

numtwo:
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	srl $t3, $t1, 31
	beq $t3, $zero, numthree

	nor $t1, $t1, $zero
	addi $t1, $t1, 1
	
numthree:
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $t2, $v0
	srl $t3, $t2, 31
	beq $t3, $zero, compare

	nor $t2, $t2, $zero
	addi $t2, $t2, 1


compare:
	blt $t0, $t1, twogreater
	move $t3, $t0
	j threecompare

twogreater:
	move $t3, $t2

threecompare:
	blt $t2, $t3, exit
	move $t3, $t2


exit:
	la $a0, max
	li $v0, 4
	syscall
	move $a0, $t3
	li $v0, 1
	syscall
	la $a0, newline
	li $v0, 4
	syscall

	# TODO: Write code to properly exit a SPIM simulation
	li $v0, 10
	syscall

