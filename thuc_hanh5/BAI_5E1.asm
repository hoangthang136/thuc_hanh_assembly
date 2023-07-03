inchuoi macro chuoi
    mov ah, 9
    lea dx, chuoi
    int 21h
endm
dseg segment
    tb1 db 'Nhap ten file cu: $'
    tb2 db 10,13,'Nhap ten file moi: $'
    oldfile db 100 dup (?)
    newfile db 100 dup (?)
dseg ends
cseg segment
assume cs:cseg, ds:dseg, es: dseg
begin: mov ax, dseg
    mov ds, ax
    mov es, ax
    
    inchuoi tb1
    mov si, 0
    nhap:
        mov ah, 1
        int 21h
        cmp al, 13
        je thoat
        mov oldfile[si],al
        inc si
        jmp nhap
    thoat:
    inchuoi tb2
    mov si, 0
    nhap1:
        mov ah, 1
        int 21h
        cmp al, 13
        je thoat1
        mov newfile[si],al
        inc si
        jmp nhap1
    thoat1:    
    mov ah,56h ; rename/remove tên file cu thanh moi
    lea dx, oldfile
    lea di, newfile
    int 21h
    
    mov ah, 4ch ; thoat ve Dos
    int 21h
cseg ends
end begin