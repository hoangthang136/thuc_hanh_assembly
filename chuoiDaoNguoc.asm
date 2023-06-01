.model small
.stack 100
.data
    tb1 db 'Nhap xau: $'
    tb2 db 13,10, 'Xau dao nguoc: $' 
    str db 50 dup('$')
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 9
        lea dx, tb1
        int 21h
        
        mov ah, 0ah
        lea dx, str
        int 21h
        
        mov ah, 9
        lea dx, tb2
        int 21h
        
        mov cl, [str+1] ; lay so dai cua chuoi
        lea si, [str+2]
        lap:
            push [si]
            inc si
            loop lap
        mov cl, [str+1]
        lap2:
            pop dx
            mov ah, 2
            int 21h
            loop lap2
        
        mov ah, 4ch
        int 21h
    main endp
end