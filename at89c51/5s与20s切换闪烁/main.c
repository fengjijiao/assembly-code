#include <reg51.h>
#define  uchar unsigned char
void delay()//1.0002437s
{
	uchar i,j,k,a;
	for(i=27;i>0;i--)//8*2
		for(j=255;j>0;j--)//8*2*250
			for(k=255;k>0;k--);//8*2*250*198
}
void delay2(unsigned int delay){
	unsigned int i;
	for(;delay>0;delay--){
		for(i=0;i<124;i++){;}
	}
}
void main()
{
	int t;
	while(1){
		//delay2(1000);
		P1=0xfb;
		//for(t=0;t<20;t++)//0.000394s
			delay();
		P1=0xfd;
		for(t=0;t<5;t++)
			delay();
		P1=0xfe;
		for(t=0;t<20;t++)
			delay();
		P1=0xfd;
		for(t=0;t<5;t++)
			delay();
	}
}
