.386
.model flat,c


.code
CalcArraySumASM	proc

push	ebp
mov	ebp,esp

mov	edx,[ebp+8]				;get the address of the first element in array
mov	ecx,[ebp+12]			;get the number of elements in the array

xor	eax,eax					;EAX being the register holding the return value

cmp	ecx,0					;Check if the array is of length 0
jle	InvalidCount

@@:
add	eax,[edx]				;Add the first array element to register EAX
add	edx,4					;Increment EDX to point to the next element
dec	ecx						;Decrement the count value
jnz	@B						;Repeat if ECX is not zero

InvalidCount:
pop	ebp
ret

CalcArraySumASM	endp
end
