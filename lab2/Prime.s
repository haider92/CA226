.data
	limit:		.word 71
	control:	.word 0x10000
	data:		.word 0x10008
.text

main:
	lwu r5,control(r0)
	lwu r6,data(r0)
	daddi r7,r0,1
	
	ld r21,limit(r0)
	daddi r1,r0,1
	loop:
		daddi r1,r1,2
		jal isPrime
	bne r1,r21,loop
	
halt

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Helper Functions

; Mod function. A % B
; Where A is r1 and B is r2
; Result stored in r3
mod:
	ddiv r8,r1,r2
	dmul r9,r2,r8
	dsub r3,r1,r9
jr r31

; Output function. Output whatever
; is in register r1
output:
	sd r1,(r6)
	sd r7,(r5)
jr r31

; Number is stored in number(r0)
; Iterator is stored in r2
; r1 and r2 are used.
isPrime:
	movz r28,r31,r0
	
	; if the number is even end
	jal mod
	beqz r3,end
	
	; if the result is an integer, then n is not prime because 3 is a factor of n. end
	daddi r2,r0,3
	jal mod
	beqz r3,end
	
	daddi r2,r0,1
	
	; Calculate the limit
	daddi r4,r0,2
	ddiv r4,r1,r4
	
	pLoop:
		daddi r2,r2,1
		ddiv r3,r1,r2
		beqz r3,end
	bne r2,r4,pLoop
	
	printPrime:
		jal output
	
	end:
jr r28
	