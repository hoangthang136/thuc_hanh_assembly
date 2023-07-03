dseg segment
oldfile db "d:\a.txt",0
newfile db "d:\tt_asm\solieu.txt",0
dseg ends
cseg segment
assume cs:cseg, ds:dseg, es: dseg
begin: mov ax, dseg
mov ds, ax
mov es, ax
mov ah,56h ; rename/remove tên file cu thanh moi
lea dx, oldfile
lea di, newfile
int 21h
mov ah, 4ch ; thoat ve Dos
int 21h
cseg ends
end begin     

                ; chuong trinh se doi ten va dich chuyen tep solieu.txt vao trong \baitap va doi ten thanh data.txt
                