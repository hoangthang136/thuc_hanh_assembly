inchuoi macro chuoi
    mov ah, 9
    lea dx, chuoi
    int 21h
endm
dseg segment
    tb1 db 'Nhap ten file: $'
    tb2 db 10,13,'Noi dung: $'
    tb3 db 10,13, 'Nhap ten file paste: $'
    tenfile db 100 dup(?)
    tenfilepaste db 100 dup (?)
    thefile dw ?
    buffer db 251 dup ('$')
    len db ? 
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
    
        ;dem
    lea si, buffer
    mov cl, 0
    dem:
        cmp [si], 36
        je copy
        inc si
        inc cl
        jmp dem
        
    copy:
    mov len, cl
    inchuoi tb3
    mov si, 0
    nhapten:
        mov ah, 1
        int 21h
        cmp al, 13
        je create
        mov tenfilepaste[si],al
        inc si
        jmp nhapten
    
    create:
        mov ah, 3ch
        lea dx, tenfilepaste
        mov cx, 0 
        int 21h
        mov thefile, ax
         ; ghi 
     mov ah, 40h
     lea dx, buffer
     mov bx, thefile
     xor cx, cx
     mov cl, len
     int 21h
     
     mov ah, 3eh
     mov bx, thefile
     int 21h
    
    mov ah,08h ; dung man hinh de xem ket qua
    int 21h
    mov ah, 4ch ; thoat ve Dos
    int 21h
cseg ends
end begin   
                 