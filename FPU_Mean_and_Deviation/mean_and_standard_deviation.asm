
.model flat,C

.code

mean_deviation	proc

push	ebp
mov		ebp,esp
sub		esp,4

xor		eax,eax
mov		ecx,[ebp+12]
cmp		ecx,1
jle		Done
dec		ecx

mov		[ebp-4],ecx

inc		ecx

mov		edx,[ebp+8]
fldz

@@:
fadd	real8	ptr[edx]
add		edx,8
dec		ecx
jnz		@B

fidiv	dword ptr[ebp+12]

mov		edx,[ebp+8]
mov		ecx,[ebp+12]
fldz


@@:	
fld		real8	ptr[edx]
fsub	st(0),st(2)
fmul	st(0),st(0)
faddp
add		edx,8
dec		ecx
jnz		@B

fidiv	dword	ptr	[ebp-4]
fsqrt

mov		eax,[ebp+20]
fstp	real8	ptr[eax]
mov		eax,[ebp+16]
fstp	real8	ptr	[eax]
mov		eax,1

mov		esp,ebp

Done:
pop	ebp
ret

mean_deviation	endp
end
