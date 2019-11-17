# 移位类指令
## 开环移位指令
* 算术左移:SAL    操作数，移位次数  
* 算术右移:SAR    操作数，移位次数  
* 逻辑左移:SHL    操作数，移位次数  
* 逻辑右移:SHR    操作数，移位次数 

|分类|名称|格式|功能|O S Z A P C|
|----|----|----|----|----|
|开环移位指令|逻辑左移指令|SHL OPRD,COUNT|逻辑左移（字、字节）|O S Z a P C|
|开环移位指令|算术左移指令|SAL OPRD,COUNT|算术左移（字、字节）|O S Z a P C|
|开环移位指令|逻辑右移指令|SHR OPRD,COUNT|逻辑右移（字、字节）|O S Z a P C|
|开环移位指令|算术右移指令|SAR OPRD,COUNT|算术右移（字、字节）|O S Z a P C|

注：大写表示受影响  
## 闭环移位指令
* 含进位的循环左移:RCL    操作数，移位次数  
* 含进位的循环右移:RCR    操作数，移位次数  
* 不含进位的循环左移:ROL    操作数，移位次数  
* 不含进位的循环右移:ROR    操作数，移位次数  

|分类|名称|格式|功能|O S Z A P C|
|----|----|----|----|----|
|闭环移位指令|不含进位循环左移指令|ROL OPRD,COUNT|循环左移（字、字节）|O s z a p C|
|闭环移位指令|不含进位循环右移指令|ROR OPRD,COUNT|循环右移（字、字节）|O s z a p C|
|闭环移位指令|带进位循环左移指令|RCL OPRD,COUNT|带进位循环左移（字、字节）|O s z a p C|
|闭环移位指令|带进位循环右移指令|RCR OPRD,COUNT|带进位循环右移（字、字节）|O s z a p C|

注：大写表示受影响  
## 区别  
![区别](https://github.com/fengjijiao/assembly-code/raw/master/basic/Shift-class-instruction/difference.png)
## 例子
例如：AL=1110,0010B;CF=0  
(a)  
SAL(SHL) AL,1  
结果：  
AL=1100,0100B  
CF=1  
(b)  
SHR AL,1  
结果：  
AL=0111,0001B  
CF=0  
(c)  
SAR AL,1  
结果：  
AL=1111,0001B  
CF=0  
(d)  
RCL AL,1  
结果：  
AL=1100,0100B  
CF=1  
(e)  
RCR AL,1  
结果：  
AL=0111,0001B  
CF=0  
(f)  
ROL AL,1  
结果：  
AL=1100,0101B  
CF=1  
(g)  
ROR AL,1  
结果：  
AL=0111,0001B  
CF=0  
