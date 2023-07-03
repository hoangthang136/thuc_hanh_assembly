    ; dem so luong so am, so duong
inchuoi macro chuoi
    mov ah, 9
    lea dx, chuoi
    int 21h
endm
.model small
.stack 100h
.data
    tb1 db 'Nhap chuoi so: $'
    tb2 db 'So luong so am la: $'
    tb3 db 'So luong so  duong la: $'
    error db 'Khong nhap ky tu dac biet. Vui long nhap lai!$' 
    CRLF db 10,13,'$'
    x dw ?
    y dw ?
    tong db ?
    sla db ? 
    soam db ?
    thoat db ?
.code
main proc
    mov ax, @data
    mov ds, ax
    
    start:
    mov tong, 0
    mov sla, 0
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
            xor ah,ah
            sub al, 30h
            mov y,ax
            mov ax, x
            mul ax
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
    dem:
        mov thoat, al
        cmp x, 0
        je exit
        cmp soam, 1
        jne demtong
        inc sla
        mov soam, 0
        demtong:
            inc tong
            exit:
            cmp thoat, 13
            je xuat
            jmp nhapso
    xuat:          
        inchuoi CRLF
        inchuoi tb2
        mov dl, sla
        add dl, 30h
        mov ah, 2
        int 21h
        inchuoi CRLF
        inchuoi tb3
        mov dl,tong
        sub dl, sla
        add dl, 30h
        mov ah, 2
        int 21h                    
    
    mov ah, 4ch
    int 21h
main endp
end