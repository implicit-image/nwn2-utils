#include "utils_array"


//========================================== Declarations ===========================

string PushIntToStack(string sArrayName, int iValue, oOwner=OBJECT_SELF);

int PopIntFromStack(string sArrayName, oOwner=OBJECT_SELF);

string PushStringToStack(string sArrayName, string sValue, oOwner=OBJECT_SELF);

string PopStringFromStack(string sArrayName, oOwner=OBJECT_SELF);

string PushFloatToStack(string sArrayName, float fValue, oOwner=OBJECT_SELF);

float PopFloatFromStack(string sArrayName, oOwner=OBJECT_SELF);

string PushObjectToStack(string sArrayName, object oValue, oOwner=OBJECT_SELF);

object PopObjectFromStack(string sArrayName, oOwner=OBJECT_SELF);

string PushLocationToStack(string sArrayName, location lValue, oOwner=OBJECT_SELF);

location PopLocationFromStack(string sArrayName, oOwner=OBJECT_SELF);


//============================================== Implamentation ==========================


string PushIntToStack(string sArrayName, int iValue, oOwner=OBJECT_SELF)
{
    int iStackSize = GetLocalArrayLength(sArrayName, oOwner);
    string sFullVarName = sArrayName + IntToString(iStackSize);
    //Set stack value
    SetLocalInt(oOwner, sFullVarName, iValue);
    //Update stack size
    SetLocalInt(oOwner, SetLo)

    return sFullVarName;
}
