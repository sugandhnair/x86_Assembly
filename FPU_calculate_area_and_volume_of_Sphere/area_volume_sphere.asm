;Area of the sphere is = 4 * pi * r ^ 2
;Volume of the sphers is = ( 4 * pi * r ^ 3 ) / 3


.model flat,C

.const

multiplier	dword	4
divider		dword	3

.code

calc_area	proc

push	ebp
mov		ebp,esp

fld		real8	ptr[ebp+8]				;load radius into stack
fld		real8	ptr[ebp+8]				;load radius into stack again
fmulp									;S[0] = r ^ 2

fldpi									;S[0] = r ^ 2  , S[1] = pi
fild		[multiplier]				;S[0] = r ^ 2  , S[1] = pi , S[2] = 4

fmulp									;S[0] = 4 * r ^ 2 , S[1] = pi
fmulp									;S[0] = 4 * pi * r ^ 2

pop		ebp
ret

calc_area endp


calc_volume	proc

push	ebp
mov		ebp,esp

fld		real8	ptr[ebp+8]				;push radius into stack 3 times
fld		real8	ptr[ebp+8]
fld		real8	ptr[ebp+8]

fmulp									;multiply and pop twice leaving S[0] = r ^ 3
fmulp

fldpi									;push pi into stack
fild	[multiplier]					;push 4 into stack , S[0] = r ^ 3 , S[1] = pi , S[2] = 3

fmulp									;multiply pi and 4 to S[0] contents and pop them
fmulp	

fild	[divider]						;push 3 into stack
fdivp									;Divide S[0] by 3 and save the result in S[0] popping S[1]

pop ebp
ret

calc_volume endp
end
