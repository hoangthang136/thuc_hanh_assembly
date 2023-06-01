.model small
.stack 100
.data
    tb1 db 'Nhap ky tu: $'
    tb2 db 13,10,'Ky tu vua nhap la: $'
    x db ?
.code
    main proc 
        ; khai bao data
        mov ax, @data
        mov ds, ax
          
          ; in xau tb1 ra man hinh
        mov ah, 9 ; ngat loai 9: in xau ra man hinh
        lea dx, tb1
        int 21h
        
          ; nhan ky tu tu ban phim
          ; ngat loai 1: doc mot ky tu duoc nhap vao tu ban phim. thuc hien khi ah = 1.
          ; chuc nang: doc 1 ky tu duoc nhap vao tu ban phim, AL se luu ma ASCII cua phim vua nhap. neu la phim chuc nang thi AL = 0
        mov ah, 1 
        int 21h
        mov x, al
        
          ;in ky tu vua nhap ra man hinh
        lea dx, tb2
        mov ah, 9
        int 21h
        
        mov ah, 2 ; ngat loai 2: hien mot ky tu len man hinh. chuc nang: hien 1 ky tu co ma ASCII la gia trij cua DL len man hinh
        mov dl, x
        int 21h
        
          ; ngat chuong trinh
        mov ah, 4ch
        int 21h
    main endp
end