CSEG SEGMENT
ASSUME CS: CSEG
start: mov ah, 02h 
    mov dl, 'B' 
    int 21h 
    mov ah, 08h 
    int 21h
    
    ; xuong dong
    mov ah, 02h
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h
    
    ; in ra man hinh so 9
    mov dl, 9
    add dl, 30h
    mov ah, 02h
    int 21h
    
    ; xuong dong
    mov ah, 02h
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h
    
    ; in ra man hinh so 89 
    xor ax, ax
    mov ax, 89
    mov bx, 10
    mov cx, 0
    chia:
        mov dx,0
        div bx
        push dx
        inc cx
        cmp al,0
        je xuat
        jmp chia
    xuat:
        pop dx
        mov ah, 2
        add dl, 30h
        int 21h
        loop xuat
    
    
    mov ah, 4Ch 
    int 21h
CSEG ENDS
END start 

    ; dong lenh 4,5,6 thuc hien chuc nang in ki tu 'B' ra man hinh
    ; dong lenh 7, 8  thuc hien dung chuong trinh doi 1 ky tu tu ban phim
    ; dong lenh 9, 10 ket thuc chuong trinh
    
    ; sua dong lenh so 5 'B' thanh 'D'
    
    
    ; 2 dong lenh 6 va 7 la tam dung chuong trinh cho 1 su kien tu ban phim de tiep tuc chuong trinh
    ; neu khong co 2 dong do thi chuong trinh chay mot manh tu dau den cuoi khong bi dung
