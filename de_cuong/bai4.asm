    ; dem so luong so chia het cho 5 (hay so bat ky)
inchuoi macro chuoi
    mov ah, 9
    lea dx, chuoi
    int 21h
endm

.model small
.stack 100h
.data
    tb1 db 'Nhap chuoi so: $'
    tb2 db 'Ket qua: $'
    tb3 db 'Khong nhap ky tu dac biet. Vui long nhap lai!$'
    CRLF db 10,13,'$'
    x dw ?
    y dw ?
    demsl db ?
    am db ?
    thoat db ?
.code
main proc
    mov ax, @data
    mov ds, ax
    
    start:
    inchuoi tb1
    mov demsl, 0
    mov am, 0
    nhapso:
        mov bx, 10
        mov x, 0
        mov y, 0
        nhap:
            mov ah, 1
            int 21h
            cmp al, 13
            je kiemtra
            cmp al, ' '
            je kiemtra
            cmp al, ','
            je kiemtra
            cmp al, '-'
            je soam
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
    soam:
        mov am, 1
        jmp nhapso
    kiemtra:
        mov thoat, al
        cmp am, 1
        jne dem
        ;neg x      ; khong chuyen ve am thi lai chia het, chuyen ve am thi khong chia het???
        mov am, 0
        dem:
            mov ax, x
            mov bx, 5   ; muon chia het so nao thi thay vao day
            xor dx, dx
            div bx
            cmp dx, 0
            jne kt
            inc demsl
            kt:
            cmp thoat, 13
            je xuat
            jmp nhapso
    xuat:
        inchuoi CRLF
        inchuoi tb2
        mov al, demsl
        xor ah, ah
        mov bx, 10
        mov cx, 0
        chia:
            xor dx, dx
            div bx
            push dx
            inc cx
            cmp al, 0
            jne chia
        ht:
            pop dx
            add dl, 30h
            mov ah, 2
            int 21h
            loop ht    
    
    mov ah, 4ch
    int 21h
main endp
end