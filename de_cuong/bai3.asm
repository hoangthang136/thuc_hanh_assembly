    ; dem so luong so nguyen to trong chuoi
inchuoi macro chuoi
    mov ah, 9
    lea dx, chuoi
    int 21h
endm
.model small
.stack 100h
.data
    tb1 db 'Nhap chuoi so: $'
    tb2 db 'So luong so nguyen to: $' 
    tb3 db 'Khong nhap ky tu dac bien, vui long nhap lai!$'
    CRLF db 10,13, '$'
    x dw ?
    y dw ?
    thoat db ?
    demnt db ?
    soam db ? 
    tmp db ?
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov demnt, 0
    mov soam, 0
    start:
    inchuoi tb1
    nhapso:
        mov x, 0
        mov y, 0
        mov bx, 10
        nhap:
            mov ah, 1
            int 21h
            cmp al, 13
            je dem
            cmp al, ' '
            je dem
            cmp al, ','
            je dem
            cmp al, '-'
            je am
            cmp al, 30h
            jl err
            cmp al, 39h
            jg err
            xor ah, ah
            sub al, 30h
            mov y, ax
            mov ax, x
            mul bx
            add ax, y
            mov x, ax
            jmp nhap
    err:
        inchuoi CRLF
        inchuoi tb3
        inchuoi CRLF
        jmp start
    am:
        mov soam, 1
        jmp nhapso
    dem:
        mov thoat, al
        cmp soam, 1
        je sosanh13
        cmp x, 2
        jl sosanh13
        je demso
        cmp x, 3
        je demso
        call chia
        cmp tmp, 1
        je sosanh13
        demso:
        inc demnt
        sosanh13:
        mov soam, 0
        cmp thoat, 13
        je xuat
        jmp nhapso
    
    xuat:
        inchuoi CRLF
        inchuoi tb2
        mov al, demnt
        xor ah, ah
        mov bx, 10
        mov cx, 0
        chiadu:
            xor dx, dx
            div bx
            push dx
            inc cx
            cmp al, 0
            jne chiadu
        ht:
            pop dx
            add dl, 30h
            mov ah, 2
            int 21h
            loop ht
           
    mov ah, 4ch
    int 21h
main endp

chia proc
    mov bx, 2
    mov tmp, 0
    chiaso:
        xor dx, dx 
        mov ax, x
        div bx
        cmp dx, 0
        je tang
        inc bx
        cmp bx, x
        je exit
        jmp chiaso
        tang:
            mov tmp, 1
    exit:        
    ret    
chia endp    
end