    ; chuyen ky tu hoa thanh ky tu thuong
inchuoi macro chuoi
    mov ah, 9
    lea dx, chuoi
    int 21h
endm
.model small
.stack 100h
.data
    tb1 db 'Nhap chuoi: $'
    tb2 db 10, 13, 'Ket qua: $'
    str db ?
.code
main proc
    mov ax, @data
    mov ds, ax
    
    inchuoi tb1
    lea si, str
    nhap:
        mov ah, 1
        int 21h
        cmp al, 13
        je xuat
        cmp al, 'A'
        jl kt
        cmp al, 'Z'
        jg kt
        add al, 20h
        kt:
        mov [si], al
        inc si
        jmp nhap
    xuat:
        mov [si], '$'
        inchuoi tb2
        inchuoi str
    mov ah, 4ch
    int 21h
main endp
end