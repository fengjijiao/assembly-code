# DOS功能调用
DOS与BIOS一起完成数据输入和数据输出的基本操作  
DOS和BIOS均有若干个子功能可以被用户程序调用，称为”DOS调用“和“BIOS调用”。  
## DOS调用/BIOS调用模式
```
MOV AH,功能号
设置入口参数
INT n
分析出口参数
```
说明：  
* n值因子程序不同而可能不同，比如：ROM BIOS 有n=5`~1FH,DOS有n=20H,21H,23~`2AH,2EH,2FH,33H和67H等几种情况。有的n对应一个子程序，有的n对应多个子程序。
* 调用结束后一般都有出口参数，这些出口参数常放在寄存器中，通过出口参数可以知道功能调用的成功与否。
* 在DOS功能调用中，我们把通过INT 21H来实现的子程序调用称为“DOS系统功能调用”。

该过程可用以下流程图表示:  
```
+------------------------------------------------------+
                                                       |
                                                       |
<-------------------------------+                      |
                                |                      v
                                |           +----------+--------------+
                                |           |                         |
                                |           |    AH=？                 |
                                |           |                         |
                                |           |                         |
                                |           +----+---------------+----+
                                |                |               |
                                |                |               |
                                |                |=1             |=2
                                |                |               |
                                |                |               |
                                |                v               v
                                |    +-----------+----+     +----+------------+
                                |    |                |     |                 |
                                |    |     执行子程序1     |     |   执行子程序2        |
                                |    |                |     |                 |
                                |    +-------+--------+     +------+----------+
                                |            |                     |
                                |            |                     |
                                |            |                     |
                                |            |                     |
                                |            |                     |
                                |            |                     |
                                |            v                     v
                                |    +-------+---------------------+-------+
                                |    |                                     |
                                |    |                                     |
                                |    |              IRET                   |
                                |    |                                     |
                                |    +------------+------------------------+
                                |                 |
                                |                 |
                                |                 |
                                +-----------------+
```
## 功能号：01H，等待输入一个字符，有回显，响应Ctrl+C。
入口参数：无  
出口参数：AL=按键的ASCII码。若AL=0，则表示按键是功能键，光标键，需再次调用本功能，才能返回按键的扩展码。  
调用方式举例： 
```
MOV AH,1
INT 21
```
## 功能号：02H，显示一个字符，响应Ctrl+C。
入口参数：DL=待显示字符的ASCII码。  
出口参数：无。  
说明：本功能在屏幕的当前位置显示一个字符，光标右移一格，如果是在一行末尾显示字符，则光标返回下一行的开始位置。如果是在屏幕右下角显示字符，光标返回时屏幕要上滚一行。  
注意：该功能调用破坏AL寄存器内容。  
调用方式举例：  
```
MOV DL,'A'
MOV AH,2
INT 21
```
## 功能号：07H,等待键入一个字符，无回显，不响应Ctrl+C。
入口参数：无。  
出口参数：AL=按键的ASCII码，若AL=0，需再次调用该功能才能在AL中得到按键的扩展码。  
## 功能号：08H,等待键入一个字符，无回显，响应Ctrl+C。
入口参数：无。  
出口参数：AL=按键的ASCII码，若AL=0，需再次调用该功能才能在AL中得到按键的扩展码。  
## 功能号：09H,显示字符串，响应Ctrl+C。
入口参数：DS:DX=字符串首地址，字符串必须以'$'(即ASCII码24H)作为结束标志。  
出口参数：无。  
注意：9g功能破坏AL寄存器的内容。该项功能从屏幕当前位置开始，显示字符串，遇到结束标志'$'时停止，'$'本身不显示。  
## 功能号：0AH，等待键入一串字符送用户程序数据缓存区。
入口参数：DS：DX指向放键入字符的缓冲区。  
缓冲区定义形式规定为：  
```
+---------------------------+
|                           |
|  缓冲区能容纳的字符个数（最大个数）        |
|                           |
+----------------------------+
|                           |
| 实际接收的字符个数                 |
|                           |
+---------------------------+
++                          |
|                           |
|  接收的字符                    |
|                           |
+---------------------------+
|                           |
|     .                     |
|     .                     |
|     .                     |
|     .                     |
|     .                     |
|     .                     |
|                           |
|                           |
|                           |
|                           |
|                           |
+---------------------------+
```
注意：缓冲区定义的第二个字节由系统设置，其余由用户定义；输入的字节数少于定义的字节数，缓冲区其余字节补0；输入的字节数大于定义的字节数，后来输入的字节丢失且响铃警告。  
例如：  
```
数据段:BUF DB 100
          DB  ?
          DB  100 DUP(?)
代码段：MOV DX,OFFSET BUF
       MOV AH,0AH
       INT 21H
```
```
              +-----------------------+
              |                       | 程序员预设的可容纳的字符个数（包括回车）
       BUF    |       100             |
              +-----------------------+
              |                       | 0AH功能写入实际接收的字符个数（不包或回车）
       +1     |                       |
              +-----------------------+ +----+
              |                       |
       +2     |                       |   ^
              +-----------------------+   |
              |                       |   |
              |                       |   |
数据缓冲区         |                       |   |
              |                       |   |
              |                       |   |  键入字符串的实际存储区
              |                       |   |
              |                       |   |
              |                       |   |
              |                       |   |
              |                       |   |
              |                       |   |
              |                       |   |
              |                       |   |
              |                       |   |
              |                       |   |
              |                       |   |
              +-----------------------+   |
              |                       |   v
        +n    |                       |
              +-----------------------+ +----+
```
