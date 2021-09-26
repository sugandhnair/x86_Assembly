
.model flat,C

.const

MinFloat	dword	0ff7fffffh
MaxFloat	dword	7f7fffffh


.code

CalcMinMax	proc

push	ebp
mov ebp,esp

mov	edx,[ebp+8]
mov	ecx,[ebp+12]
test	ecx,ecx
jle	Done

fld	[MinFloat]					;s[0] = floatMin
fld	[MaxFloat]					;s[0] = floatMax , s[1] = floatMin

@@:

fld	real4	ptr[edx]			  ;s[0] = val,s[1]=floatMax,s[2]=floatMin
fld	st(0)						      ;s[0]=val,s[1] = val,s[2]=floatMax,s[3]=floatMin

fcomi	st(0),st(2)					;compare value with min value
fcmovnb st(0),st(2)				;s[0] = min(s[0],s[2]) i.e min value stores in s[0]

fstp	st(2)						    ;pop s[0] value and store it in s[2] i.e s[0] = val , s[1] = floatMax,s[2] = max

fcomi	st(0),st(2)					;compare val with floatMax
fcmovb  st(0),st(2)				;s[0] = min(s[0],s[2])

fstp	st(2)						    ;store max in s[2] and pop s[0] i.e	s[0] = min , s[1] = max

add	edx,4						      ;move edx to next element
dec	ecx							      ;decrement counter value
jnz	@B


mov	eax,[ebp+16]
fstp	real4	ptr	[eax]			;store min value
mov	eax,[ebp+20]
fstp	real4	ptr	[eax]			;store max value
mov	eax,1

Done:
pop	ebp
ret

CalcMinMax	endp
end



;CPP function prototype - > extern "C"	int CalcMinMax(int *arr, int size,int *min,int *max);
