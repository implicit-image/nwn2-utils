
struct alignment_info
{
    int iLC;
    int iGE;
    int iLCValue;
    int iGEValue;
};

int UXGetSavingThrowValue(int iSave, object oPC=OBJECT_SELF);

struct alignment_info UXGetAlignmentInfo(object oPC=OBJECT_SELF);

int UXGetIsAlignmentInfoValid(struct alignment_info A);
//==================================== implementation ================================

// Get value of saving throw iSave on oPC
// - iSave SAVING_THROW_* constant
// - oPC creature to get the saving throw of
// * returns the value of the specified saving throw or -1 if iSave is incorrect or oTarget is invalid.
int UXGetSavingThrowValue(int iSave, object oPC=OBJECT_SELF)
{
    if (!GetIsObjectValid(oPC)) return -1;
    switch(iSave)
    {
        case SAVING_THROW_FORT: return GetFortitudeSavingThrow(oPC);
        case SAVING_THROW_WILL: return GetWillSavingThrow(oPC);
        case SAVING_THROW_REFLEX: return GetReflexSavingThrow(oPC);
    }
    return -1;
}

// Get alignment info from oPC
// - oPC creature to take alignment info from
// * Returns alignment_info of oPC
struct alignment_info UXGetAlignmentInfo(object oPC=OBJECT_SELF)
{
    struct alignment_info Alignment;
    Alignment.iLC = GetAlignmentLawChaos(oPC);
    Alignment.iGE = GetAlignmentGoodEvil(oPC);
    Alignment.iLCValue = GetLawChaosValue(oPC);
    Alignment.iGEValue = GetGoodEvilValue(oPC);

    return Alignment;
}

// Check if alignment_info A is valid
// - A alignment_info to check
// * Returns TRUE if A is valid, FALSE otherwise.
int UXGetIsAlignmentInfoValid(struct alignment_info A)
{
    return A.iLC != -1 && A.iGE != -1 && A.iLCValue != -1 && A.iGEValue != -1;
}
