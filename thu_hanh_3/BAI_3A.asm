DSEG SEGMENT
    tbao1 DB "Ky tu HOA.$"
    tbao2 DB "Ky tu thuong.$"
DSEG ENDS
CSEG SEGMENT
ASSUME CS: CSEG, DS: DSEG
start:
    mov ax, DSEG
    mov ds, ax  

    mov ah, 01h 
    int 21h 

    cmp al,'Z'
    ja nhan
    jmp exit

    nhan: 
        mov ah, 09 
        lea dx, tbao2
        int 21h  
        Mov ah,4Ch
        Int 21h

    exit:
        mov ah, 9
        lea dx, tbao1
        int 21h
        mov ah, 4Ch 
        int 21h
CSEG ENDS
END start  

           ; can lenh JMP exit la de khi ky tu do la ky tu hoa thi in ra la 'ky tu hoa' va ket thuc chuong trinh
           ; neu khong co JMP exit thi luc nay chuong trinh se tiep tuc chay dong lenh 18 tro di va in 'ky tu thuong' cho du nhap vao ky tu hoa
           ; thay lenh JA NHAN bang lenh JNA NHAN thi luc nay chi can doi dong lenh 20 va dong lenh 17 cho nhau
           ; khong phai chu cai thi ket qua van ra 'Ky tu hoa' or 'Ky tu thuong' tuy thuoc vao no dung truoc hay dung sau ky tu 'Z' trong bang ma ascii
           ; tai vi dieu kien kitu <= 'Z' la chua du. can phai co so sanh 4 cai 'A'<=AL<=Z va 'a'<=al<='z'
           
