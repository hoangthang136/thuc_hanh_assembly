.model small
.stack 100
.data
    tb1 db 'Nhap ky tu can chuyen: $'
    tb2 db 0Dh, 0Ah, 'Chuyen sang ky tu hoa: ' ; 0Dh, 0Ah la ma hex cua 13, 10(dec)
    char db ?,'$' ; 'khi su dung ngat 9 cho tb2 thi kho thay $ nen no chay xuong char in ra va gap dau $'
.code
    main proc
           ; khai bao db
        mov ax, @data
        mov ds, ax
           
        lea dx, tb1
        mov ah, 9
        int 21h
           
           ;chuyen chu nhap vao ban phim sang chu hoa
        mov ah, 1   ; ngat loai 1: doc ky tu tu ban phim va no luu ma ascii o AL 
        int 21h
        sub al, 20h ; trong bang ma ascii A la 65(he 10) va 41h(theo he hex), a la 97(he 10) va 61h (theo he hex). o day t su dung he hex de chuyen thuong thanh hoa chenh lech giua hoa va thuong la 20h (32 he 10)
        mov char, al ; sau khi chuyen thanh hoa gan gia tri vao bien
        
        lea dx, tb2
        mov ah, 9
        int 21h
            
           ; ngat chuong trinh
        mov ah, 4ch
        int 21h 
    main endp
end