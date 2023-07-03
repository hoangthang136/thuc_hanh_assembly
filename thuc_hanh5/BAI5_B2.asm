; tao file, ghi file
inchuoi macro chuoi
    mov ah, 9
    lea dx, chuoi
    int 21h
endm

.model small
.stack 100h
.data
    tb1 db 'Nhap ten file: $'
    tb2 db 13,10,'Noi dung file: $'
    tenfile db 100 dup(?)
    noidung db 100 dup('$')
    thefile dw ?
.code
    main proc
        mov ax, @data
        mov ds, ax
        
            ;nhap ten tap tin
        inchuoi tb1
        mov si, 0  
        nhapten:
            mov ah, 1
            int 21h
            cmp al, 13
            je createfile
            mov tenfile[si], al
            inc si
            jmp nhapten
       
            ; tao file
        createfile:
            mov ah, 3ch
            lea dx, tenfile
            mov cx, 0
            int 21h
            mov thefile, ax
            
            ; noi dung
        inchuoi tb2
        mov ah, 0ah
        lea dx, noidung
        int 21h
        
            ; ghi file
        mov ah, 40h
        lea dx, noidung+2
        mov bx, thefile
        xor cx, cx
        mov cl, noidung+1
        int 21h
        
            ;dong file
        mov ah, 3eh
        mov bx, thefile
        int 21h
                
        mov ah, 4ch
        int 21h
    main endp
end