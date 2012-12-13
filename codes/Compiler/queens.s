	.text
	.align 2
	.globl main
main:
	addi $sp, $sp, -320
	sw $ra, 112($sp)
	lw $t2, 320($sp)
	li $t7, 8
	move $t3, $t7
	move $t2, $t7
	sll $t3, $t3, 2
	addi $t3, $t3, 4
	sw $t3, 0($sp)
	sw $t7, 120($sp)
	sw $t2, 140($sp)
	jal _malloc
	lw $t7, 120($sp)
	lw $t2, 140($sp)
	move $t6, $v0
	sw $t2, 0($t6)
	move $t3, $t7
	move $t2, $t7
	sll $t3, $t3, 2
	addi $t3, $t3, 4
	sw $t3, 0($sp)
	sw $t7, 120($sp)
	sw $t6, 124($sp)
	sw $t2, 148($sp)
	jal _malloc
	lw $t7, 120($sp)
	lw $t6, 124($sp)
	lw $t2, 148($sp)
	move $t5, $v0
	sw $t2, 0($t5)
	li $t2, 2
	move $t3, $t2
	sll $t3, $t3, 2
	addi $t3, $t3, 4
	sw $t3, 0($sp)
	sw $t7, 120($sp)
	sw $t6, 124($sp)
	sw $t5, 128($sp)
	sw $t2, 160($sp)
	jal _malloc
	lw $t7, 120($sp)
	lw $t6, 124($sp)
	lw $t5, 128($sp)
	lw $t2, 160($sp)
	move $t4, $v0
	sw $t2, 0($t4)
	move $t8, $t4
	li $t2, 0
	sll $t2, $t2, 2
	add $t8, $t8, $t2
	add $t3, $t7, $t7
	li $t2, 1
	sub $t3, $t3, $t2
	move $t2, $t3
	sll $t2, $t2, 2
	addi $t2, $t2, 4
	sw $t2, 0($sp)
	sw $t7, 120($sp)
	sw $t6, 124($sp)
	sw $t5, 128($sp)
	sw $t3, 188($sp)
	sw $t4, 132($sp)
	sw $t8, 164($sp)
	jal _malloc
	lw $t7, 120($sp)
	lw $t6, 124($sp)
	lw $t5, 128($sp)
	lw $t3, 188($sp)
	lw $t4, 132($sp)
	lw $t8, 164($sp)
	move $t2, $v0
	sw $t3, 0($t2)
	sw $t2, 4($t8)
	move $t8, $t4
	li $t2, 1
	sll $t2, $t2, 2
	add $t8, $t8, $t2
	add $t3, $t7, $t7
	li $t2, 1
	sub $t3, $t3, $t2
	move $t2, $t3
	sll $t2, $t2, 2
	addi $t2, $t2, 4
	sw $t2, 0($sp)
	sw $t7, 120($sp)
	sw $t6, 124($sp)
	sw $t5, 128($sp)
	sw $t4, 132($sp)
	sw $t8, 196($sp)
	sw $t3, 220($sp)
	jal _malloc
	lw $t7, 120($sp)
	lw $t6, 124($sp)
	lw $t5, 128($sp)
	lw $t4, 132($sp)
	lw $t8, 196($sp)
	lw $t3, 220($sp)
	move $t2, $v0
	sw $t3, 0($t2)
	sw $t2, 4($t8)
	li $t2, 0
	sw $t6, 0($sp)
	sw $t2, 4($sp)
	sw $t7, 120($sp)
	sw $t6, 124($sp)
	sw $t5, 128($sp)
	sw $t4, 132($sp)
	jal fillIntArray
	lw $t7, 120($sp)
	lw $t6, 124($sp)
	lw $t5, 128($sp)
	lw $t4, 132($sp)
	li $t2, 0
	sw $t5, 0($sp)
	sw $t2, 4($sp)
	sw $t7, 120($sp)
	sw $t6, 124($sp)
	sw $t5, 128($sp)
	sw $t4, 132($sp)
	jal fillIntArray
	lw $t7, 120($sp)
	lw $t6, 124($sp)
	lw $t5, 128($sp)
	lw $t4, 132($sp)
	move $t3, $t4
	li $t2, 0
	sll $t2, $t2, 2
	add $t3, $t3, $t2
	lw $t2, 4($t3)
	move $t3, $t2
	li $t2, 0
	sw $t3, 0($sp)
	sw $t2, 4($sp)
	sw $t7, 120($sp)
	sw $t6, 124($sp)
	sw $t5, 128($sp)
	sw $t4, 132($sp)
	jal fillIntArray
	lw $t7, 120($sp)
	lw $t6, 124($sp)
	lw $t5, 128($sp)
	lw $t4, 132($sp)
	move $t3, $t4
	li $t2, 1
	sll $t2, $t2, 2
	add $t3, $t3, $t2
	lw $t2, 4($t3)
	move $t3, $t2
	li $t2, 0
	sw $t3, 0($sp)
	sw $t2, 4($sp)
	sw $t7, 120($sp)
	sw $t6, 124($sp)
	sw $t5, 128($sp)
	sw $t4, 132($sp)
	jal fillIntArray
	lw $t7, 120($sp)
	lw $t6, 124($sp)
	lw $t5, 128($sp)
	lw $t4, 132($sp)
	li $t2, 0
	sw $t7, 0($sp)
	sw $t6, 4($sp)
	sw $t5, 8($sp)
	sw $t4, 12($sp)
	sw $t2, 16($sp)
	jal search
	lw $ra, 112($sp)
	addi $sp, $sp, 320
	jr $ra
printBoard:
	addi $sp, $sp, -196
	sw $ra, 112($sp)
	lw $t2, 196($sp)
	move $t6, $t2
	#FOR   :: DEBUG
	li $t5, 0
_L0:
	lw $t2, 0($t6)
	bge  $t5, $t2, _L2
_L1:
	#FOR   :: DEBUG
	li $t4, 0
_L3:
	lw $t2, 0($t6)
	bge  $t4, $t2, _L5
_L4:
	#IF   :: DEBUG
	move $t3, $t6
	move $t2, $t5
	sll $t2, $t2, 2
	add $t3, $t3, $t2
	lw $t2, 4($t3)
	seq $t2, $t2, $t4
	beqz $t2, _L6
	la $t2, _L8
	sw $t2, 0($sp)
	sw $t4, 124($sp)
	sw $t6, 116($sp)
	sw $t5, 120($sp)
	jal printString
	lw $t4, 124($sp)
	lw $t6, 116($sp)
	lw $t5, 120($sp)
	j _L7
_L6:
	la $t2, _L9
	sw $t2, 0($sp)
	sw $t4, 124($sp)
	sw $t6, 116($sp)
	sw $t5, 120($sp)
	jal printString
	lw $t4, 124($sp)
	lw $t6, 116($sp)
	lw $t5, 120($sp)
_L7:
	addi $t4, $t4, 1
	j _L3
_L5:
	li $t2, 10
	sw $t2, 0($sp)
	sw $t6, 116($sp)
	sw $t5, 120($sp)
	jal printChar
	lw $t6, 116($sp)
	lw $t5, 120($sp)
	addi $t5, $t5, 1
	j _L0
_L2:
	li $t2, 10
	sw $t2, 0($sp)
	jal printChar
	lw $ra, 112($sp)
	addi $sp, $sp, 196
	jr $ra
search:
	addi $sp, $sp, -504
	sw $ra, 112($sp)
	lw $t2, 504($sp)
	move $t8, $t2
	lw $t2, 508($sp)
	move $t7, $t2
	lw $t2, 512($sp)
	move $t6, $t2
	lw $t2, 516($sp)
	move $t5, $t2
	lw $t2, 520($sp)
	move $t4, $t2
	#IF   :: DEBUG
	seq $t2, $t4, $t8
	beqz $t2, _L10
	sw $t6, 0($sp)
	jal printBoard
	j _L11
_L10:
	#FOR   :: DEBUG
	li $t3, 0
_L12:
	bge  $t3, $t8, _L14
_L13:
	#IF   :: DEBUG
	move $t9, $t7
	move $t2, $t3
	sll $t2, $t2, 2
	add $t9, $t9, $t2
	lw $t9, 4($t9)
	li $t2, 0
	seq $t2, $t9, $t2
	beqz $t2, _L19
	move $t9, $t5
	li $t2, 0
	sll $t2, $t2, 2
	add $t9, $t9, $t2
	lw $t2, 4($t9)
	move $t9, $t2
	add $t2, $t3, $t4
	sll $t2, $t2, 2
	add $t9, $t9, $t2
	lw $t9, 4($t9)
	li $t2, 0
	seq $t2, $t9, $t2
	li $t9, 1
	bnez $t2, _L20
_L19:
	li $t9, 0
_L20:
	beqz $t9, _L17
	move $t9, $t5
	li $t2, 1
	sll $t2, $t2, 2
	add $t9, $t9, $t2
	lw $t2, 4($t9)
	move $s0, $t2
	add $t9, $t3, $t8
	li $t2, 1
	sub $t2, $t9, $t2
	sub $t2, $t2, $t4
	sll $t2, $t2, 2
	add $s0, $s0, $t2
	lw $t9, 4($s0)
	li $t2, 0
	seq $t2, $t9, $t2
	li $t9, 1
	bnez $t2, _L18
_L17:
	li $t9, 0
_L18:
	beqz $t9, _L15
	move $t9, $t7
	move $t2, $t3
	sll $t2, $t2, 2
	add $t9, $t9, $t2
	move $s0, $t5
	li $t2, 0
	sll $t2, $t2, 2
	add $s0, $s0, $t2
	lw $t2, 4($s0)
	move $s1, $t2
	add $t2, $t3, $t4
	sll $t2, $t2, 2
	add $s1, $s1, $t2
	move $s0, $t5
	li $t2, 1
	sll $t2, $t2, 2
	add $s0, $s0, $t2
	lw $t2, 4($s0)
	move $s2, $t2
	add $s0, $t3, $t8
	li $t2, 1
	sub $t2, $s0, $t2
	sub $t2, $t2, $t4
	sll $t2, $t2, 2
	add $s2, $s2, $t2
	li $t2, 1
	sw $t2, 4($s2)
	lw $t2, 4($s2)
	sw $t2, 4($s1)
	lw $t2, 4($s1)
	sw $t2, 4($t9)
	move $t9, $t6
	move $t2, $t4
	sll $t2, $t2, 2
	add $t9, $t9, $t2
	sw $t3, 4($t9)
	addi $t2, $t4, 1
	sw $t8, 0($sp)
	sw $t7, 4($sp)
	sw $t6, 8($sp)
	sw $t5, 12($sp)
	sw $t2, 16($sp)
	sw $t4, 132($sp)
	sw $t3, 136($sp)
	sw $t5, 128($sp)
	sw $t6, 124($sp)
	sw $t7, 120($sp)
	sw $t8, 116($sp)
	jal search
	lw $t4, 132($sp)
	lw $t3, 136($sp)
	lw $t5, 128($sp)
	lw $t6, 124($sp)
	lw $t7, 120($sp)
	lw $t8, 116($sp)
	move $t9, $t7
	move $t2, $t3
	sll $t2, $t2, 2
	add $t9, $t9, $t2
	move $s0, $t5
	li $t2, 0
	sll $t2, $t2, 2
	add $s0, $s0, $t2
	lw $t2, 4($s0)
	move $s1, $t2
	add $t2, $t3, $t4
	sll $t2, $t2, 2
	add $s1, $s1, $t2
	move $s0, $t5
	li $t2, 1
	sll $t2, $t2, 2
	add $s0, $s0, $t2
	lw $t2, 4($s0)
	move $s2, $t2
	add $s0, $t3, $t8
	li $t2, 1
	sub $t2, $s0, $t2
	sub $t2, $t2, $t4
	sll $t2, $t2, 2
	add $s2, $s2, $t2
	li $t2, 0
	sw $t2, 4($s2)
	lw $t2, 4($s2)
	sw $t2, 4($s1)
	lw $t2, 4($s1)
	sw $t2, 4($t9)
	j _L16
_L15:
_L16:
	addi $t3, $t3, 1
	j _L12
_L14:
_L11:
	lw $ra, 112($sp)
	addi $sp, $sp, 504
	jr $ra
substring:
	addi $sp, $sp, -196
	sw $ra, 112($sp)
	lw $t2, 196($sp)
	move $t5, $t2
	lw $t2, 200($sp)
	move $t6, $t2
	lw $t2, 204($sp)
	move $t7, $t2
	la $t2, _L21
	move $t4, $t2
	move $t3, $t5
	move $t2, $t6
	add $t3, $t3, $t2
	lb $t2, 0($t3)
	sw $t2, 0($sp)
	sw $t5, 116($sp)
	sw $t7, 124($sp)
	sw $t6, 120($sp)
	sw $t4, 132($sp)
	jal _charToString
	lw $t5, 116($sp)
	lw $t7, 124($sp)
	lw $t6, 120($sp)
	lw $t4, 132($sp)
	move $t2, $v0
	sw $t4, 0($sp)
	sw $t2, 4($sp)
	sw $t5, 116($sp)
	sw $t7, 124($sp)
	sw $t6, 120($sp)
	jal _strcat
	lw $t5, 116($sp)
	lw $t7, 124($sp)
	lw $t6, 120($sp)
	move $t4, $v0
	#FOR   :: DEBUG
	addi $t8, $t6, 1
_L22:
	add $t2, $t6, $t7
	bge  $t8, $t2, _L24
_L23:
	move $t3, $t5
	move $t2, $t8
	add $t3, $t3, $t2
	lb $t2, 0($t3)
	sw $t2, 0($sp)
	sw $t5, 116($sp)
	sw $t7, 124($sp)
	sw $t6, 120($sp)
	sw $t4, 132($sp)
	sw $t8, 128($sp)
	jal _charToString
	lw $t5, 116($sp)
	lw $t7, 124($sp)
	lw $t6, 120($sp)
	lw $t4, 132($sp)
	lw $t8, 128($sp)
	move $t2, $v0
	sw $t4, 0($sp)
	sw $t2, 4($sp)
	sw $t5, 116($sp)
	sw $t7, 124($sp)
	sw $t6, 120($sp)
	sw $t8, 128($sp)
	jal _strcat
	lw $t5, 116($sp)
	lw $t7, 124($sp)
	lw $t6, 120($sp)
	lw $t8, 128($sp)
	move $t4, $v0
	addi $t8, $t8, 1
	j _L22
_L24:
	move $v0, $t4
	lw $ra, 112($sp)
	addi $sp, $sp, 196
	jr $ra
	lw $ra, 112($sp)
	addi $sp, $sp, 196
	jr $ra
readString:
	addi $sp, $sp, -200
	sw $ra, 112($sp)
	la $t2, _L21
	move $t4, $t2
	sw $t4, 120($sp)
	jal readChar
	lw $t4, 120($sp)
	move $t5, $v0
	#WHILE   :: DEBUG
_L25:
	li $t2, 32
	seq $t2, $t5, $t2
	bnez $t2, _L30
	li $t2, 10
	seq $t2, $t5, $t2
	li $t3, 0
	beqz $t2, _L31
_L30:
	li $t3, 1
_L31:
	bnez $t3, _L28
	li $t2, 9
	seq $t2, $t5, $t2
	li $t3, 0
	beqz $t2, _L29
_L28:
	li $t3, 1
_L29:
	beqz $t3, _L27
_L26:
	sw $t4, 120($sp)
	jal readChar
	lw $t4, 120($sp)
	move $t5, $v0
	j _L25
_L27:
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
_L32:
	li $t2, 32
	sne $t2, $t5, $t2
	beqz $t2, _L37
	li $t2, 10
	sne $t2, $t5, $t2
	li $t3, 1
	bnez $t2, _L38
_L37:
	li $t3, 0
_L38:
	beqz $t3, _L35
	li $t2, 9
	sne $t2, $t5, $t2
	li $t3, 1
	bnez $t2, _L36
_L35:
	li $t3, 0
_L36:
	beqz $t3, _L34
_L33:
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
	j _L32
_L34:
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
_L39:
	li $t2, 10
	seq $t2, $t4, $t2
	beqz $t2, _L41
_L40:
	jal readChar
	move $t4, $v0
	j _L39
_L41:
	la $t2, _L21
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
_L42:
	li $t2, 10
	sne $t2, $t4, $t2
	beqz $t2, _L44
_L43:
	sw $t4, 0($sp)
	sw $t3, 116($sp)
	sw $t4, 120($sp)
	jal _charToString
	lw $t3, 116($sp)
	lw $t4, 120($sp)
	move $t2, $v0
	sw $t3, 0($sp)
	sw $t2, 4($sp)
	sw $t4, 120($sp)
	jal _strcat
	lw $t4, 120($sp)
	move $t3, $v0
	j _L42
_L44:
	move $v0, $t3
	lw $ra, 112($sp)
	addi $sp, $sp, 156
	jr $ra
	lw $ra, 112($sp)
	addi $sp, $sp, 156
	jr $ra
parseInt:
	addi $sp, $sp, -172
	sw $ra, 112($sp)
	lw $t2, 172($sp)
	move $t6, $t2
	li $t3, 0
	#FOR   :: DEBUG
	li $t5, 0
_L45:
	sw $t6, 0($sp)
	sw $t5, 124($sp)
	sw $t3, 120($sp)
	sw $t6, 116($sp)
	jal _strlen
	lw $t5, 124($sp)
	lw $t3, 120($sp)
	lw $t6, 116($sp)
	move $t2, $v0
	bge  $t5, $t2, _L47
_L46:
	li $t2, 10
	mul $t4, $t3, $t2
	move $t3, $t6
	move $t2, $t5
	add $t3, $t3, $t2
	lb $t2, 0($t3)
	sw $t2, 0($sp)
	sw $t4, 132($sp)
	sw $t5, 124($sp)
	sw $t6, 116($sp)
	jal ord
	lw $t4, 132($sp)
	lw $t5, 124($sp)
	lw $t6, 116($sp)
	move $t2, $v0
	add $t3, $t4, $t2
	li $t2, 48
	sub $t3, $t3, $t2
	addi $t5, $t5, 1
	j _L45
_L47:
	move $v0, $t3
	lw $ra, 112($sp)
	addi $sp, $sp, 172
	jr $ra
	lw $ra, 112($sp)
	addi $sp, $sp, 172
	jr $ra
fillIntArray:
	addi $sp, $sp, -152
	sw $ra, 112($sp)
	lw $t2, 152($sp)
	move $t6, $t2
	lw $t2, 156($sp)
	move $t5, $t2
	#FOR   :: DEBUG
	li $t4, 0
_L48:
	lw $t2, 0($t6)
	bge  $t4, $t2, _L50
_L49:
	move $t3, $t6
	move $t2, $t4
	sll $t2, $t2, 2
	add $t3, $t3, $t2
	sw $t5, 4($t3)
	addi $t4, $t4, 1
	j _L48
_L50:
	li $t2, 1
	move $v0, $t2
	lw $ra, 112($sp)
	addi $sp, $sp, 152
	jr $ra
	lw $ra, 112($sp)
	addi $sp, $sp, 152
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
_L21:
	.asciiz ""
_L8:
	.asciiz " O"
_L9:
	.asciiz " ."
