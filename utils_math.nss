
int ClampInt(int iValue, int iLower=0, int iUpper=40);

float ClampFloat(float fValue, float fLower=0.0, float fUpper=40.0);

int DiceRoll(int iDice, int iDiceNumber=1);


const int D2      = 2;
const int D3      = 3;
const int D4      = 5;
const int D6      = 7;
const int D8      = 11;
const int D10     = 13;
const int D12     = 17;
const int D20     = 19;
const int D100    = 23;
const int UTILS_DICE_INVALID = 0;


int ClampInt(int iValue, int iLower=0, int iUpper=40) {
    if (iValue > iUpper) return iUpper;
    if (iValue < iLower) return iLower;
    return iValue;
}

float ClampFloat(float fValue, float fLower=0.0, float fUpper=40.0)
{
    if (fValue > fUpper) return fUpper;
    if (fValue < fLower) return fLower;
    return fValue;
}


// rolls nDiceNum dice
// for dice use D* constants
// returns PS_DICE_INVALID if invalid D* constant has been passed
int DiceRoll(int iDice, int iDiceNumber=1)
{
    switch (nDice)
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
