.model small
.stack 100
.data
    tb1 db 'Nhap chuoi: $'
    tb2 db 13, 10, 'Chuoi hoa la: $'
    str db 100 dup('$')
.code
    main proc 
        ; khoi tao db
        mov ax, @data
        mov ds, ax
        
        ;in thong bao
        lea dx, tb1
        mov ah, 9
        int 21h
        
        ;nhap chuoi
        mov ah, 10 
        lea dx, str
        int 21h
        
        ;in chuoi in hoa
        lea dx, tb2
        mov ah, 9
        int 21h
        call inhoa  ;goi chuong trinh con
        
        mov ah, 4ch
        int 21h
    main endp
    
    inhoa proc
        lea si, str+2 ;nap dia chi cua chuoi vao thanh ghi si, si luu dia chi lenh dau
        lap1: ; lap1 duoc goi la nhan. khi ta su dung vong lap hay buoc nhay ta can nhan de goi den de thuc hien. kiem tra tung ky tu mot
            mov dl, [si] ;  chuyen noi dung o nho co dia chi DS:SI vao DL. co nghia la luu dia chi hex vao dl 
            cmp dl, 'a' ; cmp dich, goc. chuc nang so sanh hai toan hang dich va goc
            jl in1 ; jl (jump if lower) la lenh nhay neu be hon. co nghia se nhay den nhan in1 neu gia tri trong DL be hon 'a'
            cmp dl, 'z'
            jg in1 ; jg (jump if greater) nhay neu lon hon. co nghia nhay den in1 neu gia tri trong DL lom hon 'z'
            sub dl, 32 ; neu nhu no nam trong khoang a->z thi chuyen thanh in hoa bang cach tru di 32 or 20h
        in1: ; nhanx
            mov ah, 2
            int 21h
            inc si ; inc dich. chuc nang dich = dich + 1. o day la si+1 co nghia la dang o byte 2+1 len byte3
            cmp [si], '$' ; so sanh xem ky tu do la dau ket thuc chuoi chua 
            jne lap1 ; jne (jump if not equal) nhay neu khong bang. co nghia neu o nho si khong phai la dia chi $ thi tiep tuc lap cac ky tu tiep de thanh ky tu  hoa
        ret ; ket thuc chuong trinh con
    inhoa endp                                                                                                                                       
end