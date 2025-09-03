#include "utils_math"



const string MODULE_VAR_UTILS_LOG_LEVEL =  "UTILS_LOG_LEVEL";
const string MODULE_VAR_UTILS_LOG_OBJECT = "UTILS_LOG_OBJECT";
const string MODULE_VAR_UTILS_LOG_PERSISTENT = "UTILS_LOG_PERS";

const int LOG_LEVEL_QUIET = 0;
const int LOG_LEVEL_ERROR = 1;
const int LOG_LEVEL_WARNING = 2;
const int LOG_LEVEL_INFO = 3;

void FloatingMessage(string message, string color="white");

void SetLogObject(object oTarget, int iPersistent=FALSE);

void ResetLogObject();

void Log(string message, object oTarget=OBJECT_SELF, string color="white");

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

void SetLogObject(object oTarget, int iPersistent=FALSE)
{
    object oMod = GetModule();
    SetLocalObject(oMod, MODULE_VAR_UTILS_LOG_OBJECT, oTarget);
    SetLocalInt(oMod, MODULE_VAR_UTILS_LOG_PERSISTENT, iPersistent);
}

void ResetLogObject()
{
    object oMod = GetModule();
    DeleteLocalObject(oMod, MODULE_VAR_UTILS_LOG_OBJECT);
    DeleteLocalInt(oMod, MODULE_VAR_UTILS_LOG_PERSISTENT);
}

void Log(string message, object oTarget=OBJECT_SELF, string color="white")
{
    string RGBmsg = "<color=" + color + ">" + message + "</color>";
    WriteTimestampedLogEntry(message);
    SendMessageToPC(oTarget, RGBmsg);
}


void Info(string message, string color="yellow", int iIgnoreLogLevel=FALSE)
{
    if (iIgnoreLogLevel || GetLogLevel() > LOG_LEVEL_INFO)
    {
        Log(message, OBJECT_SELF, color);
    }
}

void Error(string message, string color="red", int iIgnoreLogLevel=FALSE)
{
    if (iIgnoreLogLevel || GetLogLevel() > LOG_LEVEL_ERROR)
    {
        Log(message, OBJECT_SELF, color);
    }
}

void Success(string message, string color="green", int iIgnoreLogLevel=FALSE)
{
    if (iIgnoreLogLevel || GetLogLevel() > LOG_LEVEL_WARNING)
    {
        Log(message, OBJECT_SELF, color);
    }
}

void Warning(string message, string color="orange", int iIgnoreLogLevel=FALSE)
{
    if (iIgnoreLogLevel || GetLogLevel() > LOG_LEVEL_INFO)
    {
        Log(message, OBJECT_SELF, color);
    }
}

void SetLogLevel(int iLevel)
{
    iLevel = ClampInt(iLevel, LOG_LEVEL_QUIET, LOG_LEVEL_INFO);
    SetLocalInt(GetModule(), MODULE_VAR_UTILS_LOG_LEVEL, iLevel);
}

int GetLogLevel()
{
    return GetLocalInt(GetModule(), MODULE_VAR_UTILS_LOG_LEVEL);
}

void PrintFunctionCall(string sFunctionName, string sMsg="",  string sArg1="", string sArg2="", string sArg3="", string sArg4="", string sArg5="", string sArg6="", string sArg7="")
{
    // quiet it down if logging isn't loud
    if (GetLocalInt(GetModule(), MODULE_VAR_UTILS_LOG_LEVEL) > LOG_LEVEL_WARNING)
    {
        return;
    }


    Log("####################");

    int i = 1;
    string sArg = sArg1;
    if (sMsg != "")
    {
        Log(">>------------------");
        Log(sMsg);
        Log(">>------------------");
    }
    Log("Calling " + sFunctionName);
    while (i < 8 && sArg != "")
    {
        sArg = "";
        if (sArg1 != "" && sArg1 != "1" && i == 1) sArg = sArg1;
        if (sArg2 != "" && sArg2 != "1" && i == 2) sArg = sArg2;
        if (sArg3 != "" && sArg3 != "1" && i == 3) sArg = sArg3;
        if (sArg4 != "" && sArg4 != "1" && i == 4) sArg = sArg4;
        if (sArg5 != "" && sArg5 != "1" && i == 5) sArg = sArg5;
        if (sArg6 != "" && sArg6 != "1" && i == 6) sArg = sArg6;
        if (sArg7 != "" && sArg7 != "1" && i == 7) sArg = sArg7;

        if (sArg != "") Log(IntToString(i) + ": " + sArg);
        i++;
    }
    Log("#######################");
    Log("");
}
