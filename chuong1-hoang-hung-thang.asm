; 4.3.1
; a.
; mov ah, 80 -> 80 = 50h, ax=5000h
; mov al, 86 -> 86 = 56h, ax=5056h   
; mov bx, ax -> bh=50h,bl=56h
; mov dh,bl -> dh=56h, dx=5600h
; mov dl,bh -> dl=50h, dx=5650h
; mov si,cs -> si=717h

; b.
; mov ax,8086 -> 8086 = 1F96h, ah=1Fh,al=96h
; add al,3 -> al=99h, ax=1F99h
; dec ax -> (ax = ax-1) ah=1Fh, al=98h, ax=1F98h
; sub ah,10h -> ah=0Fh, al=98h, ax=0F98h
; and ax, 0FF0h -> ax=0F90h

; => chuyen het ve he thap luc phan de tinh toan ah la 2 so dau al la 2 so sau cua ax
; cong tru ah(or al) deo khong lien quan den al(or ah)
; and dich, goc -> dung de lay di mot so bit nhat dinh cua 1 toan hang (hieu non na la F la giua nguyen, 0 la chuyen ve 0)

; 4.3.3
; SUM1.ASM
;.model small
;.stack 100
;.data
;.code
;    main proc
;        mov ax, 8086
;        add ax, 10
;        sub ax, 100h
;        add ax, 350
;        add ax, 0FAh
;        ; ax = 20f8h = 8440
;        mov ah, 4ch
;        int 21h    
;    main endp
;end

; SUM2.ASM
;.model small
;.stack 100
;.data 
;    a dw 1000
;    b dw 10
;    c dw 1Fh
;    d dw 30h
;    e dw 300Ah
;    kqua dw ?
;.code
;    main proc
;        mov ax, @data
;        mov ds, ax
        
;        xor ax,ax   ; cong xo chuyen gia tri thanh ghi ax ve 0
;        mov ax, a
;        add ax, b
;        sub ax, c
;        add ax, d
;        add ax, e
;        mov kqua, ax
;        mov bx, 10   ; de xuat so ra man hinh thi ta tach ab=a*10+b de in tung ky tu. su dung thang ghi bx = 10 de chia lay hang don vi
;        mov cx,0     ; dem so luong chu so de ty thuc hien vong lap.
;        chia:
;            mov dx,0 ; chuyen gia tri thanh ghi dx ve 0
;            div bx   ; div goc. voi thanh ghi 8bit: al=ax/goc, ah=ax%goc. thang ghi 16bit: ax=dxax/goc, dx=dxax%goc
;            push dx  ; day vao trong ngan xep
;            inc cx   ; c++
;            cmp al,0 ; neu gia tri thuong cua phep chi bang 0 thi la da lay het cac chu so
;            je ht    ; nhay sang nhan ht
;            jmp chia ; nhay khong dieu kien den nhan chia
;        ht:
;            pop dx   ; lay gia tri dau ngan xep
;            add dl,30h ; chuyen gia tri so thanh ky tu
;            mov ah,2  ; ngat loai 2 de in ky tu ra man hinh
;            int 21h        
;            loop ht   ; vong lap. qua moi vong lap thi cx tu dong tru di 1. cx=0 thi ket thuc vong lap
;        mov ah, 4ch
;        int 21h
;    main endp    
;end

; bai tap
; bai 3
.model small
.stack 100h
.data  
    
    a1 dw 15h
    a2 dw 250
    akq dw ?
    tb1 db 'Ket qua cau a: $'
    b1 dw 16
    b2 dw 0af1h
    bkq dw ?
    tb2 db 'Ket qua cau b: $'
    c1 dw 300
    c2 dw 400
    ckq dw ?
    tb3 db 'Ket qua cau c: $'
    d1 dw 1000
    d2 dw 100
    dkq dw ?
    ddu dw ?
    tb4 db 'Ket qua cau d: thuong= $'
    tb41 db '    du=$'
    e1 dw 1000
    e2 dw 100h
    ekq dw ?
    edu dw ?
    tb5 db 'Ket qua cau e: thuong= $'
    tb51 db '    du=$'
    f1 dd 3ab45eh
    f2 dw 0a1h
    fkq dw ?
    fdu dw ?
    tb6 db 'Ket qua cau f: $' 
    CRLF db 13,10,'$'
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        ; cau a
        xor ax,ax
        mov ax,a1
        mul a2
        mov akq, ax
        mov ah, 9
        lea dx, tb1
        int 21h
        mov ax,akq
        call xuat
        
        ; cau b
        xor ax,ax
        mov ax,b1
        mul b2
        mov bkq, ax
        mov ah, 9 
        lea dx, CRLF
        int 21h
        lea dx, tb2
        int 21h
        mov ax,bkq
        call xuat
        
        ; cau c
        xor ax,ax
        mov ax,c1
        mul c2
        mov ckq, ax
        mov ah, 9 
        lea dx, CRLF
        int 21h
        lea dx, tb3
        int 21h
        mov ax,ckq
        call xuat
        
        ; cau d
        xor ax,ax
        xor dx,dx
        mov ax,d1
        div d2
        mov dkq, ax
        mov ddu, dx
        mov ah, 9 
        lea dx, CRLF
        int 21h
        lea dx, tb4
        int 21h
        mov ax,dkq
        call xuat
        mov ah,9
        lea dx, tb41
        int 21h
        mov ax,ddu
        call xuat
        
        ; cau e
        xor ax,ax
        xor dx,dx
        mov ax,e1
        div e2
        mov ekq, ax
        mov edu, dx
        mov ah, 9 
        lea dx, CRLF
        int 21h
        lea dx, tb5
        int 21h
        mov ax,ekq
        call xuat
        mov ah,9
        lea dx, tb51
        int 21h
        mov ax,edu
        call xuat
        
        
        ; trong 8086 ko co thanh ghi 32bit
        ;xor ax,ax
        ;xor dx,dx
        ;mov eax,f1
        ;div f2
        ;mov fkq, ax
        ;mov fdu, dx
        mov ah,4ch
        int 21h
    main endp
    xuat proc
        mov bx,10  ; de xuat so ra man hinh thi ta tach ab=a*10+b de in tung ky tu. su dung thang ghi bx = 10 de chia lay hang don vi
        mov cx,0   ; dem so luong chu so de ty thuc hien vong lap.
        chia:
            mov dx,0   ; chuyen gia tri thanh ghi dx ve 0
            div bx     ; div goc. voi thanh ghi 8bit: al=ax/goc, ah=ax%goc. thang ghi 16bit: ax=dxax/goc, dx=dxax%goc
            inc cx     ; cx++
            push dx    ; day vao trong ngan xep
            cmp al,0   ; neu gia tri thuong cua phep chi bang 0 thi la da lay het cac chu so.
            je ht      ; nhay sang nhan ht
            jmp chia   ; nhay khong dieu kien den nhan chia
        ht:
            pop dx     ; lay gia tri dau ngan xep
            add dl,30h ; chuyen gia tri so thanh ky tu
            mov ah,2   ; ngat loai 2 de in ky tu ra man hinh
            int 21h
            loop ht    ; vong lap. qua moi vong lap thi cx tu dong tru di 1. cx=0 thi ket thuc vong lap
        ret    
    xuat endp
end