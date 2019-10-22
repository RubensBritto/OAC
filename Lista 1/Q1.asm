addi, $a0, $zero, 2 #variavel a
addi, $a1, $zero, 1 #variavel b
add, $a2, $zero, $a0 # m = a	
slt $t0, $a1, $a2 #if ( b < m)
beq $t0, $zero, Else #if slt == 0 
add $a2, $zero, $a1 # m = b
j Exit
Else: addi $a2, $zero, 0 # m =0
Exit:  

 