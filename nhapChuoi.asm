.model small
.stack 100
.data
    tb1 db 'Nhap vao chuoi: $'
    tb2 db 13,10,'Chuoi vua nhap la: $'
    chuoi db 100 dup('$') ; khai bao mang chuoi do dai 100
.code                                                     
    main proc  
          ;khoi tao db
        mov ax, @data
        mov ds, ax
        
        lea dx, tb1
        mov ah, 9
        int 21h
        
          ;nhap chuoi ky tu
        ; ham ngat 10(0Ah) dung de nhap 1 xau ky tu vao 1 bien dem cho truoc trong chuong trinh, bien nay phai duoc chi boi thanh ghi DS:DX. va bien dem phai co dang:
        ;   byte 0: chua so ky tu toi da cua xau nhap vao
        ;   byte 1 chua 1 tri khong(=0)
        ;   byte 2, 3,4 chua mot tri rong, de chua cac ky tu se duoc nhap sau nay
        ;vd: xau_nhap db 256,0,256 dup ('')
        mov ah, 10
        lea dx, chuoi
        int 21h
        
        lea dx, tb2
        mov ah, 9
        int 21h
        
           ;in chuoi vua nhap
        lea dx, chuoi+2 ;+2 la vi byte0 khong thay doi van chua 256, byte1 la do dai cua chuoi vua nhap, tu byte 2 tro di moi la nhung ky tu minh nhap vao. vd: hello = 256.5.h.e.l.l.o
        int 21h ;in ra
        
        mov ah, 4ch
        int 21h
    main endp
end