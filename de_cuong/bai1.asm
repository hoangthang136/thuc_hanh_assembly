; tinh n!
inchuoi MACRO chuoi    ; macro nhu la mot method. sau macro la bien
    mov ah, 9
    lea dx, chuoi
    int 21h
endm                   ; ket thuc macro

.model small
.stack 100h
.data
    tb1 db 'Nhap n: $'
    tb2 db 13,10,'Ket qua: $'
    tb3 db 13,10,'Vui long nhap so tu nhien!$'
    n dw ?
    tmp dw ?
    kq dw ?
.code
    main proc
    mov ax, @data
    mov ds, ax
    
    inchuoi tb1
    
        ; nhap so
    mov bx, 10
    mov n, 0
    mov tmp, 0
    nhap:
        mov ah, 1
        int 21h
        cmp al, 13
        je  giaithua
        cmp al, 30h
        jl err
        cmp al, 39h
        jg err
        xor ah, ah
        sub ax, 30h
        mov tmp, ax
        mov ax, n
        mul bx
        add ax, tmp
        mov n, ax
        jmp nhap
       
        ; tinh n!
    giaithua:
        cmp n, 0
        je gt2
    	cmp n, 1
    	je gt2 
        
        mov ax, n
        mov bx, 1
        lap:
            mul bx
            mov kq, ax
            inc bx
            cmp bx, n
            je xuat
            jmp lap
	
    gt2:
	mov kq, 1
	jmp xuat	    
    
    xuat:
        inchuoi tb2
        mov ax, kq
        mov bx, 10
        mov cx, 0
        chia:
            xor dx, dx
            div bx
            push dx
            inc cx
            cmp ax, 0
            je ht
            jmp chia
        ht:
            pop dx
            add dl, 30h
            mov ah, 2
            int 21h
            loop ht
        jmp exit
        
    err:
        inchuoi tb3
            
    exit:
    mov ah, 4ch
    int 21h    
    main endp
end