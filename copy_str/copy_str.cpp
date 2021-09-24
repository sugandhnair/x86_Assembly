
#include <iostream>
#include <stdlib.h>

extern "C"	int copy_str(const char*s1,char *s2,const int n);

int main()
{
	const char str1[] = "Hello sugandh";
	const int n = sizeof(str1)/sizeof(char);

	char str2[n];

	copy_str((const char*)str1,str2,n-1);

	str2[n - 1] = '\0';
	printf("String 2 after copying value of string 1 : %s\n",str2);

	return 0;

}

