DSEG SEGMENT
    tbao DB 'Hay go vao 1 phim: $'
DSEG ENDS
CSEG SEGMENT
ASSUME CS: CSEG, DS: DSEG
start:mov ax, DSEG
    mov ds, ax
    mov ah, 09h 
    lea dx, tbao
    int 21h
    mov ah, 07h 
    int 21h
    mov ah, 4Ch 
    int 21h
CSEG ENDS
END start
       
       
       ; ky tu vua nhap vao dc luu tru o thanh ghi al va dc cpu quan ly o dang hex 
       ; ham  ngat 1 la hien ki tu nhap tu ban phim len man hinh nhap va luu va thanh ghi con ngat 7 la khong hien ky tu nhap tu ban phim len mam hinh hien ma chi ghi vao thanh ghi
       