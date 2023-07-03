writeln macro bien1
    mov ah,09
    lea dx, bien1
    int 21h
    mov ah,02h
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
endm
dseg segment
    tbao db "Chuong tring so sanh oldpass va newpass$"
    oldpass dw "0123456789"
    newpass dw "1234567899"
    tbao1 db "Haichuoi giong nhau $"
    tbao2 db "Haichuoi khong giong nhau $"
dseg ends
cseg segment
assume cs:cseg, ds:dseg, es: dseg
begin: mov ax, dseg
    mov ds, ax
    mov es, ax
    
    writeln tbao
    cld ; chon chieu xu ly chuoi
    mov cx, 10 ; so ky tu/so byte can so sanh
    lea si, oldpass; (DS:SI)--> dia chi cua chuoi nguon
    lea di, newpass; (ES:DI)--> dia chi cua chuoi dich
    repne cmpsw ; so sanh tung ky tu/byte
    je intb1
    writeln tbao2
    jmp thoat
    intb1: writeln tbao1
    thoat:
    mov ah,08h
    int 21h
    mov ah, 4ch
    int 21h
cseg ends
end begin             

                 ; trong marco writeln dong lenh 5-9 la xuong dong
                 ; khai bao bien, nhan cuc bo de tranh gay ra loi khi goi macro nhieu lan 
                 ; dia chi cua DS va ES la giong nhau. duoc the hien qua dong lenh 21, 22. vi ds:si va es:di su dung cac bien trong data de so sanh chuoi.
                 ; repe la lap lai ca lenh da cho cho den khi cx=0
                 ; co the thay doi repe cmpsb thanh repne cmpsw. repne giong nhu repe, cmpsw giong nhu cmpsb nhu la 16bit con cmpsb la 8bit
                 
                 ; cld la xoa co DF trong thanh ghi EFlags.
                 ; cx la so byte can so sanh. 
                 ; si, di duoc gan dia chi nguon, dich
                 ; cmpsb se so sanh moi byte trong si voi mot byte trong di. bang cach tru byte trong di khoi byte trong si
                 ; luc nay gia tri co df se xac dinh sau moi lan tru di khoi si gia tri bang 0 thi tiep tuc tru byte ke tiep cho den khi cx = 0 (repe lap cho den cx = 0). bang 1 thi hai chuoi khong trung nhau
                 ; thay cmpsb thanh cmpsw thi can khai bao 2 bien chua chuoi so sanh thanh dw
                 ; jmp thoat co nhiem vu khi 2 chuoi khong bang nhau thi in ra tbao2 va nhay qua khong in ra tbao1. bo lenh jmp thi in ra ca 2 thong bao khi chuoi khong bang nhau
                 ; 
                 