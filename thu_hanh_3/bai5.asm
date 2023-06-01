inchuoi macro chuoi
    mov ah, 9
    lea dx, chuoi
    int 21h
endm

.model small
.stack 100h
.data
    tb1 db 'Nhap chuoi: $'
    CRLF db 10,13, '$'
    hoa db 'Chuoi thuong: $'
    thuong db 'Chuoi hoa: $'
    str db 100 dup('$')  
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        inchuoi tb1
        mov ah, 0ah
        lea dx, str
        int 21h
        inchuoi CRLF 
        inchuoi thuong
        lea si, [str+2]
        call inhoa
        inchuoi CRLF
        inchuoi hoa
        lea si, [str+2]
        call inthuong
        
        mov ah, 4ch
        int 21h
    main endp
    
    inhoa proc
        lap:
            mov dl, [si]
            cmp dl, 'a'
            jl ht
            cmp dl, 'z'
            jg ht
            sub dl, 20h
            mov [si], dl
        ht:
            inc si
            cmp [si], '$'
            je xuat
            jmp lap
        xuat:
            inchuoi str+2                      
        ret    
    inhoa endp
    
    inthuong proc
        lap1:
            mov dl, [si]
            cmp dl, 'A'
            jl ht1
            cmp dl, 'Z'
            jg ht1
            add dl, 20h
            mov [si], dl
        ht1:
            inc si
            cmp [si], '$'
            je xuat1
            jmp lap1
            
        xuat1:
            inchuoi str+2    
        ret    
    inthuong endp
    
    
end