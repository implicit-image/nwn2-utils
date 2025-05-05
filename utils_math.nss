
int Clamp(int iValue, int iLower=0, int iUpper=40);

int DiceRoll(int nDiceNum, int nDice);


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


int Clamp(int iValue, int iLower=0, int iUpper=40) {
    if (iValue > iUpper) return iUpper;
    if (iValue < iLower) return iLower;
    return iValue;
}


// rolls nDiceNum dice
// for dice use D* constants
// returns PS_DICE_INVALID if invalid D* constant has been passed
int DiceRoll(int nDiceNum, int nDice)
{
    if (nDiceNum < 1)
        nDiceNum = 1;
    switch (nDice)
    {
        case D2: return d2(nDiceNum);
        case D3: return d3(nDiceNum);
        case D4: return d4(nDiceNum);
        case D6: return d6(nDiceNum);
        case D8: return d8(nDiceNum);
        case D10: return d10(nDiceNum);
        case D12: return d12(nDiceNum);
        case D20: return d20(nDiceNum);
        case D100: return d100(nDiceNum);
    }
    return UTILS_DICE_INVALID;
}
