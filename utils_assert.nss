#include "utils_log"


int UXAssert(int iTest, string sMsg="")
{
    string sColor = iTest ? "green" : "red";
    string sPrompt = iTest ? "PASSED:" : "FAILED:";
    if (sMsg != "") sMsg = " (" + sMsg + ") ";
    Log("ASSERTION " + sPrompt + " " + sMsg, OBJECT_SELF, sColor);
    return iTest;
}
