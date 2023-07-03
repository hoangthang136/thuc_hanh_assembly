    ; xoa file
inchuoi macro chuoi
    mov ah, 9
    lea dx, chuoi
    int 21h
endm

.model small
.stack 100h
.data
    tb1 db 'Nhap ten file: $'
    tb2 db 10,13,'Xoa thanh cong!$'
    error db 10,13, 'Xoa khong thanh cong!$'
    tenfile db 100 dup(?)
.code
main proc
    mov ax, @data
    mov ds, ax
    
    inchuoi tb1
    mov si, 0
    mov tenfile[si], 'e'
    inc si
    mov tenfile[si], ':'
    inc si
    mov tenfile[si], '\'
    inc si
    nhap:
        mov ah, 1
        int 21h
        cmp al, 13
        je xoa
        mov tenfile[si], al
        inc si
        jmp nhap
    xoa:
        mov ah, 41h
        lea dx, tenfile
        int 21h
        jnc exit
    inchuoi error    
    exit:
    mov ah, 4ch
    int 21h
main endp
end