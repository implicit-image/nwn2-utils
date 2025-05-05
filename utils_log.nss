#include "utils_math"



const string MODULE_VAR_UTILS_LOG_LEVEL =  "UTILS_LOG_LEVEL";
const string MODULE_VAR_UTILS_LOG_OBJECT = "UTILS_LOG_OBJECT";

const int LOG_LEVEL_QUIET = 0;
const int LOG_LEVEL_ERROR = 1;
const int LOG_LEVEL_WARNING = 2;
const int LOG_LEVEL_INFO = 3;

void FloatingMessage(string message, string color="white");

void SetLogObject(object oTarget);

void Log(string message, string color="white");

void Info(string message, string color="yellow", int iIgnoreLogLevel=FALSE);

void Error(string message, string color="red", int iIgnoreLogLevel=FALSE);

void Success(string message, string color="green", int iIgnoreLogLevel=FALSE);

void Warning(string message, string color="orange", int iIgnoreLogLevel=FALSE);

void SetLogLevel(int iLevel);

int GetLogLevel();

void PrintFunctionCall(string sFunctionName, string sMsg="", string sArg1="", string sArg2="", string sArg3="", string sArg4="", string sArg5="", string sArg6="", string sArg7="");


//============================= Implemntation =================================


void FloatingMessage(string message, string color="white")
{
    FloatingTextStringOnCreature(message, OBJECT_SELF);
}

void SetLogObject(object oTarget)
{
   SetLocalObject(GetModule(), MODULE_VAR_UTILS_LOG_OBJECT, oTarget);
}

void Log(string message, string color="white")
{
    string RGBmsg = "<color=" + color + ">" + message + "</color>";
    object oTarget = GetLocalObject(GetModule(), MODULE_VAR_UTILS_LOG_OBJECT);
    if (!GetIsObjectValid(oTarget))
    {
        oTarget = OBJECT_SELF;
    }
    SendMessageToPC(oTarget, RGBmsg);
    SendMessageToAllDMs(RGBmsg);
    PrintString(message);
    DeleteLocalObject(GetModule(), MODULE_VAR_UTILS_LOG_OBJECT);
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

void PrintFunctionCall(string sFunctionName, string sMsg="",  string sArg1="", string sArg2="", string sArg3="", string sArg4="", string sArg5="", string sArg6="", string sArg7="")
{
    int i = 1;
    string sArg = sArg1;
    Log("Calling " + sFunctionName);
    while (i < 8 && sArg != "")
    {
        if (sArg1 != "" && i == 1) sArg = sArg1;
        if (sArg2 != "" && i == 2) sArg = sArg2;
        if (sArg3 != "" && i == 3) sArg = sArg3;
        if (sArg4 != "" && i == 4) sArg = sArg4;
        if (sArg5 != "" && i == 5) sArg = sArg5;
        if (sArg6 != "" && i == 6) sArg = sArg6;
        if (sArg7 != "" && i == 7) sArg = sArg7;
        Log(IntToString(i) + ": " + sArg);
        i++;
    }
    if (sMsg != "")
    {
        Log(">>------------------");
        Log(sMsg);
        Log(">>------------------");
    }
}
