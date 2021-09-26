.model flat,c

.const

DegToRad	real8	0.017453229252
RadToDeg	real8	57.2957795131

.code

RectToPolar	proc

push	ebp
mov	ebp,esp

fld	real8	ptr	[ebp+16]				;load	y
fld	real8	ptr	[ebp+8]					;load	x

fpatan							;calculate atan2(y/x)

fmul	[RadToDeg]						;Multiply s[0] with constanct RadToDeg

mov	eax,[ebp+28]
fstp	real8	ptr	[eax]

fld	real8	ptr	[ebp+8]					;load	x
fmul	st(0),st(0)						;get x^2

fld	real8	ptr	[ebp+16]				;load	y
fmul	st(0),st(0)						;get y^2

faddp								;x^2 + y^2
fsqrt

mov	eax,[ebp+24]
fstp	real8	ptr	[eax]

pop	ebp
ret

RectToPolar	endp


PolarToRect	proc

push	ebp
mov	ebp,esp

fld	real8	ptr	[ebp+16]				;load angle in degrees
fmul	[DegToRad]						;convert degree to radians

fsincos							;s[1] = sin(s[0])	s[0] = cos(s[0])

fmul	real8	ptr	[ebp+8]				; x = r* cos(a)
mov	eax,[ebp+24]
fstp	real8	ptr	[eax]				;save x

fmul	real8	ptr	[ebp+8]				; y = r* sin(a)
mov	eax,[ebp+28]
fstp	real8	ptr	[eax]				;save y

pop	ebp
ret

PolarToRect	endp
end



;CPP function prototypes
;extern "C"	void RectToPolar(double x,double y,double *r,double *a);
;extern "C"	void PolarToRect(double r, double a, double* x, double* y);
