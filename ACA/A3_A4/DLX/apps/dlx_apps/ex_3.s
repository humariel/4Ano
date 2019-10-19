.data
values:	.word 1,2,3,4,5,6,7,8,9,10 	;values to be added
nelem:	.word 10 			;array size
sum:	.space 4 			;sum of the array elements
	.text
	.global main

main: 
	lw 	r1, nelem	; i=10 (i=nelem)
	addi	r2, r0, sum	; r2 --> address of sum
	addi	r3, r0, values	; r3 --> address of values

for: 	
	beqz	r1, end		;finish loop if i=0
	nop
	nop
	;nop
	subi	r1, r1, 1	;i--
      	;nop
	;nop
	slli	r4, r1, 2	;tmp = i*4
	;nop
	;nop
	add	r4, r3, r4	;tmp += values
	;nop
	;nop
	lw	r5, 0(r4)	;
	lw	r6, 0(r2)	;
	nop
	add	r6, r6, r5	; 
	sw	0(r2), r6		; sum += *(tmp)
	j	for
	nop			;3 nops --> waiting for jump to reach wb phase so that we don't finish the program
	nop
	;nop
end: 
      	trap 0
