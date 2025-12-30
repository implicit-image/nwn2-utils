
#include "utils_vars"

//=========================================== Declarations ====================================================

string UXArrayAt(string sArr, int iIndex1, int iIndex2=-1, int iIndex3=-1, int iIndex4=-1, int iIndex5=-1);

string UXSetArrayIntAt(int iValue, string sArr, int iIndex1, int iIndex2=-1, int iIndex3=-1, int iIndex4=-1, int iIndex5=-1);

string UXSetArrayFloatAt(float fValue, string sArr, int iIndex1, int iIndex2=-1, int iIndex3=-1, int iIndex4=-1, int iIndex5=-1);

string UXSetArrayStringAt(string sValue, string sArr, int iIndex1, int iIndex2=-1, int iIndex3=-1, int iIndex4=-1, int iIndex5=-1);

string UXSetArrayObjectAt(object oValue, string sArr, int iIndex1, int iIndex2=-1, int iIndex3=-1, int iIndex4=-1, int iIndex5=-1);

string UXSetArrayLocationAt(location lValue, string sArr, int iIndex1, int iIndex2=-1, int iIndex3=-1, int iIndex4=-1, int iIndex5=-1);

void UXClearIntArray(string sArr, int iLength, object oTarget=OBJECT_SELF, int iStart=0);

void UXClearStringArray(string sArr, int iLength, object oTarget=OBJECT_SELF, int iStart=0);

void UXClearFloatArray(string sArr, int iLength, object oTarget=OBJECT_SELF, int iStart=0);

void UXClearObjectArray(string sArr, int iLength, object oTarget=OBJECT_SELF, int iStart=0);

void UXClearLocationArray(string sArr, int iLength, object oTarget=OBJECT_SELF, int iStart=0);

//================================ Implementation ======================================

// Get a variable name for an element of array sArr with indices iIndex(1-5)
// - sArr name of the array
// - iIndex(1-5) positions along dimensions of the array (5 dimensions supported)
// * Returns a variable name for the array element sArr[iIndex1][iIndex2][iIndex3][iIndex4][iIndex5]
string UXArrayAt(string sArr, int iIndex1, int iIndex2=-1, int iIndex3=-1, int iIndex4=-1, int iIndex5=-1)
{
    string sArrName = sArr + IntToString(iIndex1);
    if (iIndex2 > -1) sArrName += "_" + IntToString(iIndex2);
    if (iIndex3 > -1) sArrName += "_" + IntToString(iIndex3);
    if (iIndex4 > -1) sArrName += "_" + IntToString(iIndex4);
    if (iIndex5 > -1) sArrName += "_" + IntToString(iIndex5);

    return sArrName;
}

// Set int array element at specified indices
// - iValue value to set the element to
// - sArr name of the array
// - iIndex(1-5) positions along the dimensions of the array
// * Returns the name of modified element
string UXSetArrayIntAt(int iValue, string sArr, int iIndex1, int iIndex2=-1, int iIndex3=-1, int iIndex4=-1, int iIndex5=-1)
{
    string sArrElemVariable = UXArrayAt(sArr, iIndex1, iIndex2, iIndex3, iIndex4, iIndex5);
    SetLocalInt(OBJECT_SELF, sArrElemVariable, iValue);

    return sArrElemVariable;
}

// Set float array element at specified indices
// - fValue value to set the element to
// - sArr name of the array
// - iIndex(1-5) positions along the dimensions of the array
// * Returns the name of modified element
string UXSetArrayFloatAt(float fValue, string sArr, int iIndex1, int iIndex2=-1, int iIndex3=-1, int iIndex4=-1, int iIndex5=-1)
{
    string sArrElemVariable = UXArrayAt(sArr, iIndex1, iIndex2, iIndex3, iIndex4, iIndex5);

    SetLocalFloat(OBJECT_SELF, sArrElemVariable, fValue);

    return sArrElemVariable;
}

// Set string array element at specified indices
// - sValue value to set the element to
// - sArr name of the array
// - iIndex(1-5) positions along the dimensions of the array
// * Returns the name of modified element
string UXSetArrayStringAt(string sValue, string sArr, int iIndex1, int iIndex2=-1, int iIndex3=-1, int iIndex4=-1, int iIndex5=-1)
{
    string sArrElemVariable = UXArrayAt(sArr, iIndex1, iIndex2, iIndex3, iIndex4, iIndex5);

    SetLocalString(OBJECT_SELF, sArrElemVariable, sValue);

    return sArrElemVariable;
}

// Set object array element at specified indices
// - oValue value to set the element to
// - sArr name of the array
// - iIndex(1-5) positions along the dimensions of the array
// * Returns the name of modified element
string UXSetArrayObjectAt(object oValue, string sArr, int iIndex1, int iIndex2=-1, int iIndex3=-1, int iIndex4=-1, int iIndex5=-1)
{
    string sArrElemVariable = UXArrayAt(sArr, iIndex1, iIndex2, iIndex3, iIndex4, iIndex5);

    SetLocalObject(OBJECT_SELF, sArrElemVariable, oValue);

    return sArrElemVariable;
}

// Set location array element at specified indices
// - lValue value to set the element to
// - sArr name of the array
// - iIndex(1-5) positions along the dimensions of the array
// * Returns the name of modified element
string UXSetArrayLocationAt(location lValue, string sArr, int iIndex1, int iIndex2=-1, int iIndex3=-1, int iIndex4=-1, int iIndex5=-1)
{
    string sArrElemVariable = UXArrayAt(sArr, iIndex1, iIndex2, iIndex3, iIndex4, iIndex5);

    SetLocalLocation(OBJECT_SELF, sArrElemVariable, lValue);

    return sArrElemVariable;
}

// TODO: implement clearing array for all dimensions
// FIXME: atp only clears 1 dimension

// Delete all int elements of the sArr, starting at iStart index.
// - sArr the int array to clear
// - iLength the length to clear
// - iStart starting index
void UXClearIntArray(string sArr, int iLength, object oTarget=OBJECT_SELF, int iStart=0)
{
    while(iLength >= iStart)
    {
        DeleteLocalInt(oTarget, UXArrayAt(sArr, iStart));
        iStart++;
    }
}

// Delete all string elements of the sArr, starting at iStart index.
// - sArr the string array to clear
// - iLength the length to clear
// - iStart starting index
void UXClearStringArray(string sArr, int iLength, object oTarget=OBJECT_SELF, int iStart=0)
{
    while(iLength >= iStart)
    {
        DeleteLocalString(oTarget, UXArrayAt(sArr, iStart));
        iStart++;
    }
}

// Delete all float elements of the sArr, starting at iStart index.
// - sArr the float array to clear
// - iLength the length to clear
// - iStart starting index
void UXClearFloatArray(string sArr, int iLength, object oTarget=OBJECT_SELF, int iStart=0)
{
    while(iLength >= iStart)
    {
        DeleteLocalFloat(oTarget, UXArrayAt(sArr, iStart));
        iStart++;
    }
}

// Delete all object elements of the sArr, starting at iStart index.
// - sArr the object array to clear
// - iLength the length to clear
// - iStart starting index
void UXClearObjectArray(string sArr, int iLength, object oTarget=OBJECT_SELF, int iStart=0)
{
    while(iLength >= iStart)
    {
        DeleteLocalObject(oTarget, UXArrayAt(sArr, iStart));
        iStart++;
    }
}

// Delete all location elements of the sArr, starting at iStart index.
// - sArr the location array to clear
// - iLength the length to clear
// - iStart starting index
void UXClearLocationArray(string sArr, int iLength, object oTarget=OBJECT_SELF, int iStart=0)
{
    while(iLength >= iStart)
    {
        DeleteLocalLocation(oTarget, UXArrayAt(sArr, iStart));
        iStart++;
    }
}
