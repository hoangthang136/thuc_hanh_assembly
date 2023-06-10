inchuoi macro chuoi
    mov ah, 9
    lea dx, chuoi
    int 21h
endm

.model small
.stack 100h
.data
    tb1 db 'Nhap so nhi phan A: $'
    tb2 db 13,10,'Nhap so nhi phan B: $'
    tb3 db 13, 10, 'A + B = $'
    tb4 db 13,10,'A - B = $'
    tb5 db 13,10, 'A and B = $'
    tb6 db 13,10, 'A or B = $'
    a dw ?
    b dw ?
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        inchuoi tb1
        call hex_in
        mov a, bx
        
        inchuoi tb2
        call hex_in
        mov b, bx
        
        inchuoi tb3
        mov bx, a
        add bx, b
        call bin_out
        
        inchuoi tb4
        mov bx, a
        sub bx, b
        call bin_out
        
        inchuoi tb5
        mov bx, a
        and bx, b
        call bin_out
        
        inchuoi tb6
        mov bx, a
        or bx, b
        call bin_out
        
        mov ah, 4ch
        int 21h    
    main endp
    
    hex_in proc
        xor bl, bl
        mov cx, 2
        lap:
            push cx
            mov cl, 4
            shl bl, cl
            mov ah,1
            int 21h
            cmp al, 39h
            jg lon
            sub al, 30h
            jmp tiep:
            lon:
                sub al, 37h
            tiep:    
                add bl, al
                pop cx
                loop lap
        ret
    hex_in endp
    
    bin_out proc
        mov cx, 16
        xuat:
        mov dl, 0
        shl bx,1      ; dich trai 1 bit, luc nay bit thu 8 cua thanh ghi bh se duoc luu o co cf
        rcl dl, 1     ; tu co cf quay vong lai gan gia tri co bit thu nhat cua thanh ghi dl
        add dl, 30h
        mov ah, 2
        int 21h
        loop xuat
        ret    
    bin_out endp
end    