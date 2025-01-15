# Title:  Question 3
# Author: Kai Toledano
# Dedcription: This code job is to recive a String and preform a few check on it.
# Input: a String
# Output: a few parameters regarding the String's properties. 
# Filename: Question3
# Data: 09\08\2021
############################### Data segment ################################################################################################################################################################################################   
.data
StringBuffer: .space 81
message1:     .asciiz "Please enter some words: "
message2:     .asciiz "\nNumber of words = "
message3:     .asciiz "\nLetters in longest word = "
message4:     .asciiz "\nLetters in shortest word = "
message5:     .asciiz "\nDifference = "
message6:     .asciiz "\nTotal number of letters = "
############################### Code segment #################################################################################################################################################################################################
.text
.globl main

    # Start of program.

main:            li $v0, 4
                 la $a0, message1                    # Ask the user to enter a String.
                 syscall
       
                 li $a1, 81           
                 la $a0, StringBuffer                # Save the String in an array.
                 li $v0, 8
                 syscall
                 
                 li $t8, 0                           # Total letters counter.
                 li $t7, 0                           # Alphabet character counter. 
                 li $t6, 0                           # Word length counter.
                 li $t5, 0                           # Maximum holder.
                 li $t4, 1                           # Words counter.
                 li $t3, 100                         # Minimum holder.
                
                 la $a2, StringBuffer                # Load the array for the loop.
       
check_loop:      lbu  $t0 0($a2)                     # Load the element from the array.
                 beq  $t9, $t0, error                # If the next char is space, and the prev char is space as well, then call for a new str from user.
                 beq  $t0, 10, end_of_prog            
                 beq  $t0, 32, skip
                 li $t9, 0                           # Reset the 'space' character flag otherwise.
                 jal compute_letter              
                 addi $a2, $a2, 1                    # Load the next element of the array.
                 addi $t8, $t8, 1                    # Count the number of total letters in the string.
                 addi $t7, $t7, 1                    # Count the number of alphabetic char (without space chars).
                 addi $t6, $t6, 1                    # Follow the loop and calculate the length of each word by noticing when the 'space' character is detected by the loop.          
                 j check_loop                        # Jump back to the loop for the next iteration.
        
end_of_prog:     addi $t8, $t8, -1
                 lb $t1, StringBuffer($t8)
                 beq $t1, 32, error             
                 sub $t2, $t5, $t3
                 ble $t6, $t3, final_minimum          # The final minimum\maximum is for the last word length of the array, before the final stage of the program, it will check the last word length for hidden minimum\maximum length.
                 bge $t6, $t5, final_maximum          # ^^
                 j end                                # Jump to the final stage of the program.
         
compute_letter:  addi $t0, $t0, -64
                 ble  $t0, 0, error
                 bgt  $t0, 26, lc
                 jr   $ra
                 
lc:              beq  $t0, 32, skip        # Here the program will check if the inputed letters are alphabetic.
                 blt  $t0, 33, error          
                 bgt  $t0, 58, error
                 addi $t0, $t0, -32
                 jr   $ra
            
skip:            li $t9, 32                # Flag for 'space' character.
                 addi $t4, $t4, 1
                 bge $t6, $t5, maximum
                 ble $t6, $t3, minimum
                 li $t6, 0                 # In order to prevent accumulation of letters length, we will set $t6 to zero.
                 addi $a2, $a2, 1          # Load the next element of the array.
                 addi $t8, $t8, 1          # increment the total letters counter.
                 j check_loop              # Jump back to the loop for the next iteration.
                              
error:           jal main                  # In case of invalid input, jump back to main in order to begin the task again.
    
maximum:         add $t5, $t6, 0           # Store the new maximum length of the word.
                 li $t6, 0                 # In order to prevent accumulation of letters length, we will set $t6 to zero.
                 addi $a2, $a2, 1          # Load the next element of the array.
                 addi $t8, $t8, 1          # increment the total letters counter.
                 j check_loop              # Jump back to the loop for the next iteration.
                 
minimum:         add $t3, $t6, 0           # Store the new minimum length of the word.
                 li $t6, 0                 # In order to prevent accumulation of letters length, we will set $t6 to zero.
                 addi $a2, $a2, 1          # Load the next element of the array.
                 addi $t8, $t8, 1          # increment the total letters counter.
                 j check_loop              # Jump back to the loop for the next iteration.
                 
final_minimum:   add $t3, $t6, 0
                 li $t6, 0                
                 sub $t2, $t5, $t3      
                 j end                     # Jump to the final stage of the program.
                 
final_maximum:   add $t5, $t6, 0
                 li $t6, 0
                 sub $t2, $t5, $t3
                 j end                     # Jump to the final stage of the program.    
                                 
end:             la $a0, message2          # The final stage of the program- printing the data collected so far.
                 li $v0 ,4
                 syscall
                 
                 move $a0, $t4
                 li $v0, 1            
                 syscall
                 
                 la $a0, message3
                 li $v0, 4
                 syscall
                 
                 move $a0, $t5
                 li $v0, 1
                 syscall
                 
                 la $a0, message4
                 li $v0, 4
                 syscall
                 
                 move $a0, $t3
                 li $v0, 1
                 syscall
                 
                 la $a0, message5
                 li $v0, 4
                 syscall
                 
                 move $a0, $t2
                 li $v0, 1
                 syscall
                 
                 la $a0, message6
                 li $v0, 4
                 syscall
                 
                 move $a0, $t7
                 li $v0, 1
                 syscall
                 
                 li $v0, 10                # End of program.
                 syscall
                             
  
