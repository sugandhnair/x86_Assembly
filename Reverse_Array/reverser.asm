.386
.model flat,c
.code

Reverser PROC
push	ebp
mov		ebp,esp
push	esi
push	edi

;check if user has enetered infinte array size
xor		eax,eax
mov		edi,[ebp+8]
mov		esi,[ebp+12]
mov		ecx,[ebp+16]
test	ecx,ecx

;load address at last index
lea		esi,[esi+ecx*4-4]
pushfd
std

@@:		
lodsd
mov		[edi],eax
add		edi,4
dec		ecx
jnz   @B

popfd
mov		eax,1

pop		edi
pop		esi
pop		ebp
ret

Reverser	endp
			    end
