    ; dao nguoc chuoi ky tu
inchuoi macro chuoi
    mov ah, 9
    lea dx, chuoi
    int 21h
endm
.model small
.stack 100h
.data
    tb1 db 'Nhap chuoi: $'
    tb2 db 10,13,'Chuoi dao nguoc: $'
.code
main proc
    mov ax, @data
    mov ds, ax
    
    inchuoi tb1
    mov cx, 0
    nhap:
        mov ah, 1
        int 21h
        cmp al, 13
        je xuat
        xor ah, ah
        push ax
        inc cx
        jmp nhap
    xuat:
        inchuoi tb2
        ht:    
        pop dx
        mov ah, 2
        int 21h
        loop ht
    mov ah, 4ch
    int 21h
main endp
end