DSEG SEGMENT
chuoi DB 'Khoa cong nghe thong tin HVMM$'
chuoi1 db 10,13,'kma', 10, 13, 'cntt', 10,13,'$'
DSEG ENDS
CSEG SEGMENT
ASSUME CS: CSEG, DS: DSEG
start: mov ax, DSEG
mov ds, ax
mov ah, 09h 
lea dx, chuoi 
int 21h 
mov ah, 08h
int 21h
mov ah, 09h 
lea dx, chuoi1 
int 21h

 ; in ra man hinh so 2022
 xor ax,ax
 mov ax, 2022
 mov bx, 10
 mov cx, 0
 chia:
    mov dx, 0
    div bx
    push dx
    inc cx
    cmp al,0
    je xuat
    jmp chia
 xuat:
    pop dx
    add dl, 30h
    mov ah, 2
    int 21h
    loop xuat    

mov ah, 4Ch 
int 21h
CSEG ENDS
END start
      
      
      ; gia tri 10 la gia tri decimal cua ky tu xuong dong trong ma ascii
      ; gia tri 13 la gia tri decimal cua ky tu tro ve dau dong trong ma ascii