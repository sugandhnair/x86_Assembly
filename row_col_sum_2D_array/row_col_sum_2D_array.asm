.386
.model flat,c


.code
CalcRowColSumASM	proc

push	ebp
mov	ebp,esp
push ebx
push esi
push edi

xor eax,eax

cmp dword ptr [ebp+12],0
jle Invalid
mov ecx,[ebp+16]
cmp ecx,0
jle Invalid

mov	edi,[ebp+24]
xor eax,eax
rep stosd

mov	ebx,[ebp+8]
xor	esi,esi

;Outer loop
LP1:
mov	edi,[ebp+20]
mov dword	ptr	[edi+esi*4],0
xor	edi,edi
mov	edx,esi
imul	edx,[ebp+16]

;Inner loop
LP2:
mov ecx,edx
add	ecx,edi
mov	eax,[ebx+ecx*4]
mov	ecx,[ebp+20]
add	[ecx+esi*4],eax
mov ecx,[ebp+24]
add	[ecx+edi*4],eax

inc	edi
cmp	edi,[ebp+16]
jl	LP2

inc esi
cmp	esi,[ebp+12]
jl	LP1

mov eax,1


Invalid:
pop edi
pop	esi
pop	ebx
pop	ebp
ret

CalcRowColSumASM	endp
end
