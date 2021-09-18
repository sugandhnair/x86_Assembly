;--------------- x64 - 64 bit -------------------------- 
.code
main	PROC
	mov	rax,2
	mov rbx,3
	mov rcx,4
	ret
main	endp
end

;-------------------------------------------------------

;--------------------- x86 - 32 bit----------------------

.386
.model flat 
.code
main	PROC
	mov	eax,2
	mov ebx,3
	mov ecx,4
	ret
main	endp
end	main

;---------------------------------------------------------

;=------------------------16bit---------------------------

.386
.model flat 
.code
main	PROC
	mov	ax,2
	mov bx,3
	mov cx,4
	ret
main	endp
end	main

------------------------------------------------------------
