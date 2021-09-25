
#include <iostream>
#include <stdlib.h>

extern "C"	double mean_deviation(double *arr, int size,double *mean,double *std_dev);

int main()
{
	double  mean = 0,std_dev = 0;

	double arr[10] = {1.2,2.3,3.4,4.5,5.6,6.7,7.8,8.9,9.0,10.0};

	mean_deviation(arr,10,&mean,&std_dev);

	printf("Mean of the array is :%f .\nStandard Deviation of the array :%f\n",mean,std_dev);

	return 0;

}

