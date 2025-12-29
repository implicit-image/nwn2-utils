// utils_list.nss :: functions for manipulating local string lists.

#include "utils_vars"
#include "utils_const"
#include "x0_i0_stringlib"

string AppendToLocalStringList(string sVar, string sElem, object
oObject=OBJECT_SELF, string sDelimiter=STRING_LIST_DEFAULT_DELIMITER);

string PrependToLocalStringList(string sVar, string sElem, object oObject=OBJECT_SELF, string sDelimiter=STRING_LIST_DEFAULT_DELIMITER);

int IsInLocalStringList(string sVar, string sElem, object oObject=OBJECT_SELF, string sDelimiter=STRING_LIST_DEFAULT_DELIMITER);

string DeleteFromLocalStringList(string sVar, string sElem, object oObject=OBJECT_SELF, int iDeleteAll=TRUE, string sDelimiter=STRING_LIST_DEFAULT_DELIMITER);

string AdjustStringListElem(string sElem, string sList, string sDelimiter=STRING_LIST_DEFAULT_DELIMITER);

//================================= implementation ==================================

// Append sElem to sVar delimited by sDelimiter stored on oObject
// - sVar variable name storing a list
// - sElem element to append to the list
// - oObject object which stores the variable
// - sDelimiter delimiter for the list
// * Returns the new value of the list
string AppendToLocalStringList(string sVar, string sElem, object
oObject=OBJECT_SELF, string sDelimiter=STRING_LIST_DEFAULT_DELIMITER)
{
    string sList = GetLocalString(oObject, sVar);
    sElem = AdjustStringListElem(sElem, sList, sDelimiter);
    return AppendToLocalString(sVar, sElem, oObject);
}

// Prepend sElem to sVar delimited by sDelimiter stored on oObject
// - sVar variable name storing a list
// - sElem element to prepend to the list
// - oObject object which stores the variable
// - sDelimiter delimiter for the list
// * Returns the new value of the list
string PrependToLocalStringList(string sVar, string sElem, object oObject=OBJECT_SELF, string sDelimiter=STRING_LIST_DEFAULT_DELIMITER)
{
    string sList = GetLocalString(oObject, sVar);
    sElem = AdjustStringListElem(sElem, sList, sDelimiter);
    return PrependToLocalString(sVar, sElem, oObject);
}

// Check if sElem is in the string list stored in sVar on oObject using sDelimiter
// - sVar name of the variable storing the list
// - sElem element to compare
// - oObject object which stores the variable
// - sDelimiter delimiter for the list
// * Returns TRUE if sElem is in the list, FALSE otherwise.
int IsInLocalStringList(string sVar, string sElem, object oObject=OBJECT_SELF, string sDelimiter=STRING_LIST_DEFAULT_DELIMITER)
{
    string sList = GetLocalString(oObject, sVar);
    if (sList == "") return FALSE;
    return GetIsInList(sList, sElem, sDelimiter);
}

// Delete occurance of sElem from string list stored in sVar using sDelimiter.
// - sVar name of the variable storing the list
// - sElem element to delete
// - oObject object which stores the variable
// - iDeleteAll whether to delete all occurances or only the first one
// - sDelimiter delimiter for the list
// * Returns the new value of the list
string DeleteFromLocalStringList(string sVar, string sElem, object oObject=OBJECT_SELF, int iDeleteAll=TRUE, string sDelimiter=STRING_LIST_DEFAULT_DELIMITER)
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

// Add the delimiter as first character of the sElem if sList doesnt end in a delimiter.
// - sElem element to adjust
// - sList list to adjust for
// - sDelimiter delimiter to use
// * Returns sElem adjusted for sList
string AdjustStringListElem(string sElem, string sList, string sDelimiter=STRING_LIST_DEFAULT_DELIMITER)
{
    if (sList == "" || GetStringRight(sList, 1) == sDelimiter) return sElem;
    return sDelimiter + sElem;
}
