    ; dem so ky tu trong chuoi
    ; co 2 cach: 1 la dung ngat 0ah, 2 la nhap vao tung ky tu trong luc nhap dem luon
inchuoi macro chuoi
    mov ah, 9
    lea dx, chuoi
    int 21h
endm
.model small
.stack 100h
.data
    tb1 db 'Nhap chuoi: $'
    tb2 db 10,13,'So ky tu trong chuoi la: $' 
    str db 100 dup('$')
.code
main proc
    mov ax, @data
    mov ds, ax
    
    inchuoi tb1
    mov ah, 0ah
    lea dx, str
    int 21h
    
    inchuoi tb2
    xor ah, ah
    mov al, str+1
    mov bx, 10
    mov cx, 0
    chia:
        xor dx, dx
        div bx
        push dx
        inc cx
        cmp al, 0
        jne chia
    xuat:
        pop dx
        add dl, 30h
        mov ah, 2
        int 21h
        loop xuat
    
    mov ah, 4ch
    int 21h
main endp
end