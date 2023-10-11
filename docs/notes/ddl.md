```c++

enum DDLType : __int32
{
  DDL_INVALID_TYPE = 0xFFFFFFFF,
  DDL_BYTE_TYPE = 0x0,
  DDL_SHORT_TYPE = 0x1,
  DDL_UINT_TYPE = 0x2,
  DDL_INT_TYPE = 0x3,
  DDL_UINT64_TYPE = 0x4,
  DDL_FLOAT_TYPE = 0x5,
  DDL_FIXEDPOINT_TYPE = 0x6,
  DDL_STRING_TYPE = 0x7,
  DDL_STRUCT_TYPE = 0x8,
  DDL_ENUM_TYPE = 0x9,
  DDL_PAD_TYPE = 0xA,
};

// 00000000090F8740     ; DDLDef *s_gametypeSettingsDDL[4]

struct DDLRoot
{
  uint64_t name;
  uint64_t name_pad;
  DDLDef *ddlDef;
};


itemsize: 0x58

struct DDLEntry{



}

```