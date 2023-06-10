inchuoi macro chuoi
    mov ah, 9
    lea dx, chuoi
    int 21h
endm

.model small
.stack 100h
.data
    tb1 db 'Nhap 1 ky tu: $'
    tb2 db 'Ma ASCII dang Hex: $'
    tb3 db 'Ma ASCII dang Dec: $'
    tb4 db 'Ma ASCII dabg Bin: $'
    CRLF db 13, 10, '$'
    a db ?
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        inchuoi tb1
        mov ah, 1
        int 21h
        mov a, al
        
        inchuoi CRLF
        inchuoi tb2
        mov bl, a
        call hex_out
        
        inchuoi CRLF
        inchuoi tb3
        mov al, a
        call dec_out
        
        inchuoi CRLF
        inchuoi tb4
        mov bl, a
        call bin_out
        
        mov ah, 4ch
        int 21h    
    main endp
    
    hex_out proc
        mov cx, 2
        xuat:
            push cx
            mov cl, 4
            mov dl, bl
            shr dl, cl
            cmp dl, 09h
            jg lon
            add dl, 30h
            jmp inra
            lon:
                add dl, 37h
            inra:
                mov ah, 2
                int 21h
            shl bl, cl
            pop cx
            loop xuat 
        mov dl, 'h'
        int 21h
        ret        
    hex_out endp
    
    dec_out proc
        mov bx, 10
        mov cx, 0
        chia:
            xor ah, ah
            xor dx, dx
            div bx
            push dx
            inc cx
            cmp al, 0
            je xuat2
            jmp chia
        xuat2:
            pop dx
            add dl, 30h
            mov ah, 2
            int 21h
            loop xuat2    
        ret      
    dec_out endp
    
    bin_out proc
        mov cx, 8
        xuat3:
            mov dl, 0
            shl bl, 1
            rcl dl, 1
            add dl, 30h
            mov ah, 2
            int 21h
            loop xuat3
        mov dl, 'b'
        int 21h    
        ret    
    bin_out endp   
end