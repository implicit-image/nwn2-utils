
const string UTILS_LAST_TIMESTAMP = "UTILS_LAST_TS";

struct TimeStamp
{
    int miliseconds;
    string variableId;
}

struct TimeStamp GetCurrentTimeStamp()
{
    int iCurHour = GetTimeHour() * 3600000;
    int iCurMinute = GetTimeMinute() * 60000;
    int iCurSecond = GetTimeSecond() * 1000;
    int iCurMilisecond = GetTimeMillisecond();

    struct TimeStampData TimeStamp;

    int iMiliseconds = iCurHour + iCurMinute + iCurSecond + iCurMilisecond;

    TimeStamp.miliseconds = iMiliseconds;
    TimeStamp.variableId = "TIME_" + IntToString(miliseconds);

    return TimeStamp;
}

// FIXME: possibly too many local variables allocated
void SetTimeStamp(object oTarget=OBJECT_SELF)
{
    struct TimeStamp TimeStamp = GetCurrentTimeStamp();
    // remember last set timestamp variable for oTarget
    SetLocalString(oTarget, UTILS_LAST_TIMESTAMP, TimeStamp.variableId);
    // save timestamp miliseconds
    SetLocalInt(oTarget, TimeStamp.variableId, TimeStamp.miliseconds);
}

string GetLastTimeStampVariable(oTarget=OBJECT_SELF)
{
    GetLocalString(oTarget, UTILS_LAST_TIMESTAMP);
}

int GetLastTimeStampMiliseconds(oTarget=OBJECT_SELF)
{
    GetLocalInt(oTarget, GetLastTimeStampVariable(oTarget));
}
