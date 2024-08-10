

// ============================================= Constants ==========================
const string LOCAL_VAR_STDERR = "UTIL_LOCAL_STDERR";


//============================================== Declarations ============================

void SetError(object oOwner=OBJECT_SELF);

void ResetError(object oOwner=OBJECT_SELF)

int GetError(object oOwner=OBJECT_SELF);

//================================================= Implementation ===================

void SetError(object oOwner=OBJECT_SELF)
{
    SetLocalInt(oOwner, LOCAL_VAR_STDERR, 1);
}

void ResetError(object oOwner=OBJECT_SELF)
{
    SetLocalInt(oOwner, LOCAL_VAR_STDERR, 0);
}

int GetError(object oOwner=OBJECT_SELF)
{
    return GetLocalInt(oOwner, LOCAL_VAR_STDERR);
}
