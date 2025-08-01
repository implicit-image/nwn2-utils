
const string UTILS_LAST_TIMESTAMP = "UTILS_LAST_TS";

struct TimeStamp
{
    int miliseconds;
    string variableId;
};

struct TimeStamp GetCurrentTimeStamp()
{
    int iCurHour = GetTimeHour() * 3600000;
    int iCurMinute = GetTimeMinute() * 60000;
    int iCurSecond = GetTimeSecond() * 1000;
    int iCurMilisecond = GetTimeMillisecond();

    struct TimeStamp timeStamp;

    int iMiliseconds = iCurHour + iCurMinute + iCurSecond + iCurMilisecond;

    timeStamp.miliseconds = iMiliseconds;
    timeStamp.variableId = "TIME_" + IntToString(miliseconds);

    return timeStamp;
}

// FIXME: possibly too many local variables allocated
void SetTimeStamp(object oTarget=OBJECT_SELF)
{
    struct TimeStamp timeStamp = GetCurrentTimeStamp();
    // remember last set timestamp variable for oTarget
    SetLocalString(oTarget, UTILS_LAST_TIMESTAMP, timeStamp.variableId);
    // save timestamp miliseconds
    SetLocalInt(oTarget, timeStamp.variableId, timeStamp.miliseconds);
}

string GetLastTimeStampVariable(oTarget=OBJECT_SELF)
{
    return GetLocalString(oTarget, UTILS_LAST_TIMESTAMP);
}

int GetLastTimeStampMiliseconds(oTarget=OBJECT_SELF)
{
    return GetLocalInt(oTarget, GetLastTimeStampVariable(oTarget));
}
