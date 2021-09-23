.386
.model flat,c
.code

;Finding min of 3 numbers

SignedMin	proc

push	ebp
mov ebp,esp

mov	eax,[ebp+8]
mov	ecx,[ebp+12]

cmp	eax,ecx
jle	@F
mov	eax,ecx

@@:
mov	ecx,[ebp+16]
cmp	eax,ecx
jle	@F
mov	eax,ecx

@@:
pop	ebp
ret

SignedMin	endp

SignedMax	proc

push	ebp
mov	ebp,esp

mov	eax,[ebp+8]
mov	ecx,[ebp+12]

cmp	eax,ecx
jge @F
mov	eax,ecx

@@:
mov	ecx,[ebp+16]
cmp	eax,ecx
jge	@F
mov	eax,ecx

@@:
pop	ebp
ret
SignedMax	endp

end
