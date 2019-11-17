# 程序结构
## 1.完整的程序结构  
一个完整的汇编语言程序在结构上必须做到：  
* 用方式选择伪指令说明执行该程序的微处理器类型。
* 用段定义语句定义每一个逻辑段。
* 用ASSUME语句说明段约定。
* 用汇编结束语句说明程序结束。


## 2.完整段定义格式
```
.8086			;方式定义
DATA	SEGMENT USE16			;定义数据段
			...
DATA ENDS

CODE SEGMENT USE16			;定义代码段
	ASSUME CS:CODE,DS:DATA		;说明段约定
BEG:MOV AX,DATA
    MOV DS,AX
			...
    MOV AH,4CH
    INT 21H			;返回DOS
CODE ENDS
```
