.model small ;kich thuoc doan ma, small: ma lenh goi gon trong mot doan, du lieu nam trong 1 doan 
.stack 100 ; khai bao ngan xep. neu khong khai bao thi mac dinh la 1kb, thong thuong chi can dung 100-256byte
.data ;khai bao doan du lieu, tat ca cac bien, mang, xau deu khai bao o day
    tb1 DB 'Hello World! $' ; $ la dau ket thuc xau (bat buoc co trong chuoi). DB la kieu du lieu tuong ung voi 1 byte, DW la 2byte va DD la 4 byte
    CRLF DB 13,10,'$'
.code
MAIN proc ; bat dau thu tuc chinh
    ; khoi tao db:
    mov ax, @data
    mov ds, ax 
    ; 2 cau tren co tac dung nap cac bien da dc khai bao trong doan du lieu (.code) vao thanh ghi doan DS. vi ly do ky thuat, khong the gan truc tiep @data vao trong DS. vi vay can su dung thanh ghi da nang AX lam trung gian
    
    mov ah, 9 ; ngat loai 9: hien xau ky tu co ky tu $ o cuoi,Chuc nang: hien xau ky tu co dia chi lenh la gia tri cua DX va duoc thuc hien khi ah = 9
    lea dx, tb1 ; lea dung de gan dia chi lenh. o day gan dia chi lenh tb1 vao dx
    int 21h ; man hinh in ra xau tb1   
    
    lea dx, CRLF; gan dx bang dau/n
    int 21h ; xuong dong
    
    lea dx, tb1
    int 21h
    
    mov ah,4ch ; ngat (dung) chuong trinh thuc hien khi ah =4ch
    int 21h ; dung chuong trinh
MAIN ENDP  ;ket thuc thu tuc chinh
    ;cac chuong trinh con  (thu tuc khac nhu la ham con trong c)
end main ;ket thuc chuong trinh