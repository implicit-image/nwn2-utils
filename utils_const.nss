// utils_const.nss :: useful constants

const int UTILS_INT_MAX = 2147483647;
const int UTILS_INT_MIN = -2147483648;

// types
const int TYPE_INVALID = -1;
const int TYPE_INT = 1;
const int TYPE_FLOAT = 2;
const int TYPE_STRING = 3;
const int TYPE_OBJECT = 4;
const int TYPE_LOCATION = 5;
const int TYPE_VECTOR = 6;

const string TYPE_NAME_INVALID = "<INVALID>";
const string TYPE_NAME_INT = "INT";
const string TYPE_NAME_FLOAT = "FLOAT";
const string TYPE_NAME_STRING = "STRING";
const string TYPE_NAME_OBJECT = "OBJECT";
const string TYPE_NAME_LOCATION = "LOCATION";
const string TYPE_NAME_VECTOR = "VECTOR";

// identities
const int INT_ADD_ID = 0;
const int INT_MULTIPLY_ID = 1;
const int INT_OR_ID = 0;
const float FLOAT_ADD_ID = 0.0f;
const float FLOAT_MULTIPLY_ID = 1.0f;
const string STRING_CONCAT_ID = "";


// time related constants
const string UTILS_TIMESTAMP_DELIM = "_";

const int UTILS_TIMESTAMP_MAX_DAYS = 1008000;
const int UTILS_TIMESTAMP_MAX_MILISECONDS = 86400000;
const int UTILS_SECONDS_IN_MINUTE = 60;
const int UTILS_MINUTES_IN_HOUR = 60;
const int UTILS_HOURS_IN_DAY = 24;
const int UTILS_DAYS_IN_MONTH = 28;
const int UTILS_MONTHS_IN_YEAR = 12;

const int UTILS_TURN_MS = 6000;
// missing effect ids

const int EFFECT_TYPE_DEATH = 111;
const int EFFECT_TYPE_MODIFY_ATTACKS = 112;
const int EFFECT_TYPE_LOW_LIGHT_VISION = 113;
const int EFFECT_TYPE_SET_SCALE = 114;
const int EFFECT_TYPE_SEE_TRUE_HP = 115;
const int EFFECT_TYPE_DARKVISION = 116;
const int EFFECT_TYPE_ARMOR_CHECK_PENALTY_INCREASE = 117;
const int EFFECT_TYPE_BAB_MINIMUM = 118;
const int EFFECT_TYPE_SUMMON_COPY = 119;

// synonym for EFFECT_TYPE_ELEMENTALSHIELD
const int EFFECT_TYPE_DAMAGESHIELD = 60;

// lists
const string STRING_LIST_DEFAULT_DELIMITER = ",";

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
