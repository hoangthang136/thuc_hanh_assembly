inchuoi MACRO chuoi
    MOV AH, 9h
    LEA DX, chuoi
    INT 21h
ENDM

DSEG SEGMENT
    msg1 DB "Hay nhap so A: $"
    msg2 db 'Hay nhap so B: $'
    msg3 DB "Tong: $"
    xdong DB 10, 13, '$'
    a dw ?
    x dw ?
    y dw ?
DSEG ENDS
CSEG SEGMENT
ASSUME CS:CSEG, DS:DSEG
begin: MOV AX, DSEG
    MOV DS, AX
    inchuoi msg1
    call dec_in
    mov ax, x
    mov a, ax 
    inchuoi xdong
    inchuoi msg2
    call dec_in
    mov ax, x
    add a, ax
    inchuoi xdong
    inchuoi msg3
    XOR AX, AX
    MOV ax, a 
    CALL dec_out
    MOV AH, 01
    INT 21h
    MOV AH, 4Ch 
    INT 21h

dec_out PROC
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
    RET
dec_out ENDP
    
dec_in proc
    mov bx, 10
    mov x, 0
    mov y, 0
    lap:
        mov ah, 1
        int 21h
        xor ah, ah
        cmp al, 13
        je exit
        sub al, 30h
        mov y, ax
        mov ax, x
        mul bx
        add ax, y
        mov x, ax
        jmp lap
    exit:
        ret    
dec_in endp

CSEG ENDS
END begin