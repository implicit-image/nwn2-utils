#include "utils_log"

void TypeError(int iPassedType, int iExpectedType1=0, int iExpectedType2=0, int iExpectedType3=0, int iExpectedType4=0, int iExpectedType5=0, int iExpectedType6=0);

string TypeName(int iType);


const int TYPE_INVALID = -1;
const int TYPE_INT = 1;
const int TYPE_FLOAT = 2;
const int TYPE_STRING = 3;
const int TYPE_OBJECT = 4;
const int TYPE_LOCATION = 5;
const int TYPE_VECTOR = 6;

const string TYPE_NAME_INVALID = "<INVALID>";
const string TYPE_NAME_INT = "INT";
const string TYPE_NAME_FLOAT = "FLOAT";
const string TYPE_NAME_STRING = "STRING";
const string TYPE_NAME_OBJECT = "OBJECT";
const string TYPE_NAME_LOCATION = "LOCATION";
const string TYPE_NAME_VECTOR = "VECTOR";

// identities
const int INT_ADD_ID = 0;
const int INT_MULTIPLY_ID = 1;
const int INT_OR_ID = 0;
const float FLOAT_ADD_ID = 0.0f;
const float FLOAT_MULTIPLY_ID = 1.0f;
const string STRING_CONCAT_ID = "";

struct MaybeInt
{
    int isValid;
    int value;
};

struct MaybeFloat
{
    int isValid;
    float value;
};

struct MaybeString
{
    int isValid;
    string value;
};

struct MaybeLocation
{
    int isValid;
    location value;
};

struct MaybeVector
{
    int isValid;
    vector value;
};

struct MaybeObject
{
    int isValid;
    object value;
};

struct MaybeEffect
{
    int isValid;
    effect value;
};

struct PairInt
{
    int _1;
    int _2;
};

struct PairFloat
{
    float _1;
    float _2;
};

struct PairString
{
    string _1;
    string _2;
};

struct PairLocation
{
    location _1;
    location _2;
};

struct PairObject
{
    object _1;
    object _2;
};


struct LocalEffect
{
    string sRef;
};


struct EffectLink
{
    effect _1;
    effect _2;
    effect _3;
    effect _4;
    effect _5;
    effect _6;
    effect _7;
    effect _8;
    effect _9;
    effect _10;
};

void TypeError(int iPassedType, int iExpectedType1=0, int iExpectedType2=0, int iExpectedType3=0, int iExpectedType4=0, int iExpectedType5=0, int iExpectedType6=0)
{
    string sErrMsg = "Type Error: passed argument of type " + TypeName(iPassedType);
    string sExMsg = "Expected ";
    if (iExpectedType1 != 0) sExMsg = sExMsg + "or " + TypeName(iExpectedType1) + " ";
    if (iExpectedType2 != 0) sExMsg = sExMsg + "or " + TypeName(iExpectedType2) + " ";
    if (iExpectedType3 != 0) sExMsg = sExMsg + "or " + TypeName(iExpectedType3) + " ";
    if (iExpectedType4 != 0) sExMsg = sExMsg + "or " + TypeName(iExpectedType4) + " ";
    if (iExpectedType5 != 0) sExMsg = sExMsg + "or " + TypeName(iExpectedType5) + " ";
    if (iExpectedType6 != 0) sExMsg = sExMsg + "or " + TypeName(iExpectedType6) + " ";

    Log(sErrMsg, "red");
    Log(sExMsg, "red");
}

string TypeName(int iType)
{
    switch(iType)
    {
        case TYPE_INT:      return TYPE_NAME_INT;
        case TYPE_FLOAT:    return TYPE_NAME_FLOAT;
        case TYPE_STRING:   return TYPE_NAME_STRING;
        case TYPE_OBJECT:   return TYPE_NAME_OBJECT;
        case TYPE_LOCATION: return TYPE_NAME_OBJECT;
        case TYPE_VECTOR:   return TYPE_NAME_VECTOR;
        default:            return TYPE_NAME_INVALID;
    }
    return TYPE_NAME_INVALID;
}
