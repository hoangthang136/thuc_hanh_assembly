inchuoi macro chuoi
    mov ah, 9
    lea dx, chuoi
    int 21h
endm

.model small
.stack 100h
.data
    tb1 db 'Nhap chuoi ky tu: $'
    tb2 db 'Ban da nhap dung roi! $'
    tb3 db 'Ban da nhap sai roi va vui long nhap lai! $'
    CRLF db 13,10,'$'
    oldpass db '1234567890'
    str db 100 dup('$')
.code
main proc
   mov ax, @data
   mov ds, ax
   mov es, ax
   
   start:
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
       cld
       mov cx, 10
       lea si, oldpass
       lea di, str
       repe cmpsb
       je giong
       inchuoi CRLF
       inchuoi tb3
       inchuoi CRLF
       jmp start
   giong:
       inchuoi CRLF
       inchuoi tb2
   
   mov ah, 4ch
   int 21h 
main endp
end