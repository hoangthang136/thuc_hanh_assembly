dseg segment
    tenfile db "d:\data.txt",0
    thefile dw ?
    buffer db 251 dup ('$')
dseg ends
cseg segment
assume cs:cseg, ds:dseg
begin: mov ax, dseg
    mov ds, ax
    
    mov ah, 3dh ; mo tap tin da co
    lea dx, tenfile
    mov al, 2 ; thuoc tinh. 0 la read, 1 la write, 2 la read/write
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
    
    mov ah, 09h ; in noi dung cua file ra man hinh
    lea dx, buffer
    int 21h
    
    mov ah,08h ; dung man hinh de xem ket qua
    int 21h
    mov ah, 4ch ; thoat ve Dos
    int 21h
cseg ends
end begin   

                 ; mo tap tin, doc tap tin va ghi vao bien buffer, dong tap tin va in buffer ra man hinh
                 ; 0 la read, 1 la write, 2 la read/write, 3,4 bi loi
                 ; the file nhu la id, dung de truy xuat file.
                 ; byte cx ma lon hon kich thuoc cua bien buffer thi chuong trinh se bi loi, vi khong the luu dc gia tri 
                 ; thanh ghi ac co thanh doi. no chua so byte da doc duoc neu thanh cong (CF=0). that bai ax chua ma loi (CF=1)
                 ; 
                 