; nhap vao masv, hien thi ten cua minh

    ; method
inchuoi macro chuoi
    mov ah, 9
    lea dx, chuoi
    int 21h
endm

.model small
.stack 100h
.data
    tb1 db 'Nhap MaSV: $'
    hoten db 10,13,'Ten SV: Hoang Hung Thang$'
    tb2 db 10,13,'Thong tin sai!$'
    masvhoa db 'AT170545'
    masvthuong db 'at170545'
    masvinput db 100 dup('$')
.code
    main proc
        mov ax, @data
        mov ds, ax
        mov es, ax ; thanh ghi doan giong ds
    
        inchuoi tb1
    
        mov ah, 10
        lea dx, masvinput
        int 21h
        cmp masvinput+1, 8
        jne err 
    
            ; so sanh chuoi
        cld  ; xoa co DF trong thanh ghi EFlags. Chu yeu la de thao tac 2 thanh ghi si, di
        mov cx, 8
        lea si, masvhoa
        lea di, masvinput+2
        repe cmpsb
        je trung
        ; cmpsb la su dung de so sanh mot byte(word) trong SI voi mot byte(word) trong chuoi DI. Thuc hien bang cach tru byte trong DI khoi byte trong SI
        ; gia tri co DF xac dinh xem SI va DI se tang(DF=0) hay giam (DF=1) sau moi lan di chuyen. Tang hay giam xay ra 1 doi voi chuoi byte va 2 doi voi chuoi word
        ; thanh ghi cx khai bao so byte can so sanh 
        
        cld
        mov cx, 8
        lea si, masvthuong
        lea di, masvinput+2
        repe cmpsb
        je trung
        
        err:
        inchuoi tb2
        jmp exit
        
        trung:
            inchuoi hoten
        
        exit:
            mov ah, 4ch
            int 21h    
    main endp
end