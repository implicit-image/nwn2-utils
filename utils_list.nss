#include "utils_vars"
#include "x0_i0_stringlib"

/*
Functions for manipulating local string lists.
*/

const string STRING_LIST_DEFAULT_DELIMITER = ",";

string AppendToLocalStringList(string sVar, string sElem, string sDelimiter=STRING_LIST_DEFAULT_DELIMITER, object
oObject=OBJECT_SELF);

string PrependToLocalStringList(string sVar, string sElem, string sDelimiter=STRING_LIST_DEFAULT_DELIMITER, object oObject=OBJECT_SELF);

int IsInLocalStringList(string sVar, string sElem, string sDelimiter=STRING_LIST_DEFAULT_DELIMITER, object oObject=OBJECT_SELF);

string DeleteFromLocalStringList(string sVar, string sElem, string sDelimiter=STRING_LIST_DEFAULT_DELIMITER, int iDeleteAll=TRUE, object oObject=OBJECT_SELF);

string AdjustStringListElem(string sElem, string sList, string sDelimiter=STRING_LIST_DEFAULT_DELIMITER);

//================== Implementation ===========================
string AppendToLocalStringList(string sVar, string sElem, string sDelimiter=STRING_LIST_DEFAULT_DELIMITER, object
oObject=OBJECT_SELF)
{
    string sList = GetLocalString(oObject, sVar);
    sElem = AdjustStringListElem(sElem, sList, sDelimiter);
    return AppendToLocalString(sVar, sElem, oObject);
}

string PrependToLocalStringList(string sVar, string sElem, string sDelimiter=STRING_LIST_DEFAULT_DELIMITER, object oObject=OBJECT_SELF)
{
    string sList = GetLocalString(oObject, sVar);
    sElem = AdjustStringListElem(sElem, sList, sDelimiter);
    return PrependToLocalString(sVar, sElem, oObject);
}

int IsInLocalStringList(string sVar, string sElem, string sDelimiter=STRING_LIST_DEFAULT_DELIMITER, object oObject=OBJECT_SELF)
{
    string sList = GetLocalString(oObject, sVar);
    if (sList == "") return FALSE;
    return GetIsInList(sList, sElem, sDelimiter);
}

string DeleteFromLocalStringList(string sVar, string sElem, string sDelimiter=STRING_LIST_DEFAULT_DELIMITER, int iDeleteAll=TRUE, object oObject=OBJECT_SELF)
{
    string sList = GetLocalString(oObject, sVar);
    string sNewList = "";
    string sCur;
    int iOneDeleted = FALSE;
    struct sStringTokenizer sTok = GetStringTokenizer(sList, sDelimiter);
    while (HasMoreTokens(sTok))
    {
        sTok = AdvanceToNextToken(sTok);
        sCur = GetNextToken(sTok);

        if (sCur == sElem)
        {
            if ((iDeleteAll || (!iDeleteAll && !iOneDeleted)))
            {
                if (!iDeleteAll && !iOneDeleted)
                {
                    iOneDeleted = TRUE;
                }
                continue;
            }
        }
        sCur = AdjustStringListElem(sCur, sNewList, sDelimiter);
        sNewList = sNewList + sCur;
    }

    if (sList != sNewList)
    {
        SetLocalString(oObject, sVar, sNewList);
    }

    return sNewList;
}

string AdjustStringListElem(string sElem, string sList, string sDelimiter=STRING_LIST_DEFAULT_DELIMITER)
{
    if (sList == "" || GetStringRight(sList, 1) == sDelimiter) return sElem;
    return sDelimiter + sElem;
}
