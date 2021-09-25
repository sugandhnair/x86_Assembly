
#include <iostream>
#include <stdlib.h>

extern "C"	double CtoF(double cel_temp);
extern "C"	double FtoC(double far_temp);

int main()
{
	double cel_temp = 35;
	double farhn_temp = 104;

	printf("Celcius value : %f		Farheneit	value : %f\n",cel_temp,CtoF(cel_temp));
	printf("Farheneit value : %f		Celcius	value : %f\n", farhn_temp, FtoC(farhn_temp));

	return 0;

}

