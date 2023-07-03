dseg segment
    tb1 db 'Nhap chuoi: $'
    string1 db 100 dup('$')
    tenfile db "d:\data.txt",0
    thefile dw ?
dseg ends
cseg segment
assume cs:cseg, ds:dseg
begin: mov ax, dseg
    mov ds, ax
    mov ah, 3ch ; tao tap tin moi
    lea dx, tenfile
    mov cx, 0 ; tap tin co thuoc tinh binh thuong
    int 21h
    mov thefile, ax ; cat the file 
    
    mov ah, 9
    lea dx, tb1
    int 21h
    mov ah, 10
    lea dx, string1
    int 21h
    
    mov ah, 40h ; ghi file
    mov bx, thefile
    xor cx, cx
    mov cl, string1+1
    lea dx, string1+2
    int 21h
    mov ah, 3eh ; dong tap tin
    mov bx, thefile
    int 21h
    mov ah, 4ch ; thoat ve Dos
    int 21h
cseg ends
end begin 