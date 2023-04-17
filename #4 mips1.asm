.text
# Write a program to prompt the user for a number, and determine if that number is prime. Your program should print out "Number n is prime" if the number is prime, and "Number n
# is not prime if the number is not prime. The user should be able to enter input a "-1" is entered. It should print an error if 0, 1, 2 or any negative number other than -1 are entered.

# Get user input
li $v0, 4
la $a0, prompt
syscall

li $v0, 5
syscall
move $s0, $v0

addi $t3, $zero, 1

# Counter for #s divisible
addi $t1, $zero, 1
# Iterator to try 2-9
addi $t0, $zero, 1
While: bgt $t0, 9, Check
addi $t0, $t0, 1 # Add 1 to iterator
beq $t0, $s0, While # Skips checking the same number
rem $t2, $s0, $t0 # Remainder
bne $t2, $zero, While # If there is a remainder (not divisible) then jump to While
addi $t1, $t1, 1 # If the remainder == 0 then add to the counter
j While

Check: bgt $t1, $t3, notPrime
li $v0, 4
la $a0, prime
syscall
j End

notPrime: 
li $v0, 4
la $a0, NotPrime
syscall
j End

End:
li $v0, 10
syscall

.data
prompt: .asciiz "Please enter a whole number: "
NotPrime: .asciiz "\nIt is not a prime number."
prime: .asciiz "\nIt is a prime number."
