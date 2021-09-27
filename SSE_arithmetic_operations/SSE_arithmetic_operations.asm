.model flat,c

.const

align 16

AbsMaskFloat	dword	7fffffffh,0fffffffh,0fffffffh,0fffffffh
AbsMaskDouble	qword	7fffffffffffffffh,07fffffffffffffffh

.code

SSE_operations	proc

push ebp
mov	ebp,esp

movss	xmm0,real4 ptr[ebp+8]
movss	xmm1,real4	ptr[ebp+12]

;Addition

movss	xmm2,xmm0
addss	xmm2,xmm1
movss	real4	ptr[eax],xmm2

;Subtraction

movss	xmm3,xmm0
subss	xmm3,xmm1
movss	real4	ptr[eax+4],xmm3

;Multiplication

movss	xmm4,xmm0
mulss	xmm4,xmm1
movss	real4	ptr[eax+8],xmm4

;Divisiom

movss	xmm5,xmm0
divss	xmm5,xmm1
movss	real4	ptr[eax+12],xmm5

;Minimum

movss	xmm6,xmm0
minss	xmm6,xmm1
movss	real4	ptr[eax+16],xmm6

;Maximum

movss	xmm7,xmm0
maxss	xmm7,xmm0
movss	real4	ptr[eax+20],xmm7

;Absolute value

andps	xmm1,[AbsMaskFloat]
movss	real4	ptr[eax+24],xmm1

;Square root

sqrtss	xmm0,xmm1
movss	real4	ptr[eax+28],xmm0


pop ebp
ret

SSE_operations	endp
end


;C / C++ function prototype - > void SSE_operations(float a,float b,c[8]);
