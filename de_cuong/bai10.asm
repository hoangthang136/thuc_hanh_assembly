    ; so sanh 2 chuoi
inchuoi macro chuoi
    mov ah, 9
    lea dx, chuoi
    int 21h
endm
.model small
.stack 100h
.data
    tb1 db 'Nhap chuoi ky tu 1: $'
    tb2 db 10,13,'Nhap chuoi ky tu 2: $'
    tb3 db 10,13, 'Noi dung hai chuoi giong nhau!$'
    tb4 db 10,13, 'Noi dung hai chuoi khac nhau!$'
    tb5 db 10,13, 'Do dai hai chuoi khac nhau!$'
    str1 db 100 dup('$')
    str2 db 100 dup('$')
.code
main proc
    mov ax, @data
    mov ds, ax
    mov es, ax
    
    inchuoi tb1
    mov ah, 0ah
    lea dx, str1
    int 21h
    inchuoi tb2
    mov ah, 0ah
    lea dx, str2
    int 21h
    
    xor ch, ch
    mov cl, str1+1
    cmp cl, str2+1
    je sosanh
    inchuoi tb5
    jmp exit
    sosanh:
        cld
        lea si, str1+2
        lea di, str2+2
        repe cmpsb
        je bang
        inchuoi tb4
        jmp exit
    bang:
        inchuoi tb3
    exit:
    mov ah, 4ch
    int 21h
main endp
end    