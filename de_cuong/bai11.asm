    ; tim ky tu trong chuoi
inchuoi macro chuoi
    mov ah, 9
    lea dx, chuoi
    int 21h
endm
.model small
.stack 100h
.data
    tb1 db 'Nhap chuoi ky tu: $'
    tb2 db 10, 13, 'Nhap ky tu can tim: $'
    tb3 db 10,13,'Ky tu tren co trong chuoi!$'
    tb4 db 10,13,'Ky tu tren khong co trong chuoi!$'
    str db 100 dup('$')
.code
main proc
    mov ax, @data
    mov ds, ax
    mov es, ax
    
    inchuoi tb1
    mov ah,0ah
    lea dx, str
    int 21h
    inchuoi tb2
    mov ah, 1
    int 21h
    
    xor cx, cx
    cld
    mov cl, str+1
    lea di, str+2
    repne scasb
    je kt
    inchuoi tb4
    jmp exit
    kt:
    inchuoi tb3
    exit:
    mov ah, 4ch
    int 21h
main endp        
end