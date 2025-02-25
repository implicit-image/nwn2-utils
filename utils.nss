// FIXME: impement array ops
// #include "utils_array"
#include "utils_stringify"
// FIXME: implement error channels
// #include "utils_error"

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
