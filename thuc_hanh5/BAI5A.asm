; file se duoc luu o o dia ao trong emu8086
; duong dan o dia ao: C:\EMU8086\vdrive
; muon luu vao trong mot folder nao do thi can vao o dia ao tao foder truoc

DSEG SEGMENT
    tenfile db "d:\data.txt",0      ; de biet chuoi la ten file thi phia cuoi phai co dau ,0
    thefile dw ?
DSEG ENDS
CSEG SEGMENT
ASSUME cs:cseg, ds:dseg
begin: mov ax, dseg
    mov ds, ax
    
    mov ah, 3ch ; tao tap tin moi
    lea dx, tenfile
    mov cx, 0 ; thuoc tinh tap tin. 0 la file binh thuong, 1 la file chi doc, 2 la file an
    int 21h
    
    ; khi tao file thi the file duoc luu vao thanh ghi ax, can co the file de co the dong file
    ;mov thefile, ax ; cat the file
    mov bx, ax
    mov ah, 3eh ; dong tap tin
    ;mov bx, thefile    ; the file bat buoc luu vao bx
    int 21h
    
    mov ah, 4ch ; thoat ve Dos
    int 21h
CSEG ENDS
END begin     


                    ; boi vi sau khi tao file thanh cong thi the file duoc luu o thanh ghi AX nen thefile phai dang DW 16 bit
                    ; boi vi khong can thiet vi khong hien gi ra man hinh
                    ; ta can cat the file de su dung cho viec dong file va doc file
                    ; neu chung ta khong can dong file thi ta van can cat the de su dung cho viec doc file va cac viec khac.
                    ; khong can thiet phai dong tap tin vi thoat ve dos da dong tep tin luon roi
                    ; co the bo bien thefile.truc tiep gan the ax cho bx  