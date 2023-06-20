.data
message1:  .asciiz "Enter the any number to subtract :"
message2:  .asciiz "\nEnter the any number to subtract :"
message3:  .asciiz "\nThe subtraction of the two numbers is "
display1:  .asciiz "Welcome to our calculator: Husain Ali 32115229 ,Qousain 32002941  \n "
display2:  .asciiz "PLease Enter Your Name \n"
display3:  .asciiz "\nChoose ur operands and write ur numbers \n 1-Divison  2-subtraction:\n"
Dividend:  .asciiz "\nPlease Enter the first number: "
Divisor:   .asciiz "\nPlease Enter the second number: "
Result:    .asciiz "\nThe Result of the Division is: "
Quotient:  .asciiz "\nQuotient: "
Remainder: .asciiz "\nRemainder: "
input:        .space 81
inputSize:    .word 80
buffer:       .space 4

.text

.globl main

subtraction:
     li $v0 4        
     la $a0 message1
     syscall

     li $v0 5        
     syscall
     move $t0,$v0    

     li $v0 4        
     la $a0 message2
     syscall

     li $v0 5        
     syscall

     move $t1,$v0
     li $v0 4
     la $a0 message3
     syscall

     sub $a0, $t0, $t1   

     li $v0, 1       
     syscall     
     
     j End_Prog

division:
     li $v0, 4
     la $a0, Dividend
     syscall

     li $v0, 5
     syscall
     add $t0, $v0, $zero

     li $v0, 4
     la $a0, Divisor
     syscall

     li $v0, 5
     syscall

     add $t1, $v0, $zero
     div $t0, $t1
 
    li $v0, 4
    la $a0, Result
    syscall

     li $v0, 4
     la $a0, Quotient
     syscall

     li $v0, 1
     mflo $a0
     syscall

     li $v0, 4
     la $a0, Remainder
     syscall

     li $v0, 1
     mfhi $a0
     syscall
    
    j  End_Prog 

End_Prog:

     li $v0, 10
      syscall


main: 

    li $v0, 4
    la $a0, display1 
    syscall

    li $v0, 4
    la $a0, display2 
    syscall                                                                               
    
    li $v0, 8
    la $a0, input
    lw $a1, inputSize 
    syscall

    
    li $v0, 4
    la $a0, display3
    syscall

    
    li $v0 5        
    syscall
    move $t0,$v0  
 
    beq $t0, 1, division
    beq $t0, 2, subtraction

    j  End_Prog 
