# Mila Kuang
#
# Write a program to allow a user to guess a random number generated by the computer from 1
# to maximum (the user should enter the maximum value to guess). In this program the user
# will enter the value of maximum, and the syscall service 42 will be used to generate a random
# number from 1 to maximum. The user will then enter guesses and the program should print
# out if the guess is too high or too low until the user guesses the correct number. The program
# should print out the number of guesses the user took.

.text
# Prompt
li $v0, 4
la $a0, promptMax
syscall

li $v0, 5
syscall
move $t0, $v0

# Generate random number
add $a1, $zero, $t0
li $v0, 42
syscall
move $t1, $a0

addi $t2, $zero, -1

# Loops until the number is guessed $t1 = the randomly generated # $t2 = guess
While: beq $t2, $t1, Yay
li $v0, 4
la $a0, promptGuess
syscall

li $v0, 5
syscall
move $t2, $v0
bgt $t2, $t1, tooHigh
blt $t2, $t1, tooLow
j While

tooHigh:
li $v0, 4
la $a0, greater
syscall
j While

tooLow: 
li $v0, 4
la $a0, low
syscall
j While

Yay:
li $v0, 4
la $a0, congrats
syscall
li $v0, 10
syscall

.data
promptMax: .asciiz "Please enter the maximum value: "
promptGuess: .asciiz "\nGuess the number: "
greater: .asciiz "\nYour guess was too high!"
low: .asciiz "\nYour guess was too low!"
congrats: .asciiz "\nYay that was the number!"
