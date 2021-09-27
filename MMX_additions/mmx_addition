.model flat,c

.code

MmxAdd	proc

push	ebp
mov	ebp,esp

mov	eax,[ebp+24]					;load add_op
cmp	eax,AddOpTableCount				;compare table_count
jae	BadAddOp						;Invalid table_count

movq	mm0,[ebp+8]					;load a
movq	mm1,[ebp+16]				;load b
jmp	[AddOpTable+eax*4]				;jump to specified operation

MmxPaddb:
paddb	mm0,mm1
jmp	SaveResult

MmxPaddsb:
paddsb	mm0,mm1
jmp	SaveResult

MmxPaddusb:
paddusb	mm0,mm1
jmp	SaveResult

MmxPaddw:
paddw	mm0,mm1
jmp	SaveResult

MmxPaddsw:
paddw	mm0,mm1
jmp	SaveResult

MmxPaddusw:
paddusw	mm0,mm1
jmp	SaveResult

MmxPaddd:
paddd	mm0,mm1
jmp	SaveResult

BadAddOp:
pxor	mm0,mm0


SaveResult:

movd	eax,mm0						;eax = low dword of mm0
pshufw	mm2,mm0,01001110b			;swap high 7 low dword
movd	edx,mm2						;edx : eax = final
emms								;clear mmx state
pop	ebp
ret

align	4

AddOpTable:

dword	MmxPaddb,MmxPaddsb,MmxPaddusb
dword	MmxPaddw,MmxPaddsw,MmxPaddusw,MmxPaddd

AddOpTableCount	equ	($-AddOpTable)/	size dword

MmxAdd	endp
end
