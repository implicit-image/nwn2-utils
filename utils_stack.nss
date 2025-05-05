#include "utils_array"


//========================================== Declarations ===========================

string PushIntToStack(string sArrayName, int iValue, object oOwner=OBJECT_SELF);

int PopIntFromStack(string sArrayName, object oOwner=OBJECT_SELF);

string PushStringToStack(string sArrayName, string sValue, object oOwner=OBJECT_SELF);

string PopStringFromStack(string sArrayName, object oOwner=OBJECT_SELF);

string PushFloatToStack(string sArrayName, float fValue, object oOwner=OBJECT_SELF);

float PopFloatFromStack(string sArrayName, object oOwner=OBJECT_SELF);

string PushObjectToStack(string sArrayName, object oValue, object oOwner=OBJECT_SELF);

object PopObjectFromStack(string sArrayName, object oOwner=OBJECT_SELF);

string PushLocationToStack(string sArrayName, location lValue, object oOwner=OBJECT_SELF);

location PopLocationFromStack(string sArrayName, object oOwner=OBJECT_SELF);


//============================================== Implamentation ==========================


string PushIntToStack(string sArrayName, int iValue, object oOwner=OBJECT_SELF)
{
    int iStackSize = GetLocalArrayLength(sArrayName, oOwner);
    string sFullVarName = sArrayName + IntToString(iStackSize);
    //Set stack value
    SetLocalInt(oOwner, sFullVarName, iValue);
    return sFullVarName;
}
