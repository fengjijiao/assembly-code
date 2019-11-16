# 通用传送类指令
## 1.数据传送指令
`MOV 目，源`  
注：不能向段寄存器中写入立即数,CS不能作为目标寄存器  
例子:  
设数据段为：  
```
BNUM DB 12H,34H,56H,78H,90H
WNUM DW 1122H,3344H,5566H
DNUM DD 13572468H,87654321H
FNUM DF 112233445566H
```
代码段：  
```
MOV AX,SEG  数据段名
MOV DS,AX;对DS进行初始化
;
MOV BL,BNUM;BL=12H
;
MOV BX,WNUM+2;BX=3344H
;
MOV EBX,DNUM+4;EBX=87654321H
;
MOV BL,BYTE PTR DNUM;BL=68H
;
MOV BX,WORD PTR BNUM+1;BX=5634H
;
MOV SI,OFFSET BNUM
MOV BX,[SI+1];BX=5634H
;
```
## 2.符号扩展/零扩展传送指令
```
MOVSX 目标寄存器,源操作数
MOVZX 目标寄存器,源操作数
```
注：  
源操作数不变；  
源操作数字长要小于或等于目标寄存器字长；  
MOVSX源操作数符号向高位扩展，再送给目标;  
MOVZX源操作数高位补零，再送给目标;  
例子：  
```
MOV DL,-16;DL=F0H
MOVSX BX,DL;BX=FFF0H,DL、DH不变
MOVZX BX,DL;BX=00F0H,DL、DH不变
```
## 3.有效地址传送指令
```
LEA 目标寄存器，源操作数
```
功能：计算内存单元的有效地址（不是其中的操作数）->目标  
注：  
有效地址就是偏移地址，LEA指令等效与OFFSET运算符   
LEA BX,BUF 等效于 MOV BX,OFFSET BUF  
例子：  
```
LEA BX,BUF;将BUF单元的有效地址->BX
LEA BX,[SI+5];将数据段SI+5变址的那个单元的有效地址->BX
```
## 4.交换传送指令
```
XCHG    第一操作数，第二操作数
```
功能：完成两个操作数的交换  
注：  
段寄存器、立即数不能参与交换  
2个内存操作数不能互换，源、目的类型一致  
例子：  
```
XCHG    AX,BX;交换AX与BX的内容
```
