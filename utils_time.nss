#include "x0_i0_stringlib"
#include "utils_math"
#include "utils_const"


struct timestamp
{
    int miliseconds;
    int days;
};

struct timestamp UXGetCurrentTimestamp();

int UXGetIsTimestampFromPast(struct timestamp T);

int UXGetIsTimestampFromFuture(struct timestamp T);

int UXGetIsTimestampOlder(struct timestamp T1, struct timestamp T2);

int UXGetIsTimestampNewer(struct timestamp T1, struct timestamp T2);

int UXGetIsTimestampEqual(struct timestamp T1, struct timestamp T2);

int UXGetIsTimestampOlderThan(struct timestamp T, int iMS=6000);

struct timestamp UXStringToTimestamp(string sStrRep);

string UXTimestampToString(struct timestamp T);

int UXGetIsTimestampValid(struct timestamp T);

string UXSaveTimestamp(string sVarName, struct timestamp T, object oOwner=OBJECT_SELF);

//================================== implementation ======================================

// Get a timestamp representing current time.
// * Returns a timestamp representing current time. The timestamp may be invalid.
struct timestamp UXGetCurrentTimestamp()
{
    int iCurHour = GetTimeHour() * (1000 * 60 * 60);
    int iCurMinute = GetTimeMinute() * (1000 * 60);
    int iCurSecond = GetTimeSecond() * 1000;
    int iCurMilisecond = GetTimeMillisecond();

    int iCurrYear = GetCalendarYear() * 28 * 12;
    int iCurrMonth = GetCalendarMonth() * 28;
    int iCurrDay = GetCalendarDay();

    struct timestamp T;

    // make sure the amounts are in valid range
    int iMiliseconds = ClampInt(iCurHour + iCurMinute + iCurSecond + iCurMilisecond, 0, UTILS_TIMESTAMP_MAX_MILISECONDS);
    int iDays = ClampInt(iCurrDay + iCurrMonth + iCurrYear, 0, UTILS_TIMESTAMP_MAX_DAYS);

    T.miliseconds = iMiliseconds;
    T.days = iDays;

    return T;
}

// Check if timestamp T represents time in the past (is older tah current timestamp).
// - T timestamp to check
// * Returns TRUE if T represents time from the past, FALSE otherwise.
int UXGetIsTimestampFromPast(struct timestamp T)
{
    struct timestamp Now = UXGetCurrentTimestamp();
    return UXGetIsTimestampOlder(T, Now);
}

// Check if timestamp T represents time in the future (is younger than current timestamp).
// - T timestamp to check.
// * Returns TRUE if T represents time from the future, FALSE otherwise.
int UXGetIsTimestampFromFuture(struct timestamp T)
{
    struct timestamp Now = UXGetCurrentTimestamp();
    return UXGetIsTimestampOlder(Now, T);
}

// Check if T1 is newer than T2.
// - T1 timestamp
// - T2 other timestamp
// * Returns TRUE if T1 is newer than T2, FALSE otherwise.
int UXGetIsTimestampNewer(struct timestamp T1, struct timestamp T2)
{
    return (T1.days == T2.days) ? (T1.miliseconds < T2.miliseconds) : (T1.days < T2.days);
}

// Check if T1 is older than T2
// - T1 timestamp
// - T2 other timestamp
// * Returns TRUE if T1 is older than T2, FALSE otherwise
int UXGetIsTimestampOlder(struct timestamp T1, struct timestamp T2)
{
    return (T1.days == T2.days) ? (T1.miliseconds > T2.miliseconds) : (T1.days > T2.days);
}

// Check if T1 and T2 are equal (represent the same time)
// - T1 timestamp 1
// - T2 other timestamp
// * Returns TRUE if T1 and T2 represent the same time, FALSE otherwise.
int UXGetIsTimestampEqual(struct timestamp T1, struct timestamp T2)
{
    return (T1.days == T2.days) && (T1.miliseconds == T2.miliseconds);
}

// Check if timestamp T is older than iMS miliseconds.
// - T timestamp to check
// - iMS number of miliseconds
// * Returns TRUE if T is older than iMs, FALSE if it is not, and -1 if the timestamp T is invalid.
int UXGetIsTimestampOlderThan(struct timestamp T, int iMS=6000)
{
    if (!UXGetIsTimestampValid(T)) return -1;

    if (T.miliseconds > iMS) return TRUE;

    if (T.miliseconds == iMS) return T.days > 0;

    if (T.miliseconds < iMS)
    {
        int iDiff = iMS - T.miliseconds;
        int iDays = iDiff / UTILS_TIMESTAMP_MAX_MILISECONDS;
        return T.days > iDays && T.miliseconds > (iMS - iDiff);
    }
    return FALSE;
}

// Convert string sStrRep to a timestamp.
// - sStrRep string representation of timestamp to be converted
// * Returns a timestamp (it may be invalid).
struct timestamp UXStringToTimestamp(string sStrRep)
{
    struct timestamp T;
    int sus = FALSE;
    if (GetNumberTokens(sStrRep, UTILS_TIMESTAMP_DELIM) < 2)
    {
        // sus timestamp
        sus = TRUE;
    }

    T.days = StringToInt(GetTokenByPosition(sStrRep, UTILS_TIMESTAMP_DELIM, 0));
    T.miliseconds = StringToInt(GetTokenByPosition(sStrRep, UTILS_TIMESTAMP_DELIM, 1));

    return T;
}

// Convert timestamp T to a string.
// - T timestamp to convert
// * returns empty string if T is not valid, string representation of T otherwise.
string UXTimestampToString(struct timestamp T)
{
    if (!UXGetIsTimestampValid(T)) return "";
    return IntToString(T.days) + UTILS_TIMESTAMP_DELIM + IntToString(T.miliseconds);
}

// Check if T is a valid timestamp
// - T timestamp to check
// * returns TRUE if T is valid, FALSE otherwise.
int UXGetIsTimestampValid(struct timestamp T)
{
    return T.days > 0 && T.days < UTILS_TIMESTAMP_MAX_DAYS && T.miliseconds >= 0 && T.miliseconds <= UTILS_TIMESTAMP_MAX_MILISECONDS;
}

// Set local variable /sVarName/ to a string representation of /T/.
// - sVarName name of local variable to use
// - T timestamp to save
// - oOwner Object to set the variable on
// * Returns the variable name if the oOwner and T are valid, empty string otherwise
string UXSaveTimestamp(string sVarName, struct timestamp T, object oOwner=OBJECT_SELF)
{
    if (!GetIsObjectValid(oOwner) || !UXGetIsTimestampValid(T)) return "";

    SetLocalString(oOwner, sVarName, UXTimestampToString(T));

    return sVarName;
}
