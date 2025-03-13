#include "utils_stringify"

const string MODULE_VAR_UTILS_LOG_LEVEL =  "UTILS_LOG_LEVEL";

const int LOG_LEVEL_QUIET = 0;
const int LOG_LEVEL_ERROR = 1;
const int LOG_LEVEL_WARNING = 2;
const int LOG_LEVEL_INFO = 3;

const int D3      = 3;
const int D4      = 5;
const int D6      = 7;
const int D8      = 11;
const int D10     = 13;
const int D12     = 17;
const int D20     = 19;
const int D100    = 23;
const int UTILS_DICE_INVALID = 0;


//============================================ Declarations ===================

void FloatingMessage(string message, string color="white");

void Log(string message, string color="white");

void Info(string message, string color="yellow", int iIgnoreLogLevel=FALSE);

void Error(string message, string color="red", int iIgnoreLogLevel=FALSE);

void Success(string message, string color="green", int iIgnoreLogLevel=FALSE);

void Warning(string message, string color="orange", int iIgnoreLogLevel=FALSE);

void SetLogLevel(int iLevel);

int GetLogLevel();

int Clamp(int iValue, int iLower=0, int iUpper=40) ;

int DiceRoll(int nDiceNum, int nDice);

string ArrayAt(string sArr, int iIndex1=-1, int iIndex2=-1, int iIndex3=-1, int iIndex4=-1, int iIndex5=-1);

void SetArrayIntAt(int iValue, string sArr, int iIndex1=-1, int iIndex2=-1, int iIndex3=-1, int iIndex4=-1, int iIndex5=-1);

void SetArrayFloatAt(float fValue, string sArr, int iIndex1=-1, int iIndex2=-1, int iIndex3=-1, int iIndex4=-1, int iIndex5=-1);

void SetArrayStringAt(string sValue, string sArr, int iIndex1=-1, int iIndex2=-1, int iIndex3=-1, int iIndex4=-1, int iIndex5=-1);

void SetArrayObjectAt(object oValue, string sArr, int iIndex1=-1, int iIndex2=-1, int iIndex3=-1, int iIndex4=-1, int iIndex5=-1);

void ClearIntArray(string sArr, int iLength, int iStart=0, int iNullVal=0);

void ClearStringArray(string sArr, int iLength, int iStart=0, string sNullVal="");

void ClearFloatArray(string sArr, int iLength, int iStart=0, float fNullVal=0.0f);

void ClearObjectArray(string sArr, int iLength, int iStart=0, object oNullVal=OBJECT_INVALID);

//================================================= Implementation ===================


void FloatingMessage(string message, string color="white")
{
    FloatingTextStringOnCreature(message, OBJECT_SELF);
}


void Log(string message, string color="white")
{
    string RGBmsg = "<color=" + color + ">" + message + "</color>";
    SendMessageToPC(OBJECT_SELF, RGBmsg);
    SendMessageToAllDMs(RGBmsg);
    PrintString(message);
}


void Info(string message, string color="yellow", int iIgnoreLogLevel=FALSE)
{
    if (iIgnoreLogLevel)
    {
        Log(message, color);
    }
    else {
        if (GetLogLevel() > LOG_LEVEL_QUIET)
            Log(message, color);
    }
}

void Error(string message, string color="red", int iIgnoreLogLevel=FALSE)
{
    if (iIgnoreLogLevel)
    {
        Log(message, color);
    }
    else
    {
        if (GetLogLevel() > LOG_LEVEL_WARNING)
            Log(message, color);
    }
}

void Success(string message, string color="green", int iIgnoreLogLevel=FALSE)
{
    if (iIgnoreLogLevel)
    {
        Log(message, color);
    }
    else
    {
        if (GetLogLevel() > LOG_LEVEL_WARNING)
            Log(message, color);
    }
}

void Warning(string message, string color="orange", int iIgnoreLogLevel=FALSE)
{
    if (iIgnoreLogLevel)
    {
        Log(message, color);
    }
    else
    {
        if (GetLogLevel() > LOG_LEVEL_INFO)
            Log(message, color);
    }
}

void SetLogLevel(int iLevel)
{
    iLevel = Clamp(iLevel, LOG_LEVEL_QUIET, LOG_LEVEL_INFO);
    SetLocalInt(GetModule(), MODULE_VAR_UTILS_LOG_LEVEL, iLevel);
}

int GetLogLevel()
{
    return GetLocalInt(GetModule(), MODULE_VAR_UTILS_LOG_LEVEL);
}

int Clamp(int iValue, int iLower=0, int iUpper=40) {
    if (iValue > iUpper) return iUpper;
    if (iValue < iLower) return iLower;
    return iValue;
}


// rolls nDiceNum dice
// for dice use D* constants
// returns PS_DICE_INVALID if invalid D* constant has been passed
int DiceRoll(int nDiceNum, int nDice)
{
    if (nDiceNum < 1)
        nDiceNum = 1;

    switch (nDice)
    {
        case D3: return d3(nDiceNum);
        case D4: return d4(nDiceNum);
        case D6: return d6(nDiceNum);
        case D8: return d8(nDiceNum);
        case D10: return d10(nDiceNum);
        case D12: return d12(nDiceNum);
        case D20: return d20(nDiceNum);
        case D100: return d100(nDiceNum);
    }
    return UTILS_DICE_INVALID;
}

string ArrayAt(string sArr, int iIndex1=-1, int iIndex2=-1, int iIndex3=-1, int iIndex4=-1, int iIndex5=-1)
{
    string sArrName = sArr;
    if (iIndex1 != -1) sArrName += "_" + IntToString(iIndex1);
    if (iIndex2 != -1) sArrName += "_" + IntToString(iIndex2);
    if (iIndex3 != -1) sArrName += "_" + IntToString(iIndex3);
    if (iIndex4 != -1) sArrName += "_" + IntToString(iIndex4);
    if (iIndex5 != -1) sArrName += "_" + IntToString(iIndex5);

    return sArrName;
}

void SetArrayIntAt(int iValue, string sArr, int iIndex1=-1, int iIndex2=-1, int iIndex3=-1, int iIndex4=-1, int iIndex5=-1)
{
    SetLocalInt(OBJECT_SELF, ArrayAt(sArr, iIndex1, iIndex2, iIndex3, iIndex4, iIndex5), iValue);
}

void SetArrayFloatAt(float fValue, string sArr, int iIndex1=-1, int iIndex2=-1, int iIndex3=-1, int iIndex4=-1, int iIndex5=-1)
{
    SetLocalFloat(OBJECT_SELF, ArrayAt(sArr, iIndex1, iIndex2, iIndex3, iIndex4, iIndex5), fValue);
}

void SetArrayStringAt(string sValue, string sArr, int iIndex1=-1, int iIndex2=-1, int iIndex3=-1, int iIndex4=-1, int iIndex5=-1)
{
    SetLocalString(OBJECT_SELF, ArrayAt(sArr, iIndex1, iIndex2, iIndex3, iIndex4, iIndex5), sValue);
}

void SetArrayObjectAt(object oValue, string sArr, int iIndex1=-1, int iIndex2=-1, int iIndex3=-1, int iIndex4=-1, int iIndex5=-1)
{
    SetLocalObject(OBJECT_SELF, ArrayAt(sArr, iIndex1, iIndex2, iIndex3, iIndex4, iIndex5), oValue);
}




void ClearIntArray(string sArr, int iLength, int iStart=0, int iNullVal=0)
{
    while(iLength >= iStart)
    {
        SetLocalInt(OBJECT_SELF, ArrayAt(sArr, iStart), iNullVal);
        iStart++;
    }
}

void ClearStringArray(string sArr, int iLength, int iStart=0, string sNullVal="")
{
    while(iLength >= iStart)
    {
        SetLocalString(OBJECT_SELF, ArrayAt(sArr, iStart), sNullVal);
        iStart++;
    }
}

void ClearFloatArray(string sArr, int iLength, int iStart=0, float fNullVal=0.0f)
{
    while(iLength >= iStart)
    {
        SetLocalFloat(OBJECT_SELF, ArrayAt(sArr, iStart), fNullVal);
        iStart++;
    }
}

void ClearObjectArray(string sArr, int iLength, int iStart=0, object oNullVal=OBJECT_INVALID)
{
    while(iLength >= iStart)
    {
        SetLocalObject(OBJECT_SELF, ArrayAt(sArr, iStart), oNullVal);
        iStart++;
    }
}
