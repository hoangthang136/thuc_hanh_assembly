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
    noidung db 100 dup(?)
    thefile dw ?
    dem db ?
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
        mov si, 0
        mov cl, 0
        nd:
            mov ah, 1
            int 21h
            cmp al, 13
            je ghi
            cmp si, 0
            je hoa
            cmp noidung[si-1], 20h
            jne nhap
        hoa:
            sub al, 20h
        nhap:    
            mov noidung[si],al
            inc si
            inc cl
            jmp nd        
            ; ghi file
        ghi:
        mov dem,cl
        mov ah, 40h
        lea dx, noidung
        mov bx, thefile
        xor cx, cx
        mov cl, dem
        int 21h
        
            ;dong file
        mov ah, 3eh
        mov bx, thefile
        int 21h
                
        mov ah, 4ch
        int 21h
    main endp
end