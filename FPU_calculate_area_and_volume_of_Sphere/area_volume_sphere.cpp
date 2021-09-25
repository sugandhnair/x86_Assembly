
#include <iostream>
#include <stdlib.h>

extern "C"	double calc_area(double radius);
extern "C"	double calc_volume(double radius);

int main()
{
	double radius = 5;
	double area = 0;
	double volume = 0;

	area = calc_area(radius);
	volume = calc_volume(radius);

	printf("Radius of the sphere is %f .\nArea of the sphere :%f .\nVolume of the sphere :%f\n",radius,area,volume);

	return 0;

}

