.model small
.stack 100
.data
    tb1 db 'Nhap xau: $'
    tb2 db 13, 10, 'Xau dao nguoc: $'
    str db 50 dup('$')
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 9
        lea dx, tb1
        int 21h
        
        mov cx, 0 ; khoi tao thanh ghi cx bang 0
        lap:
            inc cx ; tang cx len 1 don vi
            mov ah, 1
            int 21h
            cmp al, '#'  ; so sanh ky tu vua nhap vao voi '#'
            je in1       ; neu ki tu do la ky tu '#' thi nhay den in
            push ax      ; day vao stack
            jmp lap      ; nhay ve lap de viet them ky tu
        in1:
            mov ah, 9
            lea dx, tb2
            int 21h
        in2:
            pop dx       ; lay tu ky tu ra khoi stack
            mov ah, 2
            int 21h      ; in ra man hinh ki tu do
            loop in2
        
        mov ah, 4ch
        int 21h   
    main endp
end