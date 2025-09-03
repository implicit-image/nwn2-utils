
/*
Functions for manipulating local variables.
*/


const int VAR_OP_INCREMENT = 1;
const int VAR_OP_DECREMENT = 2;
const int VAR_OP_MULTIPLY = 3;
const int VAR_OP_DIVIDE = 4;
const int VAR_OP_APPEND = 5;
const int VAR_OP_PREPEND = 6;

int IncrementLocalInt(string sVar, int iIncrementBy=1, object oObject=OBJECT_SELF);

int DecrementLocalInt(string sVar, int iDecrementBy=1, object oObject=OBJECT_SELF);

int MultiplyLocalInt(string sVar, int iMultiplyBy, object oObject=OBJECT_SELF);

int DivideLocalInt(string sVar, int iDivideBy, object oObject=OBJECT_SELF);

int ModifyLocalInt(int iOp, string sVar, int iModifyBy, object oObject=OBJECT_SELF);

float IncrementLocalFloat(string sVar, float fIncrementBy=1.0, object oObject=OBJECT_SELF);

float DecrementLocalFloat(string sVar, float fDecrementBy=1.0, object oObject=OBJECT_SELF);

float MultiplyLocalFloat(string sVar, float fMultiplyBy, object oObject=OBJECT_SELF);

float DivideLocalFloat(string sVar, float fDivideBy, object oObject=OBJECT_SELF);

float ModifyLocalFloat(int iOp, string sVar, float fModifyBy, object oObject=OBJECT_SELF);

string AppendToLocalString(string sVar, string sSuffix, object oObject=OBJECT_SELF);

string PrependToLocalString(string sVar, string sPrefix, object oObject=OBJECT_SELF);

string ModifyLocalString(int iOp, string sVar, string sValue, object oObject=OBJECT_SELF);

int IsVarLengthOk(string sVar);

// ================= Implementation ==================================

int IncrementLocalInt(string sVar, int iIncrementBy=1, object oObject=OBJECT_SELF)
{
    return ModifyLocalInt(VAR_OP_INCREMENT, sVar, iIncrementBy, oObject);
}

int DecrementLocalInt(string sVar, int iDecrementBy=1, object oObject=OBJECT_SELF)
{
    return ModifyLocalInt(VAR_OP_DECREMENT, sVar, iDecrementBy, oObject);
}

int MultiplyLocalInt(string sVar, int iMultiplyBy, object oObject=OBJECT_SELF)
{
    return ModifyLocalInt(VAR_OP_MULTIPLY, sVar, iMultiplyBy, oObject);
}

int DivideLocalInt(string sVar, int iDivideBy, object oObject=OBJECT_SELF)
{
    return ModifyLocalInt(VAR_OP_DIVIDE, sVar, iDivideBy, oObject);
}

int ModifyLocalInt(int iOp, string sVar, int iModifyBy, object oObject=OBJECT_SELF)
{
    int iOldValue = GetLocalInt(oObject, sVar);
    int iNewValue = iOldValue;
    switch (iOp)
    {
        case VAR_OP_INCREMENT:
        {
            iNewValue = iOldValue + iModifyBy;
            break;
        }
        case VAR_OP_DECREMENT:
        {
            iNewValue = iOldValue - iModifyBy;
            break;
        }
        case VAR_OP_MULTIPLY:
        {
            iNewValue = iOldValue * iModifyBy;
            break;
        }
        case VAR_OP_DIVIDE:
        {
            iNewValue = iOldValue / iModifyBy;
            break;
        }
    }
    if (iNewValue != iOldValue)
    {
        SetLocalInt(oObject, sVar, iNewValue);
    }
    return iNewValue;
}

float IncrementLocalFloat(string sVar, float fIncrementBy=1.0, object oObject=OBJECT_SELF)
{
    return ModifyLocalFloat(VAR_OP_INCREMENT, sVar, fIncrementBy, oObject);
}

float DecrementLocalFloat(string sVar, float fDecrementBy=1.0, object oObject=OBJECT_SELF)
{
    return ModifyLocalFloat(VAR_OP_DECREMENT, sVar, fDecrementBy, oObject);
}

float MultiplyLocalFloat(string sVar, float fMultiplyBy, object oObject=OBJECT_SELF)
{
    return ModifyLocalFloat(VAR_OP_MULTIPLY, sVar, fMultiplyBy, oObject);
}

float DivideLocalFloat(string sVar, float fDivideBy, object oObject=OBJECT_SELF)
{
    return ModifyLocalFloat(VAR_OP_DIVIDE, sVar, fDivideBy, oObject);
}

float ModifyLocalFloat(int iOp, string sVar, float fModifyBy, object oObject=OBJECT_SELF)
{
    float fOldValue = GetLocalFloat(oObject, sVar);
    float fNewValue = fOldValue;
    switch (iOp)
    {
        case VAR_OP_INCREMENT:
        {
            fNewValue = fOldValue + fModifyBy;
            break;
        }
        case VAR_OP_DECREMENT:
        {
            fNewValue = fOldValue - fModifyBy;
            break;
        }
        case VAR_OP_MULTIPLY:
        {
            fNewValue = fOldValue * fModifyBy;
            break;
        }
        case VAR_OP_DIVIDE:
        {
            fNewValue = fOldValue / fModifyBy;
            break;
        }
    }

    if (fOldValue != fNewValue)
    {
        SetLocalFloat(oObject, sVar, fNewValue);
    }
    return fNewValue;
}

string AppendToLocalString(string sVar, string sSuffix, object oObject=OBJECT_SELF)
{
    return ModifyLocalString(VAR_OP_APPEND, sVar, sSuffix, oObject);
}

string PrependToLocalString(string sVar, string sPrefix, object oObject=OBJECT_SELF)
{
    return ModifyLocalString(VAR_OP_PREPEND, sVar, sPrefix, oObject);
}

string ModifyLocalString(int iOp, string sVar, string sValue, object oObject=OBJECT_SELF)
{
    string sOldValue = GetLocalString(oObject, sVar);
    string sNewValue = sOldValue;

    switch (iOp)
    {
        case VAR_OP_APPEND:
        {
            sNewValue = sOldValue + sValue;
            break;
        }
        case VAR_OP_PREPEND:
        {
            sNewValue = sValue + sOldValue;
            break;
        }
    }

    if (sOldValue != sNewValue)
    {
        SetLocalString(oObject, sVar, sNewValue);
    }
    return sNewValue;
}

int IsVarLengthOk(string sVar)
{
    return GetStringLength(sVar) <= 32;
}
