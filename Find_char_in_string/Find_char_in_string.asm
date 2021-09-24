.386
.model flat,C


.code

search_char	proc

push ebp
mov   ebp,esp							;Copy stack pointer to base pointer

mov   eax,[ebp+8]						;Store starting address of String in EAX register
mov   dl,[ebp+12]						;Strore search char in lower byte of EDX register
mov   ecx,[ebp+16]					;Store the length of string 1 in ecx

@@:
cmp   dl,[eax]						;Compare search char with index 0 char of String
je    Found							;If matched jump to label Found
add   eax,1							;move EAX to next index in string
dec   ecx								;Decrement Counter
jnz   @B								;Repeat until all elements are checked

dec   ecx               ;Decrementing ECX will make it -1 indicating char is not found

Found:
mov   eax,ecx           ;Copying the index at which char was found into register EAX
pop   ebp
ret

search_char endp
end
