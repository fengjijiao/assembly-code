data segment data
    SCORE DB 10,99,66,67,68,80,50,33,90,99;这里仅列出10个
    OK  DB 0
data ends
code segment code
    START:
    mov ax,seg SCORE
    mov ds,ax
    mov bx,offset SCORE
    mov cx,10;与数据段成绩个数相对应
    mov dl,0
    LAST:
    cmp byte ptr [bx],60
    jc NO
    inc dl
    NO:
    inc bx
    loop LAST;dec cx;jnz LAST
    mov OK,dl
code ends
    end START
    
