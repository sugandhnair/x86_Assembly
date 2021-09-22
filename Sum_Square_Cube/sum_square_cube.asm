.386
.model flat,c
.code

calc_sum	proc

;Setting up the stack space

push	ebp
mov	ebp,esp
sub	esp,12			;allocate space for 3 local variables ,stack is growing downward hence sub.
push	ebx				;push the non-volatile registers EBX,ESI,EDI so we can restore them when returning.
push	esi
push	edi

;Load the function parameters
mov	eax,[ebp+8]		
mov	ebx,[ebp+12]		
mov	ecx,[ebp+16]		
mov	edx,[ebp+20]
mov	esi,[ebp+24]
mov	edi,[ebp+28]

;Sum up the contents into the first temporary variable.
mov	[ebp-12],eax
add	[ebp-12],ebx
add	[ebp-12],ecx


;Find the squares
imul	eax,eax
imul	ebx,ebx
imul	ecx,ecx

mov	[ebp-8],eax
add	[ebp-8],ebx
add	[ebp-8],ecx


;Calculate the	cubes
imul	eax,[ebp+8]
imul	ebx,[ebp+12]
imul	ecx,[ebp+16]

mov	[ebp-4],eax
add	[ebp-4],ebx
add	[ebp-4],ecx


;Load addresses of returning variables and copy the results.
mov	eax,[ebp-12]
mov	[edx],eax
mov	eax,[ebp-8]
mov	[esi],eax
mov	eax,[ebp-4]
mov	[edi],eax

;restore non-volatile registers
pop	edi
pop	esi
pop	ebx
mov	esp,ebp
pop	ebp

ret

calc_sum	endp
end
