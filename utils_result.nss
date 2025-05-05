
const int RESULT_TYPE_NOTHING = -1;
const int RESULT_TYPE_INT = 1;
const int RESULT_TYPE_STRING = 2;
const int RESULT_TYPE_FLOAT = 3;
const int RESULT_TYPE_LOCATION = 4;
const int RESULT_TYPE_OBJECT = 5;
const int RESULT_TYPE_EFFECT = 6;
const int RESULT_TYPE_ITEMPROPERTY = 7;

struct Result
{
    int iType;
    int bIsNull;
    string String;
    int Int;
    float Float;
    location Location;
    object Object;
    effect Effect;
    itemproperty ItemProperty;
};
