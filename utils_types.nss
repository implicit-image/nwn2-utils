#include "utils_log"
#include "utils_const"

struct maybe_int
{
    int isValid;
    int value;
};

struct maybe_float
{
    int isValid;
    float value;
};

struct maybe_string
{
    int isValid;
    string value;
};

struct maybe_location
{
    int isValid;
    location value;
};

struct maybe_vector
{
    int isValid;
    vector value;
};

struct maybe_object
{
    int isValid;
    object value;
};

struct maybe_effect
{
    int isValid;
    effect value;
};

struct int_pair
{
    int _1;
    int _2;
};

struct float_pair
{
    float _1;
    float _2;
};

struct string_pair
{
    string _1;
    string _2;
};

struct location_pair
{
    location _1;
    location _2;
};

struct object_pair
{
    object _1;
    object _2;
};

struct local_string
{
    string sVar;
    string sValue;
    object oOwner;
};

struct local_int
{
    string sVar;
    int iValue;
    object oOwner;
};

struct local_float
{
    string sVar;
    float fValue;
    object oOwner;
};

struct local_object
{
    string sVar;
    object oValue;
    object oOwner;
};

struct local_location
{
    string sVar;
    location lValue;
    object oOwner;
};

void TypeError(int iPassedType, int iExpectedType1=0, int iExpectedType2=0, int iExpectedType3=0, int iExpectedType4=0, int iExpectedType5=0, int iExpectedType6=0);

string TypeName(int iType);

struct local_int LocalInt(string sVar, int iValue, object oOwner=OBJECT_SELF);

struct local_string LocalString(string sVar, string sValue, object oOwner=OBJECT_SELF);

struct local_float LocalFloat(string sVar, float fValue, object oOwner=OBJECT_SELF);

struct local_object LocalObject(string sVar, object oValue, object oOwner=OBJECT_SELF);

struct local_location LocalLocation(string sVar, location lValue, object oOwner=OBJECT_SELF);

struct int_pair IntPair(int i1, int i2);

struct float_pair FloatPair(float f1, float f2);

struct string_pair StringPair(string s1, string s2);

struct object_pair ObjectPair(object o1, object o2);

struct location_pair LocationPair(location l1, location l2);

int GetIsLocalStringValid(struct local_string String);

int GetIsLocalIntValid(struct local_int Int);

int GetIsLocalFloatValid(struct local_float Float);

int GetIsLocalObjectValid(struct local_object Object);

int GetIsLocalLocationValid(struct local_location Location);

//============================================== implementation =================================

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

    Log(sErrMsg, OBJECT_SELF, "red");
    Log(sExMsg, OBJECT_SELF, "red");
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

struct local_int LocalInt(string sVar, int iValue, object oOwner=OBJECT_SELF)
{
    struct local_int LocalInt;
    LocalInt.sVar = sVar;
    LocalInt.iValue = iValue;
    LocalInt.oOwner = oOwner;

    return LocalInt;
}

struct local_string LocalString(string sVar, string sValue, object oOwner=OBJECT_SELF)
{
    struct local_string LocalString;
    LocalString.sVar = sVar;
    LocalString.sValue = sValue;
    LocalString.oOwner = oOwner;

    return LocalString;
}

struct local_float LocalFloat(string sVar, float fValue, object oOwner=OBJECT_SELF)
{
    struct local_float LocalFloat;
    LocalFloat.sVar = sVar;
    LocalFloat.fValue = fValue;
    LocalFloat.oOwner = oOwner;

    return LocalFloat;
}

struct local_object LocalObject(string sVar, object oValue, object oOwner=OBJECT_SELF)
{
    struct local_object LocalObject;
    LocalObject.sVar = sVar;
    LocalObject.oValue = oValue;
    LocalObject.oOwner = oOwner;

    return LocalObject;
}

struct local_location LocalLocation(string sVar, location lValue, object oOwner=OBJECT_SELF)
{
    struct local_location LocalLocation;
    LocalLocation.sVar = sVar;
    LocalLocation.lValue = lValue;
    LocalLocation.oOwner = oOwner;

    return LocalLocation;
}

struct int_pair IntPair(int i1, int i2)
{
    struct int_pair Pair;
    Pair._1 = i1;
    Pair._2 = i2;

    return Pair;
}

struct float_pair FloatPair(float f1, float f2)
{
    struct float_pair Pair;
    Pair._1 = f1;
    Pair._2 = f2;

    return Pair;
}

struct string_pair StringPair(string s1, string s2)
{
    struct string_pair Pair;
    Pair._1 = s1;
    Pair._2 = s2;

    return Pair;
}

struct object_pair ObjectPair(object o1, object o2)
{
    struct object_pair Pair;
    Pair._1 = o1;
    Pair._2 = o2;

    return Pair;
}

struct location_pair LocationPair(location l1, location l2)
{
    struct location_pair Pair;
    Pair._1 = l1;
    Pair._2 = l2;

    return Pair;
}

int GetIsLocalStringValid(struct local_string String)
{
    return GetIsObjectValid(String.oOwner) && String.sVar != "";
}

int GetIsLocalIntValid(struct local_int Int)
{
    return GetIsObjectValid(Int.oOwner) && Int.sVar != "";
}

int GetIsLocalFloatValid(struct local_float Float)
{
    return GetIsObjectValid(Float.oOwner) && Float.sVar != "";
}

int GetIsLocalObjectValid(struct local_object Object)
{
    return GetIsObjectValid(Object.oOwner) && Object.sVar != "" && GetIsObjectValid(Object.oValue);
}

int GetIsLocalLocationValid(struct local_location Location)
{
    return GetIsObjectValid(Location.oOwner) && Location.sVar != "" && GetIsLocationValid(Location.lValue);
}


