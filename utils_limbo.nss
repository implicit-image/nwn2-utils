
string UTILS_VAR_LIMBO_INDEX = "UX_LIMBO_INDEX";

object UXGetFirstCreatureInLimbo()
{
    SetLocalInt(OBJECT_SELF, UTILS_VAR_LIMBO_INDEX, 0);
    return GetCreatureInLimbo();
}

object UXGetNextCreatureInLimbo()
{
    object oCreature;
    int iIndex = GetLocalInt(OBJECT_SELF, UTILS_VAR_LIMBO_INDEX);
    int iCount = GetLimboCreatureCount();
    while (iIndex < iCount)
    {
        if (iCount == iIndex)
        {
            object oInvalid;
            DeleteLocalInt(OBJECT_SELF, UTILS_VAR_LIMBO_INDEX)
            return oInvalid; // return invalid object at the end
        }
        oCreature = GetCreatureInLimbo(iIndex);
        if (GetIsObjectValid(oCreature))
        {
            break;
        }
        iIndex++;
    }
    SetLocalInt(OBJECT_SELF, UTILS_VAR_LIMBO_INDEX, iIndex);
    return oCreature;
}

object UXGetCreatureFromLimboByTag(string sTag)
{
    int iIndex = 0;
    object oCreature = UXGetFirstCreatureInLimbo();
    while(GetIsObjectValid(oCreature))
    {
        if (GetTag(oCreature) == sTag)
        {
            return oCreature;
        }
        oCreature = UXGetNextCreatureInLimbo();
    }
    return oCreature;
}

object UXGetCreatureFromLimboById(string sId)
{
    int iIndex = 0;
    object oCreature = UXGetFirstCreatureInLimbo();
    while(GetIsObjectValid(oCreature))
    {
        if (ObjectToString(oCreature) == sId)
        {
            return oCreature;
        }
        oCreature = UXGetNextCreatureInLimbo();
    }
    return oCreature;
}

