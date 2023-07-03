inchuoi macro chuoi
    mov ah, 9
    lea dx, chuoi
    int 21h
endm
.model small
.stack 100h
.data
    tb1 db 'Nhap ten file: $'
    tb2 db 10,13,'Noi dung: $'
    tb3 db 10,13, 'Noi dung can them: $'
    tenfile db 100 dup(?)
    tenfilepaste db 100 dup (?)
    thefile dw ?
    buffer db 100 dup ('$')
    noidung db 100 dup('$') 
.code
main proc
    mov ax, @data
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
    mov al, 2 ; thuoc tinh. 0 la read, 1 la write, 2 la read/write
    int 21h
    mov thefile, ax ; cat the file
    
    mov ah, 3fh ; doc noi dung file vao vung dem
    mov bx, thefile
    lea dx, buffer
    mov cx, 99 ; so byte can doc tu file da mo
    int 21h
    
    inchuoi tb2
    mov ah, 09h ; in noi dung cua file ra man hinh
    lea dx, buffer
    int 21h
    
    inchuoi tb3
    mov ah, 0ah
    lea dx, noidung
    int 21h
        
        ; dua con tro xuong cuoi file
    mov ah, 42h
    mov al, 2    ; 2 la xuong cuoi, 1 la hien tai, 0 la ve dau
    mov bx, thefile
    xor cx, cx
    xor dx, dx
    int 21h

        ; ghi
    mov ah, 40h
    mov bx, thefile
    lea dx, noidung+2
    xor cx, cx
    mov cl, noidung+1
    int 21h
    
    mov ah, 3eh ; dong tap tin
    mov bx, thefile
    int 21h
    
    mov ah, 4ch ; thoat ve Dos
    int 21h
main endp
end
                 