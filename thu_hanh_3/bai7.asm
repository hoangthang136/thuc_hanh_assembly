inchuoi macro chuoi
    mov ah, 9
    lea dx, chuoi
    int 21h
endm
.model small
.stack 100h
.data
    tb1 db 'Nhap A: $'
    tb2 db 10,13,'nhap B: $'
    tb3 db 10,13,'A * B = $'
    tb4 db 10,13,'A / B = $'
    tb5 db '  du: $'
    a dw ?
    b dw ?
    x dw ?
    y dw ?
    kq dw ?
    du dw ?
.code
    main proc
        mov ax, @data
        mov ds, ax
           
           ;nhap n1
        inchuoi tb1
        call chuyen    
        mov ax, x
        mov a,ax
        
            ; nhap n2
        inchuoi tb2
        call chuyen
        mov ax, x
        mov b, ax
        
            ; nhan
        call anhanb
        mov kq, ax
        inchuoi tb3
        mov ax, kq
        call xuat
         
          ; chia
        call achiab
        mov du, ax
        mov kq, cx
        inchuoi tb4
        mov ax, kq
        call xuat
        inchuoi tb5
        mov ax, du
        call xuat
        
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
    
    achiab proc
        mov ax, a
        mov bx, b
        mov cx, 0
        tru:
            sub ax, bx
            inc cx
            cmp ax, bx
            jl thoat
            jmp tru
        thoat:
        ret    
    achiab endp
    
    anhanb proc
        mov ax, 0
        mov bx, a
        mov cx, b
        nhan:
            add ax,bx
            loop nhan
        ret
    anhanb endp
    
    xuat proc
        mov bx, 10
        mov cx, 0
        chia:
            mov dx, 0
            div bx
            push dx
            inc cx
            cmp al, 0
            je hienthi
            jmp chia
        hienthi:
            pop dx
            add dl, 30h
            mov ah,2
            int 21h
            loop hienthi
        ret
    xuat endp
end