    ; tao tep tin moi, ghi noi dung vao tep tin vua nhap
inchuoi macro chuoi
    mov ah, 9
    lea dx, chuoi
    int 21h
endm

.model small
.stack 100h
.data
    tb1 db 'Nhap ten tap tin: $'
    tb2 db 10,13,'Nhap noi dung: $'
    tb3 db 10,13,'Thanh cong!$'
    error db 10,13,'Khong thanh cong!$'
    tenfile db 100 dup(?)
    thefile dw ?
    nd db 100 dup('$')
.code
main proc
    mov ax, @data
    mov ds, ax
    
    inchuoi tb1
    mov si, 0
    mov tenfile[si], 'e'
    inc si
    mov tenfile[si], ':'
    inc si
    mov tenfile[si], '\'
    inc si
    nhap:
        mov ah, 1
        int 21h
        cmp al, 13
        je create
        mov tenfile[si], al
        inc si
        jmp nhap
    create:
        mov ah, 3ch
        lea dx, tenfile
        mov cx, 0
        int 21h
        mov thefile, ax
        jc err              ; nhay neu co co nho (cf=1)
        
    inchuoi tb2
    mov ah, 0ah
    lea dx, nd
    int 21h
    
    mov ah, 40h
    mov bx, thefile
    lea dx, nd+2
    xor cx,cx
    mov cl, nd+1
    int 21h
    jc err
    
    mov ah, 3eh
    mov bx, thefile
    int 21h
    jc err
    inchuoi tb3    
    jmp exit    
    err:
    inchuoi error
    exit:
    mov ah, 4ch
    int 21h
main endp
end