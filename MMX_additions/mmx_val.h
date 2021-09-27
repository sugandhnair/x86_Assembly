#pragma once

//Signed Intergers
typedef	__int8	Int8;
typedef	__int16	Int16;
typedef	__int32	Int32;
typedef	__int64	Int64;

//Unsigned Intergers
typedef	unsigned __int8		UInt8;
typedef	unsigned __int16	UInt16;
typedef	unsigned __int32	UInt32;
typedef	unsigned __int64	UInt64;

union MmxVal
{
	Int8	i8[8];
	Int16	i16[4];
	Int32	i32[2];
	Int64	i64;

	UInt8	u8[8];
	UInt16	u16[4];
	UInt32	u32[2];
	UInt64	u64;

	char* ToString_i8(char* s, size_t len);
	char* ToString_i16(char* s, size_t len);
	char* ToString_i32(char* s, size_t len);
	char* ToString_i64(char* s, size_t len);

	char* ToString_u8(char* s, size_t len);
	char* ToString_u16(char* s, size_t len);
	char* ToString_u32(char* s, size_t len);
	char* ToString_u64(char* s, size_t len);

	char* ToString_x8(char* s, size_t len);
	char* ToString_x16(char* s, size_t len);
	char* ToString_x32(char* s, size_t len);
	char* ToString_x64(char* s, size_t len);
};


