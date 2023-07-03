write macro bien1
    mov ah, 09h
    lea dx, bien1
    int 21h
endm
dseg segment
    string1 db "NGAC NHIEN CHUA ?"
    tb1 db "co ky tu A trong chuoi string1 $"
    tb2 db "khong ky tu A trong chuoi string1 $"
dseg ends
assume cs:cseg, ds:dseg, es: dseg
begin: mov ax, dseg
    mov ds, ax
    mov es, ax
    cld ; chonchieu xu ly chuoi
    mov cx, 17 ; so ky tu can tim
    mov al, 'B' ; tim kien ky tu A trong string1
    lea di, string1 ; (ES:DI)--> dia chi cua chuoi dich
    repne scasb ; lap lai viec tim kiem ky tu cho den
    jne intb2 ; khi gap duoc hoac den het chuoi
    write tb1
    jmp thoat
    intb2: write tb2
    thoat: mov ah,08h ; dung man hinh de xem ket qua
    int 21h
    mov ah, 4ch ; thoat ve Dos
    int 21h
end begin    
cseg ends
             ; cld xoa co DF = 0
             ; cx, 17 la so ky tu can tim
             ; al, 'B' gan ky tu can tim cho al
             ; gan dia chi cua chuoi dich trong di
             ; repne scasb la lap qua tung ky tu de tim ky tu 'B'
             ; jne neu nhu khong tim thay thi nhay den nhan thoat  
               