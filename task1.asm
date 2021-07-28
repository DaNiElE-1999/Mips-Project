                         #task 1 MIPS solution

# declare variables
.data 
#
funny: .asciiz " Task 1 v 1.0,0 *MIPS edition*\n\n"
funny1: .asciiz " @author Daniele Llazo\n\n"
entermsg: .asciiz "Enter a number:\n"
listmsg: .asciiz "List of Automorphic numbers between 1 to \n"   # from 1 to N
startmsg: .asciiz "Number : Square\n"
dbdots: .asciiz " : "
space: .asciiz "\n"
# declare variables

.text 

main: #

li  $v0, 4            # 
la  $a0, funny       #  :-)
syscall             #
li  $v0, 4            # 
la  $a0, funny1      # :-)
syscall             #

# program asks to enter a number
li  $v0, 4            #
la  $a0, entermsg    # 
syscall             #

# Get the number
li $v0, 5
syscall

# Store the number in $t1 ($t1 -> n)
move $t1, $v0

li  $v0, 4            # 
la  $a0, startmsg    # Number : Square
syscall             #

addi $t0, $zero, 1 # i=1
for: #beggining of the first loop
bgt $t0, $t1, exitFor #for loop condition (if i > n, branch)

#
add $t2, $t0, $zero #cn from c++ program $t2 
add $t3, $t0, $zero #num from c++ program $t3
mul $t9, $t2, $t2 #square is to register $t9
addi $t4, $zero, 10 #t from c++ program $t4
addi $t5, $zero, 0 #equal from c++ program $t5
#

#
while: # beggining of the while loop from c++ program
ble $t2, 0, endWhile #while loop condition

rem $t6, $t9, $t4 # remainder to register $t6

beq $t3, $t6, numEQr # if condition

div $t2, $t2, 10 # cn = cn / 10;
addi $t7, $zero, 10 #
mult $t4, $t7 # multiply t with 10
mflo $t4 # t is still in register $t4

j while #jumps to the while loop begining
endWhile:#ends while loop
#
#jal numEQr
addi $t0, $t0, 1 # i incrementation with 1
beq $t5, 1,IFequalIS1

j for # jumps to the beggining of the first loop if condition met, else exit </
exitFor:
# Syscall to end the program
li $v0, 10  
syscall

# Labels -----------------------
numEQr: 
addi $t5, $zero, 1 #equal gets value 1
j endWhile

IFequalIS1: # if(equal == 1)
# cout<<num<<" : "<<sq<<endl;

li $v0, 1
add $a0, $t3, $zero #num
syscall

li  $v0, 4            #  :
la  $a0, dbdots       #  :
syscall

li $v0, 1
add $a0, $t9, $zero #square
syscall

li  $v0, 4            # /n
la  $a0, space       # /n
syscall 

j for

 


