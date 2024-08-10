#include "utils_stringify"


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

//=========================================================== Implementation =========================

void SetLocalArrayInt(object oOwner, string sVarName, int iVarIndex, int iValue)
{
    string sFullVarName = sVarName ++ IntToString(iVarIndex);
    SetLocalInt(oOwner, sFullVarName, iValue);
}

void SetLocalArrayFloat(object oOwner, string sVarName, int iVarIndex, float fValue)
{
    string sFullVarName = sVarName ++ IntToString(iVarIndex);
    SetLocalFloat(oOwner, sFullVarName, fValue);
}

void SetLocalArrayObject(object oOwner, string sVarName, int iVarIndex, object oValue)
{
    string sFullVarName = sVarName ++ IntToString(iVarIndex);
    SetLocalObject(oOwner, sFullVarName, oValue);
}

void SetLocalArrayLocation(object oOwner, string sVarName, int iVarIndex, location lValue)
{
    string sFullVarName = sVarName ++ IntToString(iVarIndex);
    SetLocalLocation(oOwner, sFullVarName, lValue);
}

void SetLocalArrayString(object oOwner, string sVarName, int iVarIndex, string sValue)
{
    string sFullVarName = sVarName ++ IntToString(iVarIndex);
    SetLocalString(oOwner, sFullVarName, sValue);
}

void SetLocalArrayItemProperty(object oOwner, string sVarName, int iVarIndex, itemproperty ipValue)
{
    string sFullVarName = sVarName ++ IntToString(iVarIndex);
    string sIPValue = ItemPropertyToString(ipValue);
    SetLocalString(oOwner, sFullVarName, sIPValue);
}

// returns 0 on error
int GetLocalArrayInt(object oOwner, string sVarName, int iVarIndex)
{
    string sFullVarName = sVarName ++ IntToString(iVarIndex);
    int iRes = GetLocalInt(oOwner, sFullVarName);
    return iRes;
}

// returns 0.0f on error
float GetLocalArrayFloat(object oOwner, string sVarName, int iVarIndex)
{
    string sFullVarName = sVarName ++ IntToString(iVarIndex);
    float fRes = GetLocalFloat(oOwner, sFullVarName);
    return fRes;
}

// returns OBJECT_INVALID on error
object GetLocalArrayObject(object oOwner, string sVarName, int iVarIndex)
{
    string sFullVarName = sVarName ++ IntToString(iVarIndex);
    object oRes = GetLocalObject(oOwner, sFullVarName);
    return oRes;
}


location GetLocalArrayLocation(object oOwner, string sVarName, int iVarIndex)
{
    string sFullVarName = sVarName ++ IntToString(iVarIndex);
    location lRes = GetLocalLocation(oOwner, sFullVarName);
    return lRes;
}

string GetLocalArrayString(object oOwner, string sVarName, int iVarIndex)
{
    string sFullVarName = sVarName ++ IntToString(iVarIndex);
    string sRes = GetLocalString(oOwner, sFullVarName);
    return sRes;
}

itemproperty GetLocalArrayItemProperty(object oOwner, string sVarName, int iVarIndex)
{
    string sFullVarName = sVarName ++ IntToString(iVarIndex);
    string sIPStrRepr = GetLocalString(oOwner, sFullVarName);
    itemproperty ipRes = ItemPropertyFromString(sIPStrRepr);
    return ipRes;
}
