#include "utils_const"

int ClampInt(int iValue, int iLower=0, int iUpper=40);

float ClampFloat(float fValue, float fLower=0.0, float fUpper=40.0);

int DiceRoll(int iDice, int iDiceNumber=1);

// Ensure that the iValue is between iLower and iUpper (inclusive)
// - iValue value to adjust
// - iLower lower bound
// - iUpper upper bound
// * Returns at lest iLower and at most iUpper
int ClampInt(int iValue, int iLower=0, int iUpper=40) {
    if (iValue > iUpper) return iUpper;
    if (iValue < iLower) return iLower;
    return iValue;
}

// FIXME: might be wonky bcs of float arithmetic
// Ensure that the fValue is between fLower and fUpper (inclusive)
// - fValue value to adjust
// - fLower lower bound
// - fUpper upper bound
// * Returns at leats fLower and at most fUpper
float ClampFloat(float fValue, float fLower=0.0, float fUpper=40.0)
{
    if (fValue > fUpper) return fUpper;
    if (fValue < fLower) return fLower;
    return fValue;
}


// rolls nDiceNum dice
// for dice use D* constants
// - iDice what dice to roll; use D* constants
// - iDiceNumber number of dice to roll
// returns PS_DICE_INVALID if invalid D* constant has been passed
int DiceRoll(int iDice, int iDiceNumber=1)
{
    switch (iDice)
    {
        case D2: return d2(iDiceNumber);
        case D3: return d3(iDiceNumber);
        case D4: return d4(iDiceNumber);
        case D6: return d6(iDiceNumber);
        case D8: return d8(iDiceNumber);
        case D10: return d10(iDiceNumber);
        case D12: return d12(iDiceNumber);
        case D20: return d20(iDiceNumber);
        case D100: return d100(iDiceNumber);
    }
    return 0;
}
