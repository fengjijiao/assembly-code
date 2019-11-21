code segment use16
    START:
    MOV AH,1
    INT 21H;键入一个1位数，若键入3，则AL=33H
    SUB AL,30H;将ASCII转为数字，AL=3H
    MOV DL,AL;DL=3H
    MOV AH,1
    INT 21H;键入另一个1位数，若键入4，则AL=34H
    SUB AL,30H;AL=4H
    ADD DL,AL;DL=7H
    ADD DL,30H;DL=37H
    MOV AH,2
    INT 21H;显示在屏幕上
code ends
    end START
