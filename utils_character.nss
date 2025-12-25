int GetSavingThrowValue(int iSave, object oPC);

string GetSavingThrowName(int iSave);

struct alignment_info GetAlignmentInfo(object oPC);

string GetAlignmentName(int iLC, int iGE);

//==================================== implementation ================================

struct alignment_info
{
    int iLC;
    int iGE;
    int iLCValue;
    int iGEValue;
};

string GetSavingThrowName(int iSave)
{
    switch(iSave)
    {
        case SAVING_THROW_FORT: return "Fortitude";
        case SAVING_THROW_REFLEX: return "Reflex";
        case SAVING_THROW_WILL: return "Will";
    }
    return "";
}

int GetSavingThrowValue(int iSave, object oPC)
{
    switch(iSave)
    {
        case SAVING_THROW_FORT: return GetFortitudeSavingThrow(oPC);
        case SAVING_THROW_WILL: return GetWillSavingThrow(oPC);
        case SAVING_THROW_REFLEX: return GetReflexSavingThrow(oPC);
    }
    return 0;
}

struct alignment_info GetAlignmentInfo(object oPC)
{
    struct alignment_info Alignment;
    Alignment.iLC = GetAlignmentLawChaos(oPC);
    Alignment.iGE = GetAlignmentGoodEvil(oPC);
    Alignment.iLCValue = GetLawChaosValue(oPC);
    Alignment.iGEValue = GetGoodEvilValue(oPC);

    return Alignment;
}

string GetAlignmentName(int iLC, int iGE)
{
    string sAlignment = "";
    switch (iLC)
    {
        case ALIGNMENT_CHAOTIC: { sAlignment = "Chaotic"; break; }
        case ALIGNMENT_NEUTRAL: { sAlignment = "Neutral"; break; }
        case ALIGNMENT_LAWFUL: { sAlignment = "Lawful"; break; }
    }

    switch (iGE)
    {
        case ALIGNMENT_EVIL: { sAlignment += " Evil"; break; }
        case ALIGNMENT_NEUTRAL:
        {
            sAlignment += " Neutral";
            if (iLC == ALIGNMENT_NEUTRAL)
            {
                sAlignment = "True Neutral";
            }
            break;
        }
        case ALIGNMENT_GOOD: { sAlignment += " Good"; break; }
    }
    return sAlignment;
}
