DSEG SEGMENT
a db ?
DSEG ENDS
CSEG SEGMENT
ASSUME CS: CSEG
start:mov dl, 'A' 
    nhan:mov ah, 02h 
    int 21h
    inc dl 
    cmp dl, 'Z' 
    jna nhan 
    mov ah, 08h 
    int 21h
        
        ; xuong dong
        mov ah,2
        mov dl, 10
        int 21h
        mov dl, 13
        int 21h
        
        ; in ky tu tu Z -> A
    mov dl, 'Z' 
    nhan1:
    mov ah, 02h 
    int 21h
    dec dl 
    cmp dl, 'A' 
    jae nhan1 
    mov ah, 08h 
    int 21h
    
    
        ; xuong dong
        mov ah,2
        mov dl, 10
        int 21h
        mov dl, 13
        int 21h
        
        ; in ky tu tu Z -> A co khoan trang
    mov dl, 'Z' 
    nhan2:
    mov ah, 02h 
    int 21h
    mov a, dl
    mov dl, 20h
    int 21h
    mov dl, a
    dec dl 
    cmp dl, 'A' 
    jae nhan2 
    mov ah, 08h 
    int 21h
    
    ; xuong dong
        mov ah,2
        mov dl, 10
        int 21h
        mov dl, 13
        int 21h 
            
       ; cau truc lap for
    mov dl, 'A'
    mov cx, 26 
    nhan3:
    mov ah, 02h 
    int 21h
    inc dl 
    loop nhan3 
    mov ah, 08h 
    int 21h        
            
    mov ah, 4Ch
    int 21h
CSEG ENDS
END start
           
           
           ; vong lap bao gom tu dong 7->11. Viet theo kieu do while
           
           