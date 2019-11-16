data segment data
    NUM DB 01H,02H,03H,04H,05H
    POINTER  DW N2_10;汇编后存放N2_10的偏移地址
data ends
code segment code
    START:
    mov ax,seg NUM
    mov ds,ax
    mov bx,offset NUM
    mov cx,5;与数据段数字个数相对应
    LAST:
    mov dl,[bx]
    call N2_10;1.call POINTER;N2_10的偏移地址->ip
              ;2.mov si,POINTER
              ;call si;si->ip
    BREAK:
    inc bx
    loop LAST;dec cx;jnz LAST
    mov OK,dl
    ;子程序开始
    N2_10 proc
        ;将二进制转十进制
        ;待完善
        ret
    N2_10 endp
    ;子程序结束
code ends
    end START
    
