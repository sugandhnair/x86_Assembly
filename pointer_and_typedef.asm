.386
.model flat

PBYTE	typedef		PTR		BYTE
PWORD	typedef		PTR		WORD
PDWORD	typedef		PTR		DWORD

.data
b_arr	BYTE	3h,5h,9h,11h;
w_arr	WORD	1h,2h,3h,4h;
d_arr	DWORD	10h,20h,30h,40h;

ptrb	PBYTE	b_arr
ptrw	PWORD	w_arr
ptrd	PDWORD	d_arr

.code

main	PROC

mov	ecx,LENGTHOF b_arr
mov	eax,0

mov esi,ptrb
mov AL,[esi]

mov edi,ptrw
mov AX,[edi]

mov edx,ptrd
mov eax,[edx]

ret

main	endp
end	main
