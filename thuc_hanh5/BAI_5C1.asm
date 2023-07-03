inchuoi macro chuoi
    mov ah, 9
    lea dx, chuoi
    int 21h
endm
dseg segment
    tb1 db 'Nhap ten file: $'
    tb2 db 10,13,'Noi dung: $'
    tenfile db 100 dup(?)
    thefile dw ?
    buffer db 251 dup ('$')
dseg ends
cseg segment
assume cs:cseg, ds:dseg
begin: mov ax, dseg
    mov ds, ax
    
    inchuoi tb1
    mov si, 0
    nhap:
        mov ah, 1
        int 21h
        cmp al, 13
        je mo
        mov tenfile[si],al
        inc si
        jmp nhap
    
    mo:
    mov ah, 3dh ; mo tap tin da co
    lea dx, tenfile
    mov al, 0 ; thuoc tinh. 0 la read, 1 la write, 2 la read/write
    int 21h
    mov thefile, ax ; cat the file
    
    mov ah, 3fh ; doc noi dung file vao vung dem
    mov bx, thefile
    lea dx, buffer
    mov cx, 250 ; so byte can doc tu file da mo
    int 21h
    
    mov ah, 3eh ; dong tap tin
    mov bx, thefile
    int 21h
    
    inchuoi tb2
    mov ah, 09h ; in noi dung cua file ra man hinh
    lea dx, buffer
    int 21h
    
    mov ah,08h ; dung man hinh de xem ket qua
    int 21h
    mov ah, 4ch ; thoat ve Dos
    int 21h
cseg ends
end begin   
                 