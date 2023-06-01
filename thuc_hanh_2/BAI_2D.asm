DSEG SEGMENT
    max DB 30
    len DB 0
    chuoi DB 30 dup(?)
    tbao DB 'Hay go vao 1 chuoi: $'
    CRLF db 10,13,'$'
DSEG ENDS
CSEG SEGMENT
    ASSUME CS: CSEG, DS: DSEG
start: mov ax, DSEG
    mov ds, ax
    mov ah, 09h 
    lea dx, tbao
    int 21h
    mov ah, 0Ah 
    lea dx, MAX 
    int 21h
    
    mov al, len 
    mov ah, 4Ch 
    int 21h
CSEG ENDS
    END start
         
         
         ; khong the nhao dc nhieu hon 30 ky tu vi ta chi khai bao chuoi co do dai 30 ky tu
         ; gia tri len se la do dai chuoi nhap vao tu ban phim
         ; thay doi max db 30 thanh db 100
         ; kha nang doi da cua ham 0ah phu thuoc vao so ky tu ma bien dat duoc