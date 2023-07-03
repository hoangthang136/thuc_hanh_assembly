.model small
.stack 100h
.data
    tb1 db 'Nhap ten file: $'
    tenfile db 100 dup(?)
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, tb1
    int 21h
    
    mov si, 0
    nhap:
        mov ah, 1
        int 21h
        cmp al, 13
        je xoa
        mov tenfile[si],al
        inc si
        jmp nhap
    xoa:    
    mov ah,41h ; xoa tap tin da co
    lea dx, tenfile
    int 21h
    
    mov ah, 4ch ; thoat ve Dos
    int 21h
main endp
end