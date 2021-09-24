
#include <iostream>
#include <stdlib.h>

extern "C"	int CalcRowColSumASM(const int* x, int rows, int cols, int* row_sums, int* col_sums);

int main()
{
	const int rows = 4;
	const int cols = 3;
	int x[rows][cols] = { {1,2,3},{4,5,6},{7,8,9},{10,11,12} };
	int y[rows][cols];

	int row_sums[rows], col_sums[cols];

	CalcRowColSumASM((const int*)x, rows, cols, row_sums, col_sums);

	printf("Matrix elements are : \n");
	for (int i = 0; i < rows; i++) {
		for(int j = 0; j < cols; j++){
			printf("%d\t",x[i][j]);
		}printf("\n");
	}

	printf("\nRow sums are :\n\n");
	for (int j = 0; j < rows; j++) {
		printf("Row %d : %d\n",j+1, row_sums[j]);
	}printf("\n");

	printf("\nCol sums are : \n");
	for (int j = 0; j < cols; j++) {
		printf("Col %d : %d\n", j+1,col_sums[j]);
	}printf("\n\n");

	return 0;

}

