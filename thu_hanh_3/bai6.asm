inchuoi macro chuoi
    mov ah, 9
    lea dx, chuoi
    int 21h
endm

.model small
.stack 100h
.data
    tb1 db 'Nhap n1: $'
    tb2 db 10,13,'Nhap n2: $'
    ketqua db 10,13,'Ket qua: $'
    n1 dw ?
    kq dw ?
    x dw ?
    y dw ?
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        inchuoi tb1
        call chuyen    
        mov ax, x
        mov n1,ax
        inchuoi tb2
        call chuyen
        mov ax, x
        add ax, n1
        mov kq, ax
        inchuoi ketqua
        mov ax, kq
        mov bx, 10
        mov cx, 0
        
        chia:
            mov dx, 0
            div bx
            push dx
            inc cx
            cmp al, 0
            je xuat
            jmp chia
        xuat:
            pop dx
            add dl, 30h
            mov ah,2
            int 21h
            loop xuat
        mov ah, 4ch
        int 21h
    main endp
    
    chuyen proc
        mov bx, 10
        mov x,0
        mov y,0
        lap:
            mov ah, 1
            int 21h
            xor ah, ah
            cmp al, 13
            je kt
            sub al, 30h
            mov y, ax
            mov ax, x
            mul bx
            add ax, y
            mov x, ax
            jmp lap
        kt:
        ret    
    chuyen endp
end