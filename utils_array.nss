#include "utils_stringify"

const string ARRAY_META_PREFIX = "__META__";

// array meta information
const string ARRAY_META_LENGTH = "::LENGTH";
const string ARRAY_META_LAST_ACCESSED_INDEX = "::LAST_INDEX";
const string ARRAY_META_FILLED_CELLS = "::NON_EMPTY_CELLS";



//========================================================= Declarations =======================================

// Setters
void SetLocalArrayInt(string sVarName, int iVarIndex, int iValue, object oOwner=OBJECT_SELF);

void SetLocalArrayFloat(string sVarName, int iVarIndex, float fValue, object oOwner=OBJECT_SELF);

void SetLocalArrayObject(string sVarName, int iVarIndex, object oValue, object oOwner=OBJECT_SELF);

void SetLocalArrayLocation(string sVarName, int iVarIndex, location lValue, object oOwner=OBJECT_SELF);

void SetLocalArrayString(string sVarName, int iVarIndex, string sValue, object oOwner=OBJECT_SELF);

void SetLocalArrayItemProperty(string sVarName, int iVarIndex, itemproperty ipValue, object oOwner=OBJECT_SELF);

// Getters
int GetLocalArrayInt(string sVarName, int iVarIndex, object oOwner=OBJECT_SELF);

float GetLocalArrayFloat(string sVarName, int iVarIndex, object oOwner=OBJECT_SELF);

object GetLocalArrayObject(string sVarName, int iVarIndex, object oOwner=OBJECT_SELF);

location GetLocalArrayLocation(string sVarName, int iVarIndex, object oOwner=OBJECT_SELF);

string GetLocalArrayString(string sVarName, int iVarIndex, object oOwner=OBJECT_SELF);

itemproperty GetLocalArrayItemProperty(string sVarName, int iVarIndex, object oOwner=OBJECT_SELF);

// Bound arrays

void AllocateLocalBoundArray(string sArrayVar, int iLength, object oOwner=OBJECT_SELF);

// Meta information
void SetLocalArrayMetaInt(string sArray, string sMetaProp, int iValue, object oOwner=OBJECT_SELF);

int GetLocalArrayMetaInt(string sArray, string sMetaProp, object oOwner=OBJECT_SELF);

void SetLocalArrayLength(string sArray, int iValue, object oOwner=OBJECT_SELF);

int GetLocalArrayLength(string sArray, object oOwner=OBJECT_SELF);

void SetLocalArrayLastAccessed(string sArray, int iValue, object oOwner=OBJECT_SELF);

int GetLocalArrayLastAccessed(string sArray, object oOwner);

//=========================================================== Implementation =========================

void SetLocalArrayInt(string sVarName, int iVarIndex, int iValue, object oOwner=OBJECT_SELF)
{
    int iCurrLength;
    string sFullVarName = sVarName + IntToString(iVarIndex);
    int iWasEmpty = GetLocalInt(oOwner, sFullVarName);
    if (iWasEmpty)
    {
        if (iValue != 0)
        {
            // update array length
            int iOldLength = GetLocalArrayMetaInt(sVarName, ARRAY_META_LENGTH, oOwner);
            SetLocalArrayMetaInt(sVarName, ARRAY_META_LENGTH, iOldLength + 1, oOwner);
        }
    } else
    {
        if (iValue == 0 )
        {
            int iOldLength = GetLocalArrayMetaInt(sVarName, ARRAY_META_LENGTH, oOwner);
            SetLocalArrayMetaInt(sVarName, ARRAY_META_LENGTH, iOldLength - 1, oOwner);
        }
    }
    SetLocalInt(oOwner, sFullVarName, iValue);
}

void SetLocalArrayFloat(string sVarName, int iVarIndex, float fValue, object oOwner=OBJECT_SELF)
{
    string sFullVarName = sVarName + IntToString(iVarIndex);
    SetLocalFloat(oOwner, sFullVarName, fValue);
}

void SetLocalArrayObject(string sVarName, int iVarIndex, object oValue, object oOwner=OBJECT_SELF)
{
    string sFullVarName = sVarName + IntToString(iVarIndex);
    SetLocalObject(oOwner, sFullVarName, oValue);
}

void SetLocalArrayLocation(string sVarName, int iVarIndex, location lValue, object oOwner=OBJECT_SELF)
{
    string sFullVarName = sVarName + IntToString(iVarIndex);
    SetLocalLocation(oOwner, sFullVarName, lValue);
}

void SetLocalArrayString(string sVarName, int iVarIndex, string sValue, object oOwner=OBJECT_SELF)
{
    string sFullVarName = sVarName + IntToString(iVarIndex);
    SetLocalString(oOwner, sFullVarName, sValue);
}

void SetLocalArrayItemProperty(string sVarName, int iVarIndex, itemproperty ipValue, object oOwner=OBJECT_SELF)
{
    string sFullVarName = sVarName + IntToString(iVarIndex);
    string sIPValue = ItemPropertyToString(ipValue);
    SetLocalString(oOwner, sFullVarName, sIPValue);
}

// returns 0 on error
int GetLocalArrayInt(string sVarName, int iVarIndex, object oOwner=OBJECT_SELF)
{
    string sFullVarName = sVarName + IntToString(iVarIndex);
    int iRes = GetLocalInt(oOwner, sFullVarName);
    if (iRes != 0)
        SetLocalArrayLastAccessed(sVarName, iVarIndex, oOwner);
    return iRes;
}

// returns 0.0f on error
float GetLocalArrayFloat(string sVarName, int iVarIndex, object oOwner=OBJECT_SELF)
{
    string sFullVarName = sVarName + IntToString(iVarIndex);
    float fRes = GetLocalFloat(oOwner, sFullVarName);
    if (fRes != 0.0f)
        SetLocalArrayLastAccessed(sVarName, iVarIndex, oOwner);
    return fRes;
}

// returns OBJECT_INVALID on error
object GetLocalArrayObject(string sVarName, int iVarIndex, object oOwner=OBJECT_SELF)
{
    string sFullVarName = sVarName + IntToString(iVarIndex);
    object oRes = GetLocalObject(oOwner, sFullVarName);
    if (oRes != OBJECT_INVALID)
        SetLocalArrayLastAccessed(sVarName, iVarIndex, oOwner);
    return oRes;
}


location GetLocalArrayLocation(string sVarName, int iVarIndex, object oOwner=OBJECT_SELF)
{
    string sFullVarName = sVarName + IntToString(iVarIndex);
    location lRes = GetLocalLocation(oOwner, sFullVarName);
    if (GetIsLocationValid(lRes))
        SetLocalArrayLastAccessed(sVarName, iVarIndex, oOwner);
    return lRes;
}

string GetLocalArrayString(string sVarName, int iVarIndex, object oOwner=OBJECT_SELF)
{
    string sFullVarName = sVarName + IntToString(iVarIndex);
    string sRes = GetLocalString(oOwner, sFullVarName);
    if (sRes == "")
        SetLocalArrayLastAccessed(sVarName, iVarIndex, oOwner);
    return sRes;
}

itemproperty GetLocalArrayItemProperty(string sVarName, int iVarIndex, object oOwner=OBJECT_SELF)
{
    string sFullVarName = sVarName + IntToString(iVarIndex);
    string sIPStrRepr = GetLocalString(oOwner, sFullVarName);
    // if (sRes == "")
    //     SetLocalArrayLastAccessed(sVarName, iVarIndex, oOwner);
    itemproperty ipRes = ItemPropertyFromString(sIPStrRepr);
    return ipRes;
}


// BOUND ARRAYS

string AllocateLocalBoundIntArray(string sArrayVar, int iLength, object oOwner=OBJECT_SELF)
{
    SetLocalArrayLength(sArrayVar, iLength, oOwner);
    int i = 0;
    while (i < iLength)
    {
        SetLocalArrayInt(oOwner, sArrayVar, i, 0);
    }
    return sArrayVar + "0";
}



string GetVarFromArrayPos(string sArray, int iIndex, object oOwner=OBJECT_SELF)
{
    return sArray + IntToString(iIndex);
}





void SetLocalArrayMetaInt(string sArray, string sMetaProp, int iValue, object oOwner=OBJECT_SELF)
{
    SetLocalInt(oOwner, ARRAY_META_PREFIX + sArray + sMetaProp, iValue);
}

void GetLocalArrayMetaInt(string sArray, string sMetaProp, object oOwner=OBJECT_SELF)
{
    return GetLocalInt(oOwner, ARRAY_META_PREFIX + sArray + sMetaProp);
}

void SetLocalArrayLength(string sArray, int iValue, object oOwner=OBJECT_SELF)
{
    SetLocalArrayMetaInt(oOwner, sArray, ARRAY_META_LENGTH, iValue);
}

int GetLocalArrayLength(string sArray, object oOwner=OBJECT_SELF)
{
    return GetLocalArrayMetaInt(oOwner, sArray, ARRAY_META_LENGTH);
}

void SetLocalArrayLastAccessed(string sArray, int iValue, object oOwner=OBJECT_SELF)
{
    SetLocalInt(oOwner, ARRAY_META_PREFIX + sArray + ARRAY_META_LAST_ACCESSED_INDEX, iValue);
}

int GetLocalArrayLastAccessed(string sArray, object oOwner=OBJECT_SELF)
{
    return GetLocalInt(oOwner, ARRAY_META_PREFIX + sArray + ARRAY_META_LAST_ACCESSED_INDEX);
}

int GetLocalArrayNonEmptyCellCount(string sArray, object oOwner=OBJECT_SELF)
{
    GetLocalInt(oOwner, ARRAY_META);
}
