
#include <iostream>
#include <stdlib.h>

extern "C" int calc_sum(int a, int b,int c, int* sum, int* square, int* cube);


int main()
{

	int a = 10;
	int b = 2;
	int c = 5;

	int sum, square, cube;

	calc_sum(a, b, c, &sum, &square, &cube);

	printf("The three numbers are : %d\t%d\t%d\n",a,b,c);
	printf("Sum : %d\tSquare : %d\tCube : %d\n",sum,square,cube);

	return 0;

}

