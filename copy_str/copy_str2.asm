.386
.model flat

.data
quote	byte	"Machines do feel",0
message	byte	SIZEOF	quote	DUP(0),0

.code

start	proc

mov esi,0
mov ecx,SIZEOF quote

LP:
mov al,quote[esi]		;get a character from quote
mov message[esi],al		;store in message
inc esi
loop LP

ret
copy_str endp
end