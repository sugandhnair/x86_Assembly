
#include <iostream>
#include <stdlib.h>

extern "C" int SignedMax(int a, int b,int c);
extern "C" int SignedMin(int a, int b, int c);


int main()
{

	int a = 10;
	int b = 2;
	int c = 5;

	int max,min;

	max = SignedMax(a, b, c);
	min = SignedMin(a, b, c);
	printf("The three numbers are : %d\t%d\t%d\n",a,b,c);
	printf("MAX : %d\tMIN : %d\n",max,min);

	return 0;

}

