.model small 
.stack 100h
.data 
    num db 5
    multiplier db 1
    newline db 10, 13, "$" ;prints newline 
    msg db 10, 13, " 5 x $"
    msg2 db " = $"
    rh db ?
    r2 db 10

.code 
main proc 
    mov ax, @data
    mov ds, ax 

    mov cx, 10

gen_table:
        mov al, num
        mul multiplier ;al multiplies with multiplier tht is 1.

        xor ah, ah
        mov bl, 10
        div BL  ;-> al = tens ah = ones

        mov bl, al ;-> al saved.
        mov bh, ah  ;-> bh saved.

        lea dx, msg ;-> print 5 x 
        mov ah, 09h
        int 21h

        mov al, multiplier
        xor ah, ah
        div r2
        mov rh, AH
        mov dl, al
        add dl, 30h
        mov ah, 02h
        int 21h
        mov dl, rh
        add dl, 30h
        mov ah, 02h
        int 21h
        
        lea  dx, msg2
        mov ah, 09h
        int 21h

        mov dl, BL  ;-> TENS DIGIT/QUOTIENT IS PRINTED
        add dl, 30h
        mov ah, 02h
        int 21h

        mov dl, BH ;->ONES DIGIT PRINTED
        add dl, 30h
        mov ah, 02h
        int 21h

        lea dx, newline
        mov ah, 09h
        int 21h

        inc multiplier
        loop gen_table

    mov ah, 4ch
    int 21h
main endp
end main