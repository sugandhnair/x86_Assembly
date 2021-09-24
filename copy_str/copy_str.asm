.386
.model flat,c

.code

copy_str	proc

push ebp    
mov   ebp,esp           ;copy base pointer address
push ebx              ;copy non volatile registers EBX,ESI,EDI into the stack
push esi
push edi

mov   eax,[ebp+8]       ;copy first string starting address to EAX
mov   ebx,[ebp+12]      ;copy second string starting address to EBX
mov   ecx,[ebp+16]      ;copy string 1 length to ECX
mov   esi,0             ;use ESI as the counter

@@:
mov   dl,[eax+esi]      ;copy index 0 char of string 1 to lower byte of EDX register
mov   [ebx+esi],dl      ;move it to index 0 of string 2
inc   esi               ;increment index
cmp   esi,ecx           ;until index equals length of string 1 repeat steps
jl    @B

pop   edi               ;pop all non volatile registers
pop   esi
pop   edx
pop   ebp

ret
copy_str endp
end
