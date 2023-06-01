.model small
.stack 100h
.data
    str db 100 dup('$')
    tb1 db 13,10,'Xin chao $'
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 0ah
        lea dx, str
        int 21h
        
        mov ah, 9
        lea dx, tb1
        int 21h
        lea dx, str+2
        int 21h
        mov ah, 4ch
        int 21h    
    main endp
end