
#include "utils_vars"

//=========================================== Declarations ====================================================

string ArrayAt(string sArr, int iIndex1, int iIndex2=-1, int iIndex3=-1, int iIndex4=-1, int iIndex5=-1);

void SetArrayIntAt(int iValue, string sArr, int iIndex1, int iIndex2=-1, int iIndex3=-1, int iIndex4=-1, int iIndex5=-1);

void SetArrayFloatAt(float fValue, string sArr, int iIndex1, int iIndex2=-1, int iIndex3=-1, int iIndex4=-1, int iIndex5=-1);

void SetArrayStringAt(string sValue, string sArr, int iIndex1, int iIndex2=-1, int iIndex3=-1, int iIndex4=-1, int iIndex5=-1);

void SetArrayObjectAt(object oValue, string sArr, int iIndex1, int iIndex2=-1, int iIndex3=-1, int iIndex4=-1, int iIndex5=-1);

void ClearIntArray(string sArr, int iLength, int iStart=0);

void ClearStringArray(string sArr, int iLength, int iStart=0);

void ClearFloatArray(string sArr, int iLength, int iStart=0);

void ClearObjectArray(string sArr, int iLength, int iStart=0);

//================================ Implementation ======================================

string ArrayAt(string sArr, int iIndex1, int iIndex2=-1, int iIndex3=-1, int iIndex4=-1, int iIndex5=-1)
{
    string sArrName = sArr + IntToString(iIndex1);
    if (iIndex2 != -1) sArrName += "_" + IntToString(iIndex2);
    if (iIndex3 != -1) sArrName += "_" + IntToString(iIndex3);
    if (iIndex4 != -1) sArrName += "_" + IntToString(iIndex4);
    if (iIndex5 != -1) sArrName += "_" + IntToString(iIndex5);

    return sArrName;
}

void SetArrayIntAt(int iValue, string sArr, int iIndex1, int iIndex2=-1, int iIndex3=-1, int iIndex4=-1, int iIndex5=-1)
{
    SetLocalInt(OBJECT_SELF, ArrayAt(sArr, iIndex1, iIndex2, iIndex3, iIndex4, iIndex5), iValue);
}

void SetArrayFloatAt(float fValue, string sArr, int iIndex1, int iIndex2=-1, int iIndex3=-1, int iIndex4=-1, int iIndex5=-1)
{
    SetLocalFloat(OBJECT_SELF, ArrayAt(sArr, iIndex1, iIndex2, iIndex3, iIndex4, iIndex5), fValue);
}

void SetArrayStringAt(string sValue, string sArr, int iIndex1, int iIndex2=-1, int iIndex3=-1, int iIndex4=-1, int iIndex5=-1)
{
    SetLocalString(OBJECT_SELF, ArrayAt(sArr, iIndex1, iIndex2, iIndex3, iIndex4, iIndex5), sValue);
}

void SetArrayObjectAt(object oValue, string sArr, int iIndex1, int iIndex2=-1, int iIndex3=-1, int iIndex4=-1, int iIndex5=-1)
{
    SetLocalObject(OBJECT_SELF, ArrayAt(sArr, iIndex1, iIndex2, iIndex3, iIndex4, iIndex5), oValue);
}

void ClearIntArray(string sArr, int iLength, int iStart=0)
{
    while(iLength >= iStart)
    {
        DeleteLocalInt(OBJECT_SELF, ArrayAt(sArr, iStart));
        iStart++;
    }
}

void ClearStringArray(string sArr, int iLength, int iStart=0)
{
    while(iLength >= iStart)
    {
        DeleteLocalString(OBJECT_SELF, ArrayAt(sArr, iStart));
        iStart++;
    }
}

void ClearFloatArray(string sArr, int iLength, int iStart=0)
{
    while(iLength >= iStart)
    {
        DeleteLocalFloat(OBJECT_SELF, ArrayAt(sArr, iStart));
        iStart++;
    }
}

void ClearObjectArray(string sArr, int iLength, int iStart=0)
{
    while(iLength >= iStart)
    {
        DeleteLocalObject(OBJECT_SELF, ArrayAt(sArr, iStart));
        iStart++;
    }
}
