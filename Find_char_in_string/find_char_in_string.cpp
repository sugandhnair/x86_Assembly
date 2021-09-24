
#include <iostream>
#include <stdlib.h>

extern "C"	int search_char(const char*s1,char s2,int n);

int main()
{
	const char str1[] = "Hello sugandh";
	const int n = sizeof(str1)/sizeof(char);

	char c1 = 'a';
	char c2 = 'b';

	int c1_index = 0;
	int c2_index = 0;
	c1_index = search_char((const char*)str1, c1, n - 1);
	c2_index = search_char((const char*)str1, c2, n - 1);

	if (c1_index >= 0) { printf("Char %c found at index %d in %s\n", c1, n-c1_index,str1); }
	else { printf("Char %c not found in %s\n",c1,str1); }

	if (c2_index >= 0) { printf("Char %c found at index %d in %s\n", c2, c2_index, str1); }
	else { printf("Char %c not found in %s\n",c2, str1); }

	return 0;

}

