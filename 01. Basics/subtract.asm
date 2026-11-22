.model small
.stack 100h
.data 
    msg1 db "Enter first number: $"
    msg2 db 10,13, "Enter second number: $"
    msg3 db 10,13, "Enter third number: $"
    answer db 10,13, "Subtract: $"
.code 
main proc 

;ONLY SINGLE DIGITS OFCOURSEE AND OFC NEGATIVE IS NOT HANDLED. WE DK WHT WE GONNA IF IT COMES TO THT.


    mov ax, @data 
    mov ds, AX 

    ;take 1st number
    lea dx, msg1 
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h
    mov bl, AL

    ;take 2nd
    lea dx, msg2
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h
    mov cl, AL

    ;take 3rd
    lea dx, msg3
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h

    sub bl, CL
    sub bl, AL
    add bl, 30h

    lea dx, answer
    mov ah, 09h
    int 21h

    mov dl, BL
    mov ah, 02h
    int 21h

    mov ah, 4ch
    int 21h
main endp
end main