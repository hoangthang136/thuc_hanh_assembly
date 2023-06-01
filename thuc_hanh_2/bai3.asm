.model small
.stack 100h
.data
    tb1 db 'Hay go 1 phim: $'
    tb2 db 13,10,'Ky tu ke truoc: $'
    tb3 db 13,10,'Ky tu ke sau: $'
    a db ?
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 9
        lea dx, tb1
        int 21h
        
        mov ah, 1
        int 21h
        mov a, al
        
        mov ah,9
        lea dx, tb2
        int 21h
        
        dec a
        mov ah, 2
        mov dl, a
        int 21h
        
        mov ah,9
        lea dx, tb3
        int 21h
        
        add a, 2
        mov ah, 2
        mov dl, a
        int 21h
        
        mov ah, 4ch
        int 21h    
    main endp
end