.386
.model flat,c

.code

copy_str	proc

push ebp
mov	ebp,esp
push ebx
push esi
push edi

mov	eax,[ebp+8]
mov ebx,[ebp+12]
mov	ecx,[ebp+16]
mov	esi,0

@@:
mov	dl,[eax+esi]
mov	[ebx+esi],dl
inc esi
cmp esi,ecx
jl @B

pop edi
pop esi
pop	edx
pop ebp

ret
copy_str endp
end
