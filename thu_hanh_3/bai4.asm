inchuoi macro chuoi
    mov ah, 9
    lea dx, chuoi
    int 21h
endm

.model small
.stack 100h
.data
    tb1 db 'Nhap chuoi ky tu: $'
    tb2 db 10,13,'Chuoi ky tu vua nhap la: $'
    tb3 db ' => so ki tu trong chuoi la: $'
    xau dw ?
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        inchuoi tb1
        mov bl,0
        lea si,xau
        mov ah,1
        doc:
            int 21h
            cmp al, 13
            mov [si], al
            je xuat
            inc si
            inc bl
            jmp doc
        xuat:
            mov [si], '$'
            inchuoi tb2
            inchuoi xau
            add bl, 30h
            inchuoi tb3
            mov ah,2
            mov dl, bl
            int 21h    
                        
        mov ah, 4ch
        int 21h    
    main endp
end