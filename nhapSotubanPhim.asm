; tinh tong cua a + b + c

.model small
.stack 100
.data 
    tb1 db 'A = $'
    tb2 db 'B = $'
    tb3 db 'C = $'
    tb4 db 'Tong= $'
    CRLF db 13,10,'$'
    a dw ?
    x dw ?
    y dw ?
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        ; nhap a
        mov ah, 9
        lea dx, tb1
        int 21h 
        call nhapso
        xor ax,ax  ; cong xo de ax ve 0
        mov ax, x
        mov a,ax
        
        ; nhap b
        mov ah, 9
        lea dx, CRLF
        int 21h
        lea dx, tb2
        int 21h
        call nhapso
        xor ax, ax
        mov ax, x
        add a, ax
        
        ; nhap c
        mov ah, 9
        lea dx, CRLF
        int 21h
        lea dx, tb3
        int 21h
        call nhapso
        xor ax, ax
        mov ax, x
        add a, ax
        
        ; xuat
        mov ah, 9
        lea dx, CRLF
        int 21h
        lea dx, tb4
        int 21h
        mov ax,a ; gan a cho ax de tien hanh chia
        call xuatso
        
        mov ah, 4ch
        int 21h    
    main endp
        ;nhap so
    nhapso proc
        ; de nhap so co 2 chu so tro len thi ta se nhap theo thuat toan xy=x*10+y
        mov x,0 ; gan gia tri x = 0
        mov y,0 ; gan gia tri y = 0
        mov bx, 10 ; gan gia tri bx = 10. bat buoc dung thanh ghi bx vi tinh nang thang mul       
        nhap:
            ; ngat de doc 1 ky tu tu ban phim
            mov ah, 1
            int 21h
            cmp al,13 ; so sanh gia tri vua nhap vao co phai la enter(13) hay khong  
            je thoat ; je la jump if equal. nhay den nhan thoat neu bang nhau
            sub al,30h ; gia tri vua nhap vao la ky tu(0-9 -> 30h-39h) chuyen sang dang so  
            xor ah,ah ; xoa ah ve 0. cac bien la 16bit nen ta can xoa ah de ax = 000? (?=0-9) de gan vao bien 
            mov y, ax ; gan so vua nhap cho y
            mov ax, x ; chuyen so nhap vong truoc cho x
            mul bx ; mul goc. voi goc 8 bit ax=al x goc. voi 16 bit dxax=ax x bx
            add ax, y ; cong hang don vi
            mov x, ax ; gan tro lai cho x
            jmp nhap ; nhay den nhan~ nhap khong dieu kien
        thoat:
            ret
    nhapso endp
        ;xuat
    xuatso proc
        mov bx,10 ; vi thang div goc, bx se la goc
        mov cx,0 ; dem so lan chia de biet ma loop
        chia:
            mov dx,0 ; dx luu so du
            div bx ; chia 2 toan hang. div goc. voi goc la 8bit: al=ax/goc,ah=ax%goc. goc la 16bit: ax=dxax/goc, dx=dxax%goc
            inc cx ; tang cx len 1 don vi
            push dx ; day phan du vao ngan xep
            cmp al,0 ; kiem tra chia het hay chua
            je ht ; neu chia het thi nhay den nhan ht de hien thi
            jmp chia ; nhay khong dieu kien den nhan chia
        ht:
            pop dx ; lay du lieu tu dinh ngan xep
            add dl,30h ; chuyen dang so thang ky tu
            ; ngat loai 2; in 1 ky tu ra man hinh
            mov ah, 2
            int 21h
            loop ht    
        ret
    xuatso endp    
end