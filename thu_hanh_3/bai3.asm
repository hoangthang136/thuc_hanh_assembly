.model small
.stack 100h
.data
    tb1 db 'Nhap ky tu: $'
    CRLF db 10, 13, '$'
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
        mov ah, 9
        lea dx, CRLF
        int 21h
        mov dl, a 
        nhan2:
            mov ah, 02h 
            int 21h
            mov a, dl
            mov dl, 20h
            int 21h
            mov dl, a
            inc dl 
            cmp dl, 'z' 
            jna nhan2 
            mov ah, 08h 
            int 21h
            
        mov ah, 4ch
        int 21h
    main endp
end