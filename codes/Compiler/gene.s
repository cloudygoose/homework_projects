	.text
	.align 2
	.globl main
main:
	addi $sp, $sp, -136
	sw $ra, 112($sp)
	li $t3, 1
	li $t2, 0
	sub $t3, $t2, $t3
	sw $t3, 0($sp)
	jal printInt
	li $t2, 0
	move $v0, $t2
	lw $ra, 112($sp)
	addi $sp, $sp, 136
	jr $ra
	lw $ra, 112($sp)
	addi $sp, $sp, 136
	jr $ra
substring:
	addi $sp, $sp, -204
	sw $ra, 112($sp)
	 lw $t2, 204($sp)
	move $t4, $t2
	 lw $t2, 208($sp)
	move $t5, $t2
	 lw $t2, 212($sp)
	move $t6, $t2
	la $t2, _L0
	move $t7, $t2
	move $t3, $t4
	move $t2, $t5
	add $t3, $t3, $t2
	lb $t2, 0($t3)
	sw $t2, 0($sp)
	sw $t4, 116($sp)
	sw $t5, 120($sp)
	sw $t6, 124($sp)
	sw $t7, 132($sp)
	jal _charToString
	lw $t4, 116($sp)
	lw $t5, 120($sp)
	lw $t6, 124($sp)
	lw $t7, 132($sp)
	move $t2, $v0
	sw $t7, 0($sp)
	sw $t2, 4($sp)
	sw $t4, 116($sp)
	sw $t5, 120($sp)
	sw $t6, 124($sp)
	jal _strcat
	lw $t4, 116($sp)
	lw $t5, 120($sp)
	lw $t6, 124($sp)
	move $t7, $v0
	#FOR   :: DEBUG
	li $t2, 1
	addi $t8, $t5, 1
_L1:
	add $t2, $t5, $t6
	bge  $t8, $t2, _L3
_L2:
	move $t3, $t4
	move $t2, $t8
	add $t3, $t3, $t2
	lb $t2, 0($t3)
	sw $t2, 0($sp)
	sw $t4, 116($sp)
	sw $t5, 120($sp)
	sw $t6, 124($sp)
	sw $t8, 128($sp)
	sw $t7, 132($sp)
	jal _charToString
	lw $t4, 116($sp)
	lw $t5, 120($sp)
	lw $t6, 124($sp)
	lw $t8, 128($sp)
	lw $t7, 132($sp)
	move $t2, $v0
	sw $t7, 0($sp)
	sw $t2, 4($sp)
	sw $t4, 116($sp)
	sw $t5, 120($sp)
	sw $t6, 124($sp)
	sw $t8, 128($sp)
	jal _strcat
	lw $t4, 116($sp)
	lw $t5, 120($sp)
	lw $t6, 124($sp)
	lw $t8, 128($sp)
	move $t7, $v0
	li $t2, 1
	addi $t8, $t8, 1
	j _L1
_L3:
	move $v0, $t7
	lw $ra, 112($sp)
	addi $sp, $sp, 204
	jr $ra
	lw $ra, 112($sp)
	addi $sp, $sp, 204
	jr $ra
readString:
	addi $sp, $sp, -200
	sw $ra, 112($sp)
	la $t2, _L0
	move $t4, $t2
	sw $t4, 120($sp)
	jal readChar
	lw $t4, 120($sp)
	move $t5, $v0
	#WHILE   :: DEBUG
_L4:
	li $t2, 32
	seq $t2, $t5, $t2
	bnez $t2, _L9
	li $t2, 10
	seq $t2, $t5, $t2
	li $t3, 0
	beqz $t2, _L10
_L9:
	li $t3, 1
_L10:
	bnez $t3, _L7
	li $t2, 9
	seq $t2, $t5, $t2
	li $t3, 0
	beqz $t2, _L8
_L7:
	li $t3, 1
_L8:
	beqz $t3, _L6
_L5:
	sw $t4, 120($sp)
	jal readChar
	lw $t4, 120($sp)
	move $t5, $v0
	j _L4
_L6:
	sw $t5, 0($sp)
	sw $t4, 120($sp)
	jal _charToString
	lw $t4, 120($sp)
	move $t2, $v0
	sw $t4, 0($sp)
	sw $t2, 4($sp)
	jal _strcat
	move $t4, $v0
	sw $t4, 120($sp)
	jal readChar
	lw $t4, 120($sp)
	move $t5, $v0
	#WHILE   :: DEBUG
_L11:
	li $t2, 32
	sne $t2, $t5, $t2
	beqz $t2, _L16
	li $t2, 10
	sne $t2, $t5, $t2
	li $t3, 1
	bnez $t2, _L17
_L16:
	li $t3, 0
_L17:
	beqz $t3, _L14
	li $t2, 9
	sne $t2, $t5, $t2
	li $t3, 1
	bnez $t2, _L15
_L14:
	li $t3, 0
_L15:
	beqz $t3, _L13
_L12:
	sw $t5, 0($sp)
	sw $t4, 120($sp)
	jal _charToString
	lw $t4, 120($sp)
	move $t2, $v0
	sw $t4, 0($sp)
	sw $t2, 4($sp)
	jal _strcat
	move $t4, $v0
	sw $t4, 120($sp)
	jal readChar
	lw $t4, 120($sp)
	move $t5, $v0
	j _L11
_L13:
	move $v0, $t4
	lw $ra, 112($sp)
	addi $sp, $sp, 200
	jr $ra
	lw $ra, 112($sp)
	addi $sp, $sp, 200
	jr $ra
readLine:
	addi $sp, $sp, -156
	sw $ra, 112($sp)
	jal readChar
	move $t4, $v0
	#WHILE   :: DEBUG
_L18:
	li $t2, 10
	seq $t2, $t4, $t2
	beqz $t2, _L20
_L19:
	jal readChar
	move $t4, $v0
	j _L18
_L20:
	la $t2, _L0
	move $t3, $t2
	sw $t4, 0($sp)
	sw $t3, 128($sp)
	sw $t4, 120($sp)
	jal _charToString
	lw $t3, 128($sp)
	lw $t4, 120($sp)
	move $t2, $v0
	sw $t3, 0($sp)
	sw $t2, 4($sp)
	sw $t4, 120($sp)
	jal _strcat
	lw $t4, 120($sp)
	move $t3, $v0
	#WHILE   :: DEBUG
_L21:
	li $t2, 10
	sne $t2, $t4, $t2
	beqz $t2, _L23
_L22:
	sw $t4, 0($sp)
	sw $t4, 120($sp)
	sw $t3, 116($sp)
	jal _charToString
	lw $t4, 120($sp)
	lw $t3, 116($sp)
	move $t2, $v0
	sw $t3, 0($sp)
	sw $t2, 4($sp)
	sw $t4, 120($sp)
	jal _strcat
	lw $t4, 120($sp)
	move $t3, $v0
	j _L21
_L23:
	move $v0, $t3
	lw $ra, 112($sp)
	addi $sp, $sp, 156
	jr $ra
	lw $ra, 112($sp)
	addi $sp, $sp, 156
	jr $ra
parseInt:
	addi $sp, $sp, -176
	sw $ra, 112($sp)
	 lw $t2, 176($sp)
	move $t6, $t2
	li $t3, 0
	#FOR   :: DEBUG
	li $t5, 0
_L24:
	sw $t6, 0($sp)
	sw $t6, 116($sp)
	sw $t3, 120($sp)
	sw $t5, 124($sp)
	jal _strlen
	lw $t6, 116($sp)
	lw $t3, 120($sp)
	lw $t5, 124($sp)
	move $t2, $v0
	bge  $t5, $t2, _L26
_L25:
	li $t2, 10
	mul $t4, $t3, $t2
	move $t3, $t6
	move $t2, $t5
	add $t3, $t3, $t2
	lb $t2, 0($t3)
	sw $t2, 0($sp)
	sw $t6, 116($sp)
	sw $t4, 132($sp)
	sw $t5, 124($sp)
	jal ord
	lw $t6, 116($sp)
	lw $t4, 132($sp)
	lw $t5, 124($sp)
	move $t2, $v0
	add $t3, $t4, $t2
	li $t2, 48
	sub $t3, $t3, $t2
	li $t2, 1
	addi $t5, $t5, 1
	j _L24
_L26:
	move $v0, $t3
	lw $ra, 112($sp)
	addi $sp, $sp, 176
	jr $ra
	lw $ra, 112($sp)
	addi $sp, $sp, 176
	jr $ra
fillIntArray:
	addi $sp, $sp, -160
	sw $ra, 112($sp)
	 lw $t2, 160($sp)
	move $t7, $t2
	 lw $t2, 164($sp)
	move $t6, $t2
	#FOR   :: DEBUG
	li $t5, 0
_L27:
	lw $t2, 0($t7)
	bge  $t5, $t2, _L29
_L28:
	move $t4, $t7
	move $t3, $t5
	li $t2, 4
	mul $t3, $t2, $t3
	add $t4, $t4, $t3
	sw $t6, 4($t4)
	li $t2, 1
	addi $t5, $t5, 1
	j _L27
_L29:
	li $t2, 1
	move $v0, $t2
	lw $ra, 112($sp)
	addi $sp, $sp, 160
	jr $ra
	lw $ra, 112($sp)
	addi $sp, $sp, 160
	jr $ra
native:
_malloc:  				#done
    lw $a0, 0($sp)
    li $v0, 9
    syscall
    jr $ra

_strcmp:   			#done t0<t1 r -1 t0=t1 r 0 t0>t1 r 1
    lw $t0, 0($sp)
    lw $t1, 4($sp)
_strcmp_begin:
    lb $t2, 0($t0)
    lb $t3, 0($t1)
    blt $t2, $t3, _strcmp_less
    bgt $t2, $t3, _strcmp_greater
    beq $t2, $zero, _strcmp_equal
    addi $t0, $t0, 1
    addi $t1, $t1, 1
    j _strcmp_begin
_strcmp_less:				
    li $v0, -1
    jr $ra
_strcmp_greater:
    li $v0, 1
    jr $ra
_strcmp_equal:
    li $v0, 0
    jr $ra

_intToString:			#done
    lw $t0, 0($sp)
    li $t1, 0
    bge $t0, $zero, intToString_l1
    li $t1, 1
    neg $t0, $t0
intToString_l1:
    move $t3, $t0
    li $t2, 0
intToString_l2:
    addi $t2, $t2, 1
    div $t3, $t3, 10
    bne $t3, $zero, intToString_l2
    addi $a0, $t2, 1
    beq $t1, $zero, intToString_l3
    addi $a0, $a0, 1
intToString_l3:
    li $v0, 9
    move $t3, $a0
    syscall
    beq $t1, $zero, intToString_l5
    li $t4, 45
    sb $t4, 0($v0)
intToString_l5:
    add $t3, $v0, $t3
    addi $t3, $t3, -1
    sb $zero, 0($t3)    
    addi $t3, $t3, -1
intToString_l4:
    rem $t4, $t0, 10
    addi $t4, $t4, 48
    sb $t4, 0($t3)
    addi $t3, $t3, -1
    div $t0, $t0, 10
    bne $t0, $zero, intToString_l4
    jr $ra

_charToString: 		#done
    li $a0, 2
    li $v0, 9
    syscall
    lb $t0, 0($sp)
    sb $t0, 0($v0)
    sb $zero, 1($v0)
    jr $ra

_strlen:
    lw $t0, 0($sp)
    li $v0, 0
_strlen_begin:
    lb $t1, 0($t0)
    beq $t1, $zero, _strlen_end
    addi $t0, $t0, 1
    addi $v0, $v0, 1
    j _strlen_begin
_strlen_end:
    jr $ra

_strcat:			#done  t0.t1
    lw $t0, 0($sp)
    move $t7, $t0
    lw $t6, 4($sp)
    addi $sp, $sp, -8
    sw $ra, 4($sp)	#aa
    sw $t0, 0($sp)	#aa
    jal _strlen
    move $t2, $v0
    move $t1, $t6
    sw $t1, 0($sp)  #aa
    jal _strlen
    move $t1, $t6
    move $t3, $v0
    add $a0, $t2, $t3
    addi $a0, $a0, 1
    li $v0,9
    syscall
    move $t1, $t6
	move $t0, $t7
    move $t5, $v0
_strcat_l1:
    lb $t4, 0($t0)
    beq $t4, $zero, _strcat_l2
    sb $t4, 0($t5)
    addi $t0, $t0, 1
    addi $t5, $t5, 1
    j _strcat_l1
_strcat_l2:
    lb $t4, 0($t1)
    beq $t4, $zero, _strcat_l3
    sb $t4, 0($t5)
    addi $t1, $t1, 1
    addi $t5, $t5, 1	#wrong
    j _strcat_l2
_strcat_l3:
    sb $zero, 0($t5)
    lw $ra, 4($sp)	#myself
    addi $sp, $sp, 8
    jr $ra

readInt:			#done
    li $v0, 5
    syscall
    jr $ra

readChar:			#done
    li $v0, 8
    move $a0, $sp
    li $a1, 2
    syscall
    lb $v0, 0($sp)
    jr $ra

printInt:			#done
    li $v0, 1
    lw $a0, 0($sp)
    syscall
    jr $ra

printChar:			#done
    sb $zero, 1($sp)
    li $v0, 4
    move $a0, $sp
    syscall
    jr $ra

printString:		#done
    lw $a0, 0($sp)
    li $v0, 4
    syscall
    jr $ra

printLine:			#done
    lw $a0, 0($sp)
    li $v0, 4
    syscall
    li $t0, 10
    sb $t0, 0($sp)
    sb $zero, 1($sp)
    li $v0, 4
    move $a0, $sp
    syscall
    jr $ra

ord:		#myself
	lb	$v0 0($sp)
	jr $ra

chr: 		#myself
	lb	$v0 0($sp)
	jr $ra

	.data
_L0:
	.asciiz ""
