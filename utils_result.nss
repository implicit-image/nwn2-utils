

const int RESULT_TYPE_INT = 1;


struct Result
{
    int iType,
    int bIsNull,
    string sValue,
    int iValue,
    float fValue,
    location lValue,
    object oValue,
    effect eValue,
    itemproperty ipValue
}


struct Result MakeResult()
{
    struct Result stR;
    stR.iTypee = RESULT_TYPE_INT;
    stR.bIsNull = TRUE;
    stR.sValue = "this is a value";
    stR.iValue = 0;
    stR.fValue = 0.0;
    stR.lValue = Location(OBJECT_SELF, Vector(0.0, 0.0, 0.0), 0.0);
    stR.oValue = OBJECT_SELF;
    stR.eValue = EffectHaste();
    stR.ipValue = ItemPropertyHaste();
    return stR;
}

void main()
{
    struct Result r = MakeResult();
}
