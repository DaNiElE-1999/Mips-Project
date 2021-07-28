                         #task 2 MIPS solution

# declare variables
.data 
#
funny: .asciiz " Task 2 v 1.0,0 *MIPS edition* \n\n"
funny1: .asciiz " @author Daniele Llazo\n\n"
string1: .asciiz "Enter the String you want to work with: \n"
string2: .asciiz "Enter the number of columns: \n"
string3: .asciiz "Enter 0 for Encryption or 1 for Decryption : \n"
string4: .asciiz "The Encrypted string is: \n"
string5: .asciiz "The Decrypted string is: \n"
string6: .asciiz "Wrong input! \n"
string7: .asciiz "You chose to encrypt word \n"
string8: .asciiz "You chose to decrypt word \n"
default: .asciiz "Default integers exit program \n"
ERROR_404: .asciiz "Anything else gives an error \n"
out: .asciiz "You chose to exit program"
undercase: .asciiz "_"
space: .asciiz "\n"
byte: .byte 
# declare variables

# Inputed strings
inputedS: .space 1000
# Inputed strings

#arrays

#arrays

.text 

main: #

li  $v0, 4            # 
la  $a0, funny       #  :-)
syscall             #
li  $v0, 4            # 
la  $a0, funny1      # :-)
syscall             #

# program asks to enter a string you wanna work with
li  $v0, 4            #
la  $a0, string1     # 
syscall             #

#Get the string
la $a0, inputedS
li $a1, 1000 #string is loaded to register $a1

li $v0, 8
syscall
#

#string_length
string_length:

    li $t0, 0
    la $a1, inputedS
    
loop:
    lb $t9, ($a1)
    beq $t9, $zero, exitLoop
    addi $t0, $t0, 1
    addi $a1, $a1, 1
    
    j loop
    
exitLoop:

subi $t8, $t0, 1 
#string_length is to register $t8

li  $v0, 4            # 
la  $a0, string2     #  Program asks for the number of columns
syscall             #

# Get the number
li $v0, 5
syscall

# Store the number in $t1 ($t1 -> noColumns)
move $t1, $v0

# "Switch creation"
switch:
li  $v0, 4            # 
la  $a0, string3     #  Program requires user's choice
syscall             #
li  $v0, 4            # 
la  $a0, default     # Default alternatives are used to close the program
syscall             #
li  $v0, 4            # 
la  $a0, ERROR_404   # ERROR 404
syscall             #

# Get the choice
li $v0, 5
syscall

# Store the choice in $t2 ($t2 -> choice)
move $t2, $v0

#Case_Encryption
case_1:
beq $t2, 0, string_Encrypt
#Case_Decryption
case_2:
beq $t2, 1, string_Decrypt
#Case_Default
case_default:
li  $v0, 4            # 
la  $a0, out         # exit choice
syscall             #
#Switch end

ExitProgram:
# Syscall to end the program
li $v0, 10  
syscall

# Labels -----------------------

string_Encrypt:

li  $v0, 4            # 
la  $a0, string7     #  You chose to encrypt word
syscall             #

# From C++ program:
addi $t3, $zero, 0    #i
addi $t4, $zero, 0   #j
addi $t5, $zero, 0  #l

div $t7, $t8, $t1 # row

rem $t6, $t8, $t1 # remainder to register $t6
beq $t6, $t1, cont
addi $t7, $t7, 1
cont:


li  $v0, 4            # 
la  $a0, string4     #  The encrypted word is:
syscall             #

la $a1, inputedS

loop1:


    lb $t9, ($a1)
    beq $t9, $zero, exitL1
    addi $a1, $a1, 1
    
    addi $a0, $t9, 0
    li $v0, 11		#use the syscall to print a character
    syscall

j loop1

exitL1:

#encryption

j ExitProgram

#----------------------------------------------------------------------------------------------------------------------------------

string_Decrypt:

li  $v0, 4            # 
la  $a0, string8     #  You chose to decrypt word
syscall             #

# From C++ program:
addi $t3, $zero, 0    #i
addi $t4, $zero, 0   #j
addi $t5, $zero, 0  #l

div $t7, $t8, $t1 # row

rem $t6, $t8, $t1 # remainder to register $t6
beq $t6, $t1, cont
addi $t7, $t7, 1
cont1:

li  $v0, 4            # 
la  $a0, string5     #  The decrypted word is
syscall             #

la $a1, inputedS

loop2:


    lb $t9, ($a1)
    beq $t9, $zero, exitL2
    addi $a1, $a1, 1
    
    addi $a0, $t9, 0
    li $v0, 11		#use the syscall to print a character
    syscall

exitL2:

#decryption

j ExitProgram




