; tind duoc lan nhat la 8! vi 8086 khong ho tro 32bit nen max nhat chi la 65535

inchuoi macro chuoi
    mov ah, 9
    lea dx, chuoi
    int 21h
endm

.model small
.stack 100h
.data
    tb1 db 'Nhap n: $'
    tb2 db 10,13, 'Ket qua: $'
    n dw ?
    tmp dw ?
    kq dw ?
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        inchuoi tb1
        mov bx, 10
        mov n, 0
        mov tmp, 0
        nhap:
            mov ah,1
            int 21h
            cmp al, 13
            je giaithua
            xor ah, ah
            sub al, 30h
            mov tmp, ax
            mov ax, n
            mul bx
            add ax, tmp
            mov n, ax
            jmp nhap
        
        giaithua:
            cmp n,0
            je gt2
            cmp n,1
            je gt2
            
            mov ax, n
            mov bx, 1
            lap:
                mul bx
                mov kq, ax
                inc bx
                cmp bx, n
                je xuat
                jmp lap
        gt2:
            mov kq,1
            jmp xuat
        
        xuat:
            inchuoi tb2
            mov ax, kq
            mov bx, 10
            mov cx, 0
            chia:
                xor dx, dx
                div bx
                push dx
                inc cx
                cmp al, 0
                je ht
                jmp chia
            ht:
                pop dx
                add dl, 30h
                mov ah, 2
                int 21h
                loop ht
        
        mov ah,4ch
        int 21h        
    main endp
end                