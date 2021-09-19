#include <iostream>
#include <stdlib.h>

extern "C" void Reverser(int* y, const int* x, int n);

int main()
{
    const int n = 10;
    int x[n], y[n];

    for (int i = 0; i < n; i++) {
        x[i] = i + 1;
    }

    Reverser(y,x,n);

    printf("Reversed array \n");

    for (int i = 0; i < n; i++) {
        printf("Index %d : X value : %d  Y value : %d\n",i,x[i],y[i]);
    }printf("\n");

    return 0;
}
