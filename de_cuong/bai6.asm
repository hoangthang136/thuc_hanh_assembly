    ; nhap thap phan in hexa va nhi phan (16 bit)
inchuoi macro chuoi
    mov ah, 9
    lea dx, chuoi
    int 21h
endm
.model small
.stack 100h
.data
    tb1 db 'Nhap so thap phan: $'
    tb2 db 'Co so 16: $'
    tb3 db 'Nhi phan: $'
    error db 'Khong nhap ky tu dac biet. Vui long nhap lai!$' 
    CRLF db 10,13,'$'
    x dw ?
    y dw ?
    thoat db ?
    soam db ?
.code
main proc
    mov ax, @data
    mov ds, ax
    
    start:
    mov soam, 0
    inchuoi tb1
    nhapso:
        mov x, 0
        mov y, 0
        mov bx, 10
        nhap:
            mov ah, 1
            int 21h
            cmp al, 13
            je kiemtra
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
        inchuoi error
        inchuoi CRLF
        jmp start
    am:
        mov soam, 1
        jmp nhapso
    kiemtra:
        cmp soam, 1
        jne kt
        neg x
        kt: 
        inchuoi CRLF
        inchuoi tb2
        mov bx, x
        call hex_out
        inchuoi CRLF
        inchuoi tb3
        mov bx, x
        call bin_out
    
    mov ah, 4ch
    int 21h
main endp

bin_out proc
    mov cx, 16
    bin:
        xor dl, dl
        shl bx, 1
        rcl dl, 1
        add dl, 30h
        mov ah, 2
        int 21h
        loop bin
    mov ah, 2
    mov dl, 'b'
    int 21h    
    ret    
bin_out endp

hex_out proc
    mov cx, 4
    hex:
        push cx
        mov cl, 4
        mov dl, bh
        shr dl, cl
        cmp dl, 09h
        jg chu
        add dl, 30h
        jmp inra
        chu: 
            add dl, 37h
        inra:
            mov ah, 2
            int 21h
            shl bx, cl
            pop cx
            loop hex
    mov ah, 2
    mov dl, 'h'
    int 21h
    ret
hex_out endp
end