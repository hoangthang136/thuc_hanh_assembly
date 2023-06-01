inchuoi macro chuoi
    mov ah, 9
    lea dx, chuoi
    int 21h
endm

.model small
.stack 100h
.data
    tb1 db 'Nhap ky tu: $'
    hoa db 10,13,'Ky tu hoa$'
    thuong db 10,13, 'Ky tu thuong$'
    khac db 10,13, 'Ky tu khac$'
.code
    main proc
    mov ax, @data
    mov ds, ax
    
    inchuoi tb1
    mov ah, 1
    int 21h
    cmp al, 'a'
    jl kthoa
    cmp al, 'z'
    jg ktkhac
    inchuoi thuong
    jmp exit 
     
    kthoa:
        cmp al, 'A'
        jl ktkhac
        cmp al, 'Z'
        jg ktkhac
        inchuoi hoa
        jmp exit
        
    ktkhac:
        inchuoi khac
    
    exit:
        mov ah, 4ch
        int 21h    
    main endp
end