dseg segment
    string1 db "Chao em co gai Lam Hong"
    len dw $ - string1    ; lay do dai cua string1
    tenfile db "d:\data.txt",0
    thefile dw ?
dseg ends
cseg segment
assume cs:cseg, ds:dseg
begin: mov ax, dseg
    mov ds, ax
    mov ah, 3ch ; tao tap tin moi
    lea dx, tenfile
    mov cx, 0 ; tap tin co thuoc tinh binh thuong
    int 21h
    mov thefile, ax ; cat the file
    mov ah, 40h ; ghi file
    mov bx, thefile
    xor cx, cx
    mov cx, len
    lea dx, string1
    int 21h
    mov ah, 3eh ; dong tap tin
    mov bx, thefile
    int 21h
    mov ah, 4ch ; thoat ve Dos
    int 21h
cseg ends
end begin       


                ; giai thuat ghi:
                ;   gan the file vao thanh ghi bx
                ;   gan so byte can ghi vao thanh ghi cl
                ;   gan noi dung can ghi vao thanh ghi dx
                
                ; len db $ - string1 lay do dai cua string 1
                ; xor cx, cx la cong xo co nghi la cx cong chinh no va bang 0. co thay tay bang mov cx, 0
                ; dung mov cl, len vi len duoc khai bao la db, khi dung mov cx, len thi can phai khai bao len la dw. neu khong khai bao thi khong chay duoc chuong trinh 
                