.model small
.stack 100h
.data
    str db 100 dup('$')
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 2
        mov dl, 48h   ; H
        int 21h
        mov dl, 61h   ; a
        int 21h
        mov dl, 79h   ; y
        int 21h
        mov dl, 20h   ; ' '
        int 21h
        mov dl, 67h   ; g
        int 21h
        mov dl, 6fh   ; o
        int 21h
        mov dl, 20h
        int 21h
        mov dl, 76h   ; v
        int 21h
        mov dl, 61h   ; a
        int 21h
        mov dl, 6fh   ; o
        int 21h
        mov dl, 20h   ; 
        int 21h
        mov dl, 31h   ; 1
        int 21h
        mov dl, 20h   
        int 21h
        mov dl, 63h   ; c
        int 21h
        mov dl, 68h   ; h
        int 21h
        mov dl, 75h   ; u
        int 21h
        mov dl, 6fh   ; o
        int 21h
        mov dl, 69h   ; i
        int 21h
        mov dl, 3ah   ; ':'
        int 21h
        mov dl, 20h
        int 21h
                      
        
        mov ah, 0ah
        lea dx, str
        int 21h
        
        mov ah, 4ch
        int 21h    
    main endp
end