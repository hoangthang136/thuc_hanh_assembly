.model small
.stack 100h
.data
    tb1 db 'Hay go 1 phim: $'
    tb2 db 13,10,'Ky tu nhan duoc la: $'
    a db ?
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 9
        lea dx, tb1
        int 21h
        
        ; ham ngat 7 la nhap vao 1 phim nhung se khong hien len console la phim vua nhap phim nao
        mov ah, 7
        int 21h
        mov a, al
        
        mov ah, 9
        lea dx, tb2
        int 21h
        
        mov ah, 2
        mov dl, a
        int 21h
        
        mov ah, 4ch
        int 21h    
    main endp
end