
#include <iostream>
#include <stdlib.h>
#include "mmx_val.h"


enum MmxAddOp : unsigned int
{
    paddb,
    paddsb,
    paddusb,
    paddw,
    paddsw,
    paddusw,
    paddd,
};

extern "C"  MmxVal  MmxAdd(MmxVal    a, MmxVal b, MmxAddOp op);

void MmxAddBytes(void);
void MmxAddWords(void);


int main()
{
   MmxAddBytes();
   MmxAddWords();
   return 0;
}

void MmxAddBytes(void)
{
    MmxVal a, b, c;
    char buff[256];

    a.i8[0] = 50;
    a.i8[1] = 80;
    a.i8[2] = -27;
    a.i8[3] = -70;
    a.i8[4] = -42;
    a.i8[5] = 60;
    a.i8[6] = 64;
    a.i8[7] = 100;
    a.i8[0] = 50;

    b.i8[0] = 30;
    b.i8[1] = 64;
    b.i8[2] = -32;
    b.i8[3] = -80;
    b.i8[4] = 90;
    b.i8[5] = -85;
    b.i8[6] = 90;
    b.i8[7] = -30;

    printf("\n\nPacked Byte addition - Signed intergers\n");
    printf("a: %s\n", a.ToString_i8(buff, sizeof(buff)));
    printf("a: %s\n", b.ToString_i8(buff, sizeof(buff)));

    c = MmxAdd(a, b, MmxAddOp::paddsb);

    printf("\n paddsb results :\n");
    printf("c : %s\n",c.ToString_i8(buff,sizeof(buff)));

    c = MmxAdd(a, b, MmxAddOp::paddb);

    printf("\n paddb wraparound results :\n");
    printf("c : %s\n", c.ToString_i8(buff, sizeof(buff)));


    a.u8[0] = 50;
    a.u8[1] = 80;
    a.u8[2] = 132;
    a.u8[3] = 200;
    a.u8[4] = 30;
    a.u8[5] = 60;
    a.u8[6] = 64;
    a.u8[7] = 130;
    a.u8[0] = 180;

    b.u8[0] = 42;
    b.u8[1] = 60;
    b.u8[2] = 140;
    b.u8[3] = 10;
    b.u8[4] = 90;
    b.u8[5] = 85;
    b.u8[6] = 160;
    b.u8[7] = 14;

    printf("\n\nPacked Byte addition - Unsigned intergers\n");
    printf("a: %s\n", a.ToString_i8(buff, sizeof(buff)));
    printf("a: %s\n", b.ToString_i8(buff, sizeof(buff)));

    c = MmxAdd(a, b, MmxAddOp::paddusb);

    printf("\n paddsub results :\n");
    printf("c : %s\n", c.ToString_i8(buff, sizeof(buff)));

    c = MmxAdd(a, b, MmxAddOp::paddb);

    printf("\n paddb results :\n");
    printf("c : %s\n", c.ToString_i8(buff, sizeof(buff)));
}

void MmxAddWords(void)
{
    MmxVal a, b, c;
    char buff[256];

    a.i16[0] = 500;
    a.i16[1] = 30000;
    a.i16[2] = -270;
    a.i16[3] = -7000;

    b.i16[0] = 830;
    b.i16[1] = 5000;
    b.i16[2] = -320;
    b.i16[3] = -32000;

    printf("\n\nPacked Word addition - Signed intergers\n");
    printf("a: %s\n", a.ToString_i16(buff, sizeof(buff)));
    printf("a: %s\n", b.ToString_i16(buff, sizeof(buff)));

    c = MmxAdd(a, b, MmxAddOp::paddsw);

    printf("\n paddsw results :\n");
    printf("c : %s\n", c.ToString_i16(buff, sizeof(buff)));

    c = MmxAdd(a, b, MmxAddOp::paddw);

    printf("\n paddw wraparound results :\n");
    printf("c : %s\n", c.ToString_i16(buff, sizeof(buff)));


    a.u16[0] = 500;
    a.u16[1] = 48000;
    a.u16[2] = 132;
    a.u16[3] = 10000;

    b.u16[0] = 30;
    b.u16[1] = 20000;
    b.u16[2] = 130;
    b.u16[3] = 60000;

    printf("\n\nPacked Byte addition - Unsigned intergers\n");
    printf("a: %s\n", a.ToString_i8(buff, sizeof(buff)));
    printf("a: %s\n", b.ToString_i8(buff, sizeof(buff)));

    c = MmxAdd(a, b, MmxAddOp::paddusw);

    printf("\n paddusw results :\n");
    printf("c : %s\n", c.ToString_i16(buff, sizeof(buff)));

    c = MmxAdd(a, b, MmxAddOp::paddw);

    printf("\n paddw results :\n");
    printf("c : %s\n", c.ToString_i16(buff, sizeof(buff)));
}
