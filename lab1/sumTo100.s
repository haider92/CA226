.data
	Answer: 	.word 0
.text

main:
	daddi r1,r0,1		; Minus by 1
	daddi r2,r0,0		; Sum
	daddi r3,r0,20	 	; Count
	
	loop:
		dadd r2,r2,r3
		dsub r3,r3,r1
	bnez r3,loop 

	sd r2,Answer(R0)
	
halt