.8086
data segment use16
    MESG DB 'I AM A STUDENT!','$'
data ends
code segment use16
    ASSUME CS:code,DS:data
    START:
    MOV AX,data
    MOV DS,AX
    MOV DX,offset MESG
    MOV AH,9
    INT 21H;显示在屏幕上
code ends
    end START
