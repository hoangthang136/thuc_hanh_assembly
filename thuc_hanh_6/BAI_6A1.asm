inchuoi macro chuoi
    mov ah, 9
    lea dx, chuoi
    int 21h
endm

.model small
.stack 100h
.data
    tb1 db 'Nhap chuoi ky tu: $'
    tb2 db 10,13,'Chuoi ky tu vua nhap la: $'
    str db 100 dup('$')
.code
main proc
   mov ax, @data
   mov ds, ax
   
   inchuoi tb1
   mov cx, 10
   mov si, 0
   nhap:
      mov ah,8
      int 21h
      cmp al, 1Bh
      je thoat
      mov str[si], al
      inc si
      mov ah, 2
      mov dl, '*'
      int 21h
      loop nhap 
   thoat:
   inchuoi tb2
   mov ah, 9
   lea dx, str
   int 21h
   
   mov ah, 4ch
   int 21h 
main endp
end