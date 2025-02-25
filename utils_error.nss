

// ============================================= Constants ==========================
const string LOCAL_VAR_STDERR = "UTILS_STDERR";
const string LOCAL_VAR_STDERR_LAST_CALL_INFO = "UTILS_STDERR_INFO";
const string LOCAL_VAR_STDERR_LAST_CALLER = "UTILS_STDERR_CALLER";


//============================================== Declarations ============================

void SetSTDERR(string sCurrCaller, int iValue=1, object oOwner=OBJECT_SELF);

void ResetSTDERR(object oOwner=OBJECT_SELF);

int GetSTDERR(object oOwner=OBJECT_SELF);

//================================================= Implementation ===================

void SetSTDERR(string sCurrCaller, int iValue=1, object oOwner=OBJECT_SELF)
{
    location lCurrLoc = GetLocation(oOwner);
    string sCallInfo =  ObjectToString(oOwner) + ":" + sCurrCaller + ":" + LocationToString(lCurrLoc);
    SetLocalInt(oOwner, LOCAL_VAR_STDERR, 1);
    SetLocalString(oOwner, LOCAL_VAR_STDERR_LAST_CALLER, sCurrCaller);
    SetLocalString(oOwner, LOCAL_VAR_STDERR_LAST_CALL_INFO, sCallInfo);
}

void ResetSTDERR(object oOwner=OBJECT_SELF)
{
    SetLocalInt(oOwner, LOCAL_VAR_STDERR, 0);
    SetLocalString(oOwner, LOCAL_VAR_STDERR_LAST_CALL_INFO,"");
    SetLocalString(oOwner, LOCAL_VAR_STDERR_LAST_CALLER, "");
}

int GetSTDERR(object oOwner=OBJECT_SELF)
{
    return GetLocalInt(oOwner, LOCAL_VAR_STDERR);
}
