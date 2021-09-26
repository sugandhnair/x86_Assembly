.model flat,c

.const

public LsEpsilon

LsEpsilon	real8	1.0e-12

.code

LeastSquaresASM	proc

push	ebp
mov	ebp,esp

sub	esp,8

xor	eax,eax
mov	ecx,[ebp+16]
test	ecx,ecx							;ecx = n
jle Done

mov	eax,[ebp+8]							;x array
mov	edx,[ebp+12]						;y array

fldz;									;sum_xx
fldz;									;sum_xy
fldz;									;sum_y
fldz;									;sum_x		,	FPU STACK : sum_x,sum_y,sum_xy,sum_xx

@@:

fld real8 ptr [eax]
fld st(0)
fld st(0)

fld real8 ptr [edx]						; FPU stack: y,x,x,x,sum_x,sum_y,sumxy,sumxx

fadd st(5),st(0)						; sum_y += y; FPU stack: y,x,x,x,sum_x,sum_y = y,sumxy,sumxx

fmulp									; x * y; FPU stack: xy,x,x,sum_x,sum_y,sumxy,sumxx

faddp st(5),st(0)						; sum_xy += xy; FPU stack: x,x,sum_x,sum_y = y,sumxy = xy,sumxx

fadd st(2),st(0)						; sum_x += x; FPU stack: x,sum_x = x,sum_y = y,sumxy = xy,sumxx

fmulp									; x * x->  FPU stack: xx,sum_x,sum_y,sumxy,sumxx

faddp st(4),st(0)						; sum_xx += xx -> FPU stack: sum_x = x,sum_y = y,sumxy = xy,sumxx = x * x

add eax,8
add edx,8
dec ecx
jnz @B

;denom = n* sum_xx - sum_x * sum_x

fild	dword	ptr	[ebp+16]				;n * sum_xx
fmul	st(0),st(4)						;FPU_STACK : sumx,sum_x,n*sum_xx,sum_x,sum_y,sum_xy,sum_xx

fld	st(1)
fld	st(0)								;FPU_STACK : sum_x,sum_x,n*sum_xx,sum_x,sum_y,sum_xy,sum_xx

fmulp
fsubp
fst	real8	ptr	[ebp-8]					;FPU_STACK : denom,sum_x,sum_y,sum_xy,sum_xx

fabs									;fabs(denom)
fld	real8	ptr	[LsEpsilon]
fcomip	st(0),st(1)						;compare Epsilon and fabs(denom)
fstp	st(0)
jae	InvalidDenom						;jump if Epsilon > = fabs(denom)


fild	dword	ptr[ebp+16]

fmul	st(0),st(3)						;n *sum_xy
fld	st(2)								;sum_y
fld	st(2)								;sum_x
fmulp									;sum_x * sum_y
fsubp									;n * sum_xy - sum_x * sum_y
fdiv	real8	ptr	[ebp-8]
mov	eax,[ebp+20]
fstp	real8	ptr	[eax]

;intercept = (sum_xx *sum_y - sum_x * sum_xy) /  denom

fxch	st(3)
fmulp
fxch	st(2)
fmulp
fsubp

fdiv	real8	ptr	[ebp-8]
mov	eax,[ebp+24]
fstp	real8	ptr	[eax]
mov	eax,1

Done:

mov	esp,ebp
pop	ebp
ret

InvalidDenom:

fstp	st(0)
fstp	st(0)
fstp	st(0)
fstp	st(0)

xor	eax,eax
mov	esp,ebp
pop	ebp
ret

LeastSquaresASM	endp
end
