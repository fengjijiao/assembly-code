# 汇编源程序的编程格式
## 1.汇编语言的两种编程格式
* EXE文件的编程格式：只能生成扩展为EXE的可执行文件。
* COM文件的编程根式：可以生成扩展为COM的可执行文件。
说明：COM文件的执行级别高于EXE文件，同名的BAT（批处理）文件执行级别最低。
## 2.EXE文件的编程格式
该格式允许源程序使用多个逻辑段（包括数据段、堆栈段、代码段及其他逻辑段）；  
在实模式下，每个逻辑段的目标块不超过64K；适合编写大型程序。  
### 例
功能描述：  
加法程序实现46H+52H，并将运算结果存放在数据段变量SUM中。  
源程序：  
```
.586
DATA  SEGMENT USE16
SUM DB ?;数据区
DATA  ENDS
CODE SEGMENT USE16
    ASSUME CS:CODE,DS:DATA
BEG:  MOV AX,DATA;设置DS初值
      MOV DS,AX
      
      MOV AL,46H;46H->AL
      ADD AL,52H;46H+52H->AL
      MOV SUM,AL;AL->SUM
      
      MOV AH,4CH
      INT 21H;返回DOS
CODE ENDS
  END BEG;汇编结束语句
```
## 3.COM文件的编程格式
源程序仅允许一个逻辑段，即代码段，不允许设置堆栈段。代码段目标块小于64K，适合编写中小型程序。  
程序所使用的数据，可以集中设置在代码段的开头或结尾处  
需要使用ORG定位伪指令将程序的启动指令存放在代码段偏移地址为100H的单元。  
### 定位伪指令ORG
格式：`ORG  表达式`  
功能：用于通知汇编程序将下一条指令或数据存放在表达式给出的段内起始偏移地址。  
例如：
```
DATA  SEGMENT USE16
      ORG 0017H
KEYFLAG DB  ?
DATA  ENDS
```
### 使用COM编程格式完成46H+52H
源程序：
```
.586
CODE  SEGMENT USE16
      ASSUME CS:CODE
      ORG 100H
BEG:  JMP START
      SUM DB  ?
START:  MOV AL,46H;46H->AL
      ADD AL,52H;46H+52H->AL
      MOV SUM,AL;AL->SUM
      MOV AH,4CH
      INT 21H;返回DOS
CODE ENDS
  END BEG   
```
