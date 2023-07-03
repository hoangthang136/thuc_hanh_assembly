    ; doi thuong thanh hoa
inchuoi macro chuoi
    mov ah, 9
    lea dx, chuoi
    int 21h
endm
.model small
.stack 100h
.data
    tb1 db 'Nhap chuoi: $'
    tb2 db 'Ket qua: $'
    CRLF db 10,13,'$'
    str db ?
.code
main proc
    mov ax, @data
    mov ds, ax
    
    inchuoi tb1
    lea si, str
    lap:
        mov ah, 1
        int 21h
        cmp al, 13
        je xuat
        cmp al, 'a'
        jl kt
        cmp al, 'z'
        jg kt
        sub al, 20h
        kt:
        mov [si], al
        inc si
        jmp lap
    xuat:
    mov [si], '$'
    inchuoi CRLF
    inchuoi tb2
    inchuoi str
    
    mov ah, 4ch    
    int 21h
main endp
end