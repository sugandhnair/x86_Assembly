.386
.model flat

.data
intArray	SWORD	0,0,0,0,4,-5,6;

.code
main	PROC

mov		ebx,OFFSET intArray
mov		ecx,LENGTHOF intArray

LP:
cmp		WORD	PTR[ebx],0
jnz		Found
add		ebx,2
loop    LP
jmp		Notfound

Found:
movsx	eax,WORD PTR[ebx]
jmp	Quit

Notfound:
mov		eax,999999

Quit:
ret

main	endp
end	main
