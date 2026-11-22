.model small
.stack 100h
.data 
    msg db "Hello World! $"
.code      
main proc 
    mov ax, @data
    mov dx, AX

    ;either use lea dx, msg or
    mov dx, offset msg
    mov ah, 09h
    int 21h

    mov ah, 4ch
    int 21h
main endp
end main
