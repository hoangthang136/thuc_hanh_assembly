    ; thay doi ten tap tin
inchuoi macro chuoi
    mov ah, 9
    lea dx, chuoi
    int 21h
endm

.model small
.stack 100h
.data
    tb1 db 'Nhap ten tap tin can thay doi: $'
    tb2 db 10,13,'Nhap ten tap tin moi: $'
    tb3 db 10,13, 'Thanh cong!$'
    old db 100 dup(?)
    new db 100 dup(?)
.code
main proc
    mov ax, @data
    mov ds, ax
    mov es, ax
    
    inchuoi tb1
    mov si, 0
    mov old[si], 'e'
    inc si
    mov old[si], ':'
    inc si
    mov old[si], '\'
    inc si
    nhap:
        mov ah, 1
        int 21h
        cmp al, 13
        je thoat
        mov old[si], al
        inc si
        jmp nhap
    thoat:
    inchuoi tb2
    mov si, 0
    mov new[si], 'e'
    inc si
    mov new[si], ':'
    inc si
    mov new[si], '\'
    inc si
    nhap2:
        mov ah, 1
        int 21h
        cmp al, 13
        je thoat2
        mov new[si], al
        inc si
        jmp nhap2
    thoat2:
    mov ah, 56h
    lea dx, old
    lea di, new
    int 21h
    inchuoi tb3    
    mov ah, 4ch
    int 21h
main endp
end    