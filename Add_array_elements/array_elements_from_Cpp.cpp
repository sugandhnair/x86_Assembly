
#include <iostream>
#include <stdlib.h>

extern "C"	int CalcArraySumASM(int* x, int n);

int CalcArraySumC(int* x, int n)
{
	int sum = 0;
	for (int i = 0; i < n; i++) {
		sum += x[i];
	}
	return sum;
}
int main()
{
	int n = 5;
	int* arr = (int*)malloc(sizeof(int) * n);
	
	for (int i = 0; i < n; i++) {
		arr[i] = i * 3;
	}

	int C_res = CalcArraySumC(arr, n);
	int ASM_res = CalcArraySumASM(arr, n);

	printf("Array elements are : \n");
	for (int i = 0; i < n; i++) {
		printf("%d\n",arr[i]);
	}

	printf("Sum using CPP function %d\n",C_res);
	printf("Sum using ASM function : %d\n",ASM_res);
	return 0;

}

