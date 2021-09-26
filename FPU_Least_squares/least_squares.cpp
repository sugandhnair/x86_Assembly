
#include <iostream>
#include <stdlib.h>

extern "C" double LsEpsilon;
extern "C"	bool LeastSquaresASM(const double *x,const double *y,int n,double *m,double *b);
bool LeastSquaresCPP(const double* x, const double* y, int n, double* m, double* b);

int main()
{
	const int n = 6;
	const double	x[n] = { 0,2,4,6,8,10 };
	const double	y[n] = { 51.23,34.6,12.3,56.8,90.1,111.9};

	double m_asm = 0, m_cpp = 0;
	double b_asm = 0, b_cpp = 0;


	LeastSquaresASM(x, y, n, &m_asm, &b_asm);
	LeastSquaresCPP(x, y, n, &m_cpp, &b_cpp);

	printf("Using ASM function : B = %f and M = %f\n",b_asm,m_asm);
	printf("Using CPP function : B = %f and M = %f\n", b_cpp, m_cpp);

	return 0;

}

bool LeastSquaresCPP(const double* x, const double* y, int n, double* m, double* b)
{
	if(n <= 0) {
		return false;
	}
	double sum_x = 0, sum_y = 0, sum_xy = 0, sum_xx = 0;

	for (int i = 0; i < n; i++) {
		sum_x += x[i];
		sum_y += y[i];
		sum_xy += x[i] * y[i];
		sum_xx += x[i] * x[i];
	}

	double denom = n * sum_xx - sum_x * sum_x;

	if (LsEpsilon >= fabs(denom)) { return false; }

	*m = (n * sum_xy - sum_x * sum_y) / denom;
	*b = (sum_xx * sum_y - sum_x * sum_xy) / denom;

	return true;
}
