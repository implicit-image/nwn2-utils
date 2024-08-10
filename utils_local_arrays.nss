#include "utils_stringify"

const string ARRAY_META_PREFIX = "__META__";

// array meta information
const string ARRAY_META_LENGTH = "::LENGTH";
const string ARRAY_META_LAST_ACCESSED_INDEX = "::LAST_INDEX";
const string ARRAY_META_FILLED_CELLS = "::NON_EMPTY_CELLS";



//========================================================= Declarations =======================================

// Setters
void SetLocalArrayInt(object oOwner, string sVarName, int iVarIndex, int iValue);

void SetLocalArrayFloat(object oOwner, string sVarName, int iVarIndex, float fValue);

void SetLocalArrayObject(object oOwner, string sVarName, int iVarIndex, object oValue);

void SetLocalArrayLocation(object oOwner, string sVarName, int iVarIndex, location lValue);

void SetLocalArrayString(object oOwner, string sVarName, int iVarIndex, string sValue);

void SetLocalArrayItemProperty(object oOwner, string sVarName, int iVarIndex, itemproperty ipValue);

// Getters
int GetLocalArrayInt(object oOwner, string sVarName, int iVarIndex);

float GetLocalArrayFloat(object oOwner, string sVarName, int iVarIndex);

object GetLocalArrayObject(object oOwner, string sVarName, int iVarIndex);

location GetLocalArrayLocation(object oOwner, string sVarName, int iVarIndex);

string GetLocalArrayString(object oOwner, string sVarName, int iVarIndex);

itemproperty GetLocalArrayItemProperty(object oOwner, string sVarName, int iVarIndex);

// Bound arrays

void AllocateLocalBoundArray(string sArrayVar, int iLength);

// Meta information
void SetLocalArrayMetaInt(object oOwner, string sArray, string sMetaProp, int iValue);

void GetLocalArrayMetaInt(object oOwner, string sArray, string sMetaProp);

void SetLocalArrayLength(string sArray, int iValue, object oOwner=OBJECT_SELF);

int GetLocalArrayLength(string sArray, object oOwner=OBJECT_SELF);

void SetLocalArrayLastAccessed(string sArray, int iValue, object oOwner=OBJECT_SELF);

int GetLocalArrayLastAccessed(object oOwner, string sArray);

//=========================================================== Implementation =========================

void SetLocalArrayInt(object oOwner, string sVarName, int iVarIndex, int iValue)
{
    string sFullVarName = sVarName + IntToString(iVarIndex);
    SetLocalInt(oOwner, sFullVarName, iValue);
}

void SetLocalArrayFloat(object oOwner, string sVarName, int iVarIndex, float fValue)
{
    string sFullVarName = sVarName + IntToString(iVarIndex);
    SetLocalFloat(oOwner, sFullVarName, fValue);
}

void SetLocalArrayObject(object oOwner, string sVarName, int iVarIndex, object oValue)
{
    string sFullVarName = sVarName + IntToString(iVarIndex);
    SetLocalObject(oOwner, sFullVarName, oValue);
}

void SetLocalArrayLocation(object oOwner, string sVarName, int iVarIndex, location lValue)
{
    string sFullVarName = sVarName + IntToString(iVarIndex);
    SetLocalLocation(oOwner, sFullVarName, lValue);
}

void SetLocalArrayString(object oOwner, string sVarName, int iVarIndex, string sValue)
{
    string sFullVarName = sVarName + IntToString(iVarIndex);
    SetLocalString(oOwner, sFullVarName, sValue);
}

void SetLocalArrayItemProperty(object oOwner, string sVarName, int iVarIndex, itemproperty ipValue)
{
    string sFullVarName = sVarName + IntToString(iVarIndex);
    string sIPValue = ItemPropertyToString(ipValue);
    SetLocalString(oOwner, sFullVarName, sIPValue);
}

// returns 0 on error
int GetLocalArrayInt(object oOwner, string sVarName, int iVarIndex)
{
    string sFullVarName = sVarName + IntToString(iVarIndex);
    int iRes = GetLocalInt(oOwner, sFullVarName);
    if (iRes != 0)
        SetLocalArrayLastAccessed(sVarName, iVarIndex, oOwner);
    return iRes;
}

// returns 0.0f on error
float GetLocalArrayFloat(object oOwner, string sVarName, int iVarIndex)
{
    string sFullVarName = sVarName + IntToString(iVarIndex);
    float fRes = GetLocalFloat(oOwner, sFullVarName);
    if (fRes != 0.0f)
        SetLocalArrayLastAccessed(sVarName, iVarIndex, oOwner);
    return fRes;
}

// returns OBJECT_INVALID on error
object GetLocalArrayObject(object oOwner, string sVarName, int iVarIndex)
{
    string sFullVarName = sVarName + IntToString(iVarIndex);
    object oRes = GetLocalObject(oOwner, sFullVarName);
    if (oRes != OBJECT_NVALID)
        SetLocalArrayLastAccessed(sVarName, iVarIndex, oOwner);
    return oRes;
}


location GetLocalArrayLocation(object oOwner, string sVarName, int iVarIndex)
{
    string sFullVarName = sVarName + IntToString(iVarIndex);
    location lRes = GetLocalLocation(oOwner, sFullVarName);
    if (GetIsLocationValid(lRes))
        SetLocalArrayLastAccessed(sVarName, iVarIndex, oOwner);
    return lRes;
}

string GetLocalArrayString(object oOwner, string sVarName, int iVarIndex)
{
    string sFullVarName = sVarName + IntToString(iVarIndex);
    string sRes = GetLocalString(oOwner, sFullVarName);
    if (sRes == "")
        SetLocalArrayLastAccessed(sVarName, iVarIndex, oOwner);
    return sRes;
}

itemproperty GetLocalArrayItemProperty(object oOwner, string sVarName, int iVarIndex)
{
    string sFullVarName = sVarName + IntToString(iVarIndex);
    string sIPStrRepr = GetLocalString(oOwner, sFullVarName);
    if (sRes == "")
        SetLocalArrayLastAccessed(sVarName, iVarIndex, oOwner);
    itemproperty ipRes = ItemPropertyFromString(sIPStrRepr);
    return ipRes;
}


// BOUND ARRAYS

string AllocateLocalBoundIntArray(string sArrayVar, int iLength, object oOwner=OBJECT_SELF)
{
    SetLocalArrayLength(sArrayVar, iLength, oOwner);
    for (int i = 0; i < iLength; i++)
    {
        SetLocalArrayInt(oOwner, sArrayVar, i, 0);
    }
    return sArrayVar + IntToString(0);
}









void SetLocalArrayMetaInt(object oOwner, string sArray, string sMetaProp, int iValue)
{
    SetLocalInt(oOwner, ARRAY_META_PREFIX + sArray + sMetaProp, iValue);
}

void GetLocalArrayMetaInt(object oOwner, string sArray, string sMetaProp)
{
    return GetLocalInt(oOwner, ARRAY_META_PREFIX + sArray + sMetaProp);
}

void SetLocalArrayLength(string sArray, int iValue, object oOwner=OBJECT_SELF)
{
    SetLocalArrayMetaInt(oOwner, sArray, ARRAY_META_LENGTH, iValue)
}

int GetLocalArrayLength(string sArray, object oOwner=OBJECT_SELF)
{
    return GetLocalArrayMetaInt(oOwner, sArray, ARRAY_META_LENGTH);
}

void SetLocalArrayLastAccessed(string sArray, int iValue, object oOwner=OBJECT_SELF)
{
    SetLocalInt(oOwner, ARRAY_META_PREFIX + sArray + ARRAY_META_LAST_ACCESSED_INDEX, iValue);
}

int GetLocalArrayLastAccessed(object oOwner, string sArray)
{
    return GetLocalInt(oOwner, ARRAY_META_PREFIX + sArray + ARRAY_META_LAST_ACCESSED_INDEX);
}

int GetLocalArrayNonEmptyCellCount(string sArray, obhject oOwner=OBJECT_SELF)
{
    GetLocalInt(oOwner, ARRAY_META)
}
