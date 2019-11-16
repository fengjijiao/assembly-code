data segment data
    a db 0AH
    b db 01H
data ends
code segment code
    assume cs:csseg,ds:dsseg
start:
    mov ax,data
    mov ds,ax
    ;加法指令
    add ax,0h
    mov ax,00FFH
    add ax,0001H
    ;al=00h(不会加上cf的值)
    ;加法(带进位)指令
    ;add al,0H;使cf清零,即后续不加一
    mov al,0FFH
    adc al,01H
    ;al=01h（00h加cf进位标识值）
    ;减法指令
    mov al,a
    sub al,b
    ;乘法指令
    mov al,02H
    mov bl,02H
    mul bl
    ;除法指令
    mov al,a
    mov bl,b
    div bl
    ;mov al,01H;al=F1H
    ;符号扩展指令(8086不包括)
    ;movsx bx,al;bx=FFF1H
    ;
    ;零扩展指令(8086不包括)
    ;movzx bx,al;bx=00F1H
    ;
    ;获取变量/段的基地址
    mov dx,seg a
    ;
    ;有效地址传送指令
    ;取a的偏移地址(16位)到bx
    lea bx,b
    ;
    ;
    ;交换传送指令
    mov al,a;al=0AH
    mov ah,b;ah=01H
    xchg al,ah;ah=0AH,al=01H
    ;mov al,a
    ;div b;看ah的值，结果应为
code ends
end start
