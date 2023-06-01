inchuoi macro chuoi
    mov ah, 9
    lea dx, chuoi
    int 21h
endm

exit macro
    mov ah, 4ch
    int 21h
endm

.model small
.stack 100h
.data
    tb1 db 'Nhap ky tu: $'
    tb2 db 10,13,'Good morning!$'
    tb3 db 10,13,'Good Afternoon!$'
    tb4 db 10,13, 'Good everning!$'
    tb5 db 10,13, 'ERROR!$'
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        inchuoi tb1
        mov ah,1
        int 21h
        
        cmp al, 'S'
        je sang
        cmp al, 's'
        je sang
        cmp al, 'T'
        je chieu
        cmp al, 't'
        je chieu
        cmp al, 'C'
        je toi
        cmp al, 'c'
        je toi
        
        jmp err
        
        sang:
            inchuoi tb2
            exit
        chieu:
            inchuoi tb3
            exit
        toi:
            inchuoi tb4
            exit
        err:
            inchuoi tb5
            exit    
           
    main endp
end