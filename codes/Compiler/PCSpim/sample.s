	.text
	.align 2
	.globl main
main:
	addi $sp, $sp, -88
	sw $ra, 72($sp)
	li $t1, 1
	sw $t1, 76($sp)
	lw $t1, 76($sp)
	sw $t1, 0($sp)
	jal printInt
	sw $v0, 84($sp)
	li $t1, 0
	move $v0, $t1
	lw $ra, 72($sp)
	addi $sp, $sp, 88
	jr $ra
substring:
	addi $sp, $sp, -132
	sw $ra, 72($sp)
	lw $t1, 132($sp)
	sw $t1, 76($sp)
	lw $t1, 132($sp)
	sw $t1, 80($sp)
	lw $t1, 132($sp)
	sw $t1, 84($sp)
	la $t1, _L0
	sw $t1, 92($sp)
	lw $t1, 76($sp)
	lw $t2, 80($sp)
	add $t3, $t1, $t2
	sw $t3, 76($sp)
	lw $t4, 76($sp)
	lb $t1, 0($t4)
	sw $t1, 104($sp)
	lw $t1, 104($sp)
	sw $t1, 0($sp)
	jal _charToString
	sw $v0, 100($sp)
	lw $t1, 92($sp)
	sw $t1, 0($sp)
	lw $t1, 100($sp)
	sw $t1, 4($sp)
	jal _strcat
	sw $v0, 96($sp)
	lw $t1, 96($sp)
	sw $t1, 92($sp)
	#FOR   :: DEBUG
	lw $t1, 80($sp)
	li $t2, 1
	add $t3, $t1, $t2
	sw $t3, 108($sp)
	lw $t1, 108($sp)
	sw $t1, 88($sp)
_L1:
	lw $t1, 88($sp)
	lw $t2, 84($sp)
	slt $t3, $t1, $t2
	sw $t3, 112($sp)
	lw $t1, 112($sp)
	bez $t1, _L3
_L2:
	lw $t1, 76($sp)
	lw $t2, 88($sp)
	add $t3, $t1, $t2
	sw $t3, 76($sp)
	lw $t4, 76($sp)
	lb $t1, 0($t4)
	sw $t1, 124($sp)
	lw $t1, 124($sp)
	sw $t1, 0($sp)
	jal _charToString
	sw $v0, 120($sp)
	lw $t1, 92($sp)
	sw $t1, 0($sp)
	lw $t1, 120($sp)
	sw $t1, 4($sp)
	jal _strcat
	sw $v0, 116($sp)
	lw $t1, 116($sp)
	sw $t1, 92($sp)
	lw $t1, 88($sp)
	li $t2, 1
	add $t3, $t1, $t2
	sw $t3, 128($sp)
	lw $t1, 128($sp)
	sw $t1, 88($sp)
	j _L1
_L3:
	lw $t1, 92($sp)
	move $v0, $t1
	lw $ra, 72($sp)
	addi $sp, $sp, 132
	jr $ra
readString:
	addi $sp, $sp, -152
	sw $ra, 72($sp)
	la $t1, _L0
	sw $t1, 80($sp)
	jal readChar
	sw $v0, 84($sp)
	lw $t1, 84($sp)
	sw $t1, 76($sp)
	#WHILE   :: DEBUG
_L4:
	lw $t1, 76($sp)
	li $t2, 32
	seq $t3, $t1, $t2
	sw $t3, 96($sp)
	lw $t1, 96($sp)
	bnez $t1, _L9
	lw $t1, 76($sp)
	li $t2, 10
	seq $t3, $t1, $t2
	sw $t3, 100($sp)
	li $t1, 0
	sw $t1, 92($sp)
	lw $t1, 100($sp)
	bez $t1, _L10
_L9:
	li $t1, 1
	sw $t1, 92($sp)
_L10:
	lw $t1, 92($sp)
	bnez $t1, _L7
	lw $t1, 76($sp)
	li $t2, 9
	seq $t3, $t1, $t2
	sw $t3, 104($sp)
	li $t1, 0
	sw $t1, 88($sp)
	lw $t1, 104($sp)
	bez $t1, _L8
_L7:
	li $t1, 1
	sw $t1, 88($sp)
_L8:
	lw $t1, 88($sp)
	bez $t1, _L6
_L5:
	jal readChar
	sw $v0, 108($sp)
	lw $t1, 108($sp)
	sw $t1, 76($sp)
	j _L4
_L6:
	lw $t1, 76($sp)
	sw $t1, 0($sp)
	jal _charToString
	sw $v0, 116($sp)
	lw $t1, 80($sp)
	sw $t1, 0($sp)
	lw $t1, 116($sp)
	sw $t1, 4($sp)
	jal _strcat
	sw $v0, 112($sp)
	lw $t1, 112($sp)
	sw $t1, 80($sp)
	#WHILE   :: DEBUG
_L11:
	lw $t1, 76($sp)
	li $t2, 32
	sne $t3, $t1, $t2
	sw $t3, 128($sp)
	lw $t1, 128($sp)
	bez $t1, _L16
	lw $t1, 76($sp)
	li $t2, 10
	sne $t3, $t1, $t2
	sw $t3, 132($sp)
	li $t1, 1
	sw $t1, 124($sp)
	lw $t1, 132($sp)
	bnez $t1, _L17
_L16:
	li $t1, 0
	sw $t1, 124($sp)
_L17:
	lw $t1, 124($sp)
	bez $t1, _L14
	lw $t1, 76($sp)
	li $t2, 9
	sne $t3, $t1, $t2
	sw $t3, 136($sp)
	li $t1, 1
	sw $t1, 120($sp)
	lw $t1, 136($sp)
	bnez $t1, _L15
_L14:
	li $t1, 0
	sw $t1, 120($sp)
_L15:
	lw $t1, 120($sp)
	bez $t1, _L13
_L12:
	jal readChar
	sw $v0, 140($sp)
	lw $t1, 140($sp)
	sw $t1, 76($sp)
	lw $t1, 76($sp)
	sw $t1, 0($sp)
	jal _charToString
	sw $v0, 148($sp)
	lw $t1, 80($sp)
	sw $t1, 0($sp)
	lw $t1, 148($sp)
	sw $t1, 4($sp)
	jal _strcat
	sw $v0, 144($sp)
	lw $t1, 144($sp)
	sw $t1, 80($sp)
	j _L11
_L13:
	lw $t1, 80($sp)
	move $v0, $t1
	lw $ra, 72($sp)
	addi $sp, $sp, 152
	jr $ra
readLine:
	addi $sp, $sp, -100
	sw $ra, 72($sp)
	jal readChar
	sw $v0, 84($sp)
	lw $t1, 84($sp)
	sw $t1, 80($sp)
	#WHILE   :: DEBUG
_L18:
	lw $t1, 80($sp)
	li $t2, 10
	sne $t3, $t1, $t2
	sw $t3, 88($sp)
	lw $t1, 88($sp)
	bez $t1, _L20
_L19:
	lw $t1, 80($sp)
	sw $t1, 0($sp)
	jal _charToString
	sw $v0, 96($sp)
	lw $t1, 76($sp)
	sw $t1, 0($sp)
	lw $t1, 96($sp)
	sw $t1, 4($sp)
	jal _strcat
	sw $v0, 92($sp)
	lw $t1, 92($sp)
	sw $t1, 76($sp)
	j _L18
_L20:
	lw $t1, 76($sp)
	move $v0, $t1
	lw $ra, 72($sp)
	addi $sp, $sp, 100
	jr $ra
parseInt:
	addi $sp, $sp, -120
	sw $ra, 72($sp)
	lw $t1, 120($sp)
	sw $t1, 76($sp)
	li $t1, 0
	sw $t1, 80($sp)
	#FOR   :: DEBUG
	li $t1, 0
	sw $t1, 84($sp)
_L21:
	lw $t1, 76($sp)
	sw $t1, 0($sp)
	jal _strlen
	sw $v0, 88($sp)
	lw $t1, 84($sp)
	lw $t2, 88($sp)
	slt $t3, $t1, $t2
	sw $t3, 92($sp)
	lw $t1, 92($sp)
	bez $t1, _L23
_L22:
	lw $t1, 80($sp)
	li $t2, 10
	sub $t3, $t1, $t2
	sw $t3, 96($sp)
	lw $t1, 76($sp)
	lw $t2, 84($sp)
	add $t3, $t1, $t2
	sw $t3, 76($sp)
	lw $t4, 76($sp)
	lb $t1, 0($t4)
	sw $t1, 100($sp)
	lw $t1, 100($sp)
	sw $t1, 0($sp)
	jal ord
	sw $v0, 104($sp)
	lw $t1, 96($sp)
	lw $t2, 104($sp)
	add $t3, $t1, $t2
	sw $t3, 108($sp)
	lw $t1, 108($sp)
	li $t2, 48
	sub $t3, $t1, $t2
	sw $t3, 112($sp)
	lw $t1, 112($sp)
	sw $t1, 80($sp)
	lw $t1, 84($sp)
	li $t2, 1
	add $t3, $t1, $t2
	sw $t3, 116($sp)
	lw $t1, 116($sp)
	sw $t1, 84($sp)
	j _L21
_L23:
	lw $t1, 80($sp)
	move $v0, $t1
	lw $ra, 72($sp)
	addi $sp, $sp, 120
	jr $ra
fillIntArray:
	addi $sp, $sp, -96
	sw $ra, 72($sp)
	lw $t1, 96($sp)
	sw $t1, 76($sp)
	lw $t1, 96($sp)
	sw $t1, 80($sp)
	#FOR   :: DEBUG
	li $t1, 0
	sw $t1, 84($sp)
_L24:
	lw $t1, 84($sp)
	lw $t4, 76($sp)
	lw $t2, 0($t4)
	slt $t3, $t1, $t2
	sw $t3, 88($sp)
	lw $t1, 88($sp)
	bez $t1, _L26
_L25:
	li $t1, 4
	lw $t2, 84($sp)
	sub $t3, $t1, $t2
	sw $t3, 84($sp)
	lw $t1, 76($sp)
	lw $t2, 84($sp)
	add $t3, $t1, $t2
	sw $t3, 76($sp)
	lw $t1, 80($sp)
	lw $t4, 76($sp)
	sw $t1, 4($t4)
	lw $t1, 84($sp)
	li $t2, 1
	add $t3, $t1, $t2
	sw $t3, 92($sp)
	lw $t1, 92($sp)
	sw $t1, 84($sp)
	j _L24
_L26:
	li $t1, 1
	move $v0, $t1
	lw $ra, 72($sp)
	addi $sp, $sp, 96
	jr $ra
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
    lw $t1, 4($sp)
    addi $sp, $sp, -8
    sw $ra, 4($sp)	#
    sw $t0, 0($sp)	#
    jal _strlen
    move $t2, $v0
    sw $t1, 0($sp)  #
    jal _strlen
    move $t3, $v0
    add $a0, $t2, $t3
    addi $a0, $a0, 1
    li $v0,9
    syscall
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
    addi $t5, $t1, 1
    j _strcat_l2
_strcat_l3:
    sb $zero, 0($t5)
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
