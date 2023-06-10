inchuoi MACRO chuoi
    MOV AH, 9h
    LEA DX, chuoi
    INT 21h
ENDM

DSEG SEGMENT
    msg1 DB "Hay nhap ky tu thu nhat: $"
    msg2 DB 'Hay nhap ky tu thu hai: $'
    msg3 DB "Ket qua: $"
    xdong DB 10, 13, '$'
    kytu DB ?
DSEG ENDS
CSEG SEGMENT
ASSUME CS:CSEG, DS:DSEG
begin: MOV AX, DSEG
    MOV DS, AX
    
    inchuoi msg1
    call hex_in
    MOV kytu, bh
    inchuoi xdong
    inchuoi msg2
    call hex_in
    add kytu, bh 
    inchuoi xdong
    inchuoi msg3
    MOV BH, kytu 
    CALL hex_out
    MOV AH, 02 
    MOV DL, 'h'
    INT 21h
    MOV AH, 01
    INT 21h
    MOV AH, 4Ch 
    INT 21h
    
hex_out PROC
    MOV CX, 2
    xuat:PUSH CX
    MOV CL, 4
    MOV DL, BH
    SHR DL, CL     ; dich phai toan hang CL bit
    CMP DL, 09h    ; so sanh voi 9
    JA nhan        ; lon hon nhay den nhan nhan
    ADD DL, 30h    
    JMP inra
    nhan:ADD DL, 37h     ; in ra A,B,C,D,E,F
    inra:MOV AH, 02h 
    INT 21h
    SHL BX, CL     ; dich trai toan hang cl bit
    POP CX
    LOOP xuat
    RET
hex_out ENDP

hex_in proc
    xor bh, bh
    mov cx, 2
    lap:
        push cx
        mov cl, 4
        shl bh, cl
        mov ah, 1
        int 21h
        cmp al, 39h
        jg lon
        sub al, 30h
        add bh, al
        jmp tiep
        lon:
            sub al, 37h
            add bh, al
        tiep:
            
            pop cx
            loop lap
    ret    
hex_in endp    
CSEG ENDS
END begin