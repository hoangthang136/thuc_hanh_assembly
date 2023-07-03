dseg segment
    string1 db "Khong co gi quy hon doc lap tu do"
    len dw $ - string1
    string2 db 34 dup('$')
dseg ends
cseg segment
assume cs:cseg, ds:dseg, es: dseg
begin: mov ax, dseg
    mov ds, ax
    mov es, ax
    
    cld ; chon chieu xu ly chuoi
    ;std
    mov cx, 33 ; so ky tu/so byte can di chuyen
    lea si, string1 ; (DS:SI)--> dia chi cua chuoi nguon
    lea di, string2 ; (ES:DI)--> dia chi cua chuoi dich
    repne movsb ; di chuyen tung byte
    mov ah, 09h
    lea dx, string2
    int 21h
        ; chieu dai bien
    mov ah, 2
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h    
    mov ax, len
    XOR CX,CX 
    MOV BX,10
    chia10: XOR DX,DX
        DIV BX  
        PUSH DX 
        INC CX
        CMP AX, 0
        JNZ chia10 
        inra: MOV AH,2 
        POP DX 
        ADD DL,30h 
        INT 21h
        LOOP inra
        
    mov ah,08h ; dung man hinh de xem ket qua
    int 21h
    mov ah, 4ch ; thoat ve Dos
    int 21h
end begin
cseg ends   

        ; can khai bao 34 byte tai vi byte cuoi se la '$'. neu thay 34 thanh 33 thi loi o ngat 9 vi no chi in chuoi ra man hinh khi co dau ket thuc chuoi '$'
        ; std se dat co DF=1 luc do chi di chuyen 1 byte dau tien con cac byte sau khong di chuyen ma bi xoa.
        ; thay movsb thanh mov sw thi can khai bao lai 2 bien string1 va string2 thanh DW
        ; co the thay the rep movsb thanh repe movsb, repe movsw, repne movsb, ...      
        ; string1 co so byte > 256 thi luc nay phai khai bao la DW va tien hanh di chuyen tung byte mot rat lau
        ; co cach xac dinh chieu dai bien.
        