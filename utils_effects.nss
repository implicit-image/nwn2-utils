#include "utils_types"
#include "utils_stringify"
#include "utils_array"


struct CustomEffect MakeCustomEffect(int iEffectType, int iEffectSubtype);

struct CustomEffect CustomEffectSetArgInt(struct CustomEffect stEffect, int iValue, int iArgPos);

struct CustomEffect CustomEffectSetArgFloat(struct CustomEffect stEffect, float fValue, int iArgPos);

struct CustomEffect CustomEffectSetArgString(struct CustomEffect stEffect, string sValue, int iArgPos);

struct CustomEffect CustomEffectSetArgObject(struct CustomEffect stEffect, object oValue, int iArgPos);

struct CustomEffect CustomEffectSetArgLocation(struct CustomEffect stEffect, location lValue, int iArgPos);

struct CustomEffect CustomEffectSetArgVector(struct CustomEffect stEffect, vector vValue, int iArgPos);

struct MaybeEffect CreateEffectFromCustomEffect(struct CustomEffect stEffect);

struct EffectLink MyEffectLinkEffects(effect eChild, effect eParent);

effect JoinEffectLink(struct EffectLink stLink);

string GetEffectString(effect e);

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



struct CustomEffect MakeCustomEffect(int iEffectType, int iEffectSubtype)
{
    // effect eLeft, eRight;
    // effect type
    stRes.iType = iEffectType;
    // effect subtype
    stRes.iSubtype = iEffectSubtype;
    // links (initialized as null effects)
    // stRes.eLinkLeft = eLeft;
    // stRes.eLinkRight = eRight;
    stRes.iArg1Type = TYPE_INVALID;
    stRes.iArg2Type = TYPE_INVALID;
    stRes.iArg3Type = TYPE_INVALID;
    stRes.iArg4Type = TYPE_INVALID;
    stRes.iArg5Type = TYPE_INVALID;
    stRes.iArg6Type = TYPE_INVALID;
    stRes.iArg7Type = TYPE_INVALID;
    stRes.iArg8Type = TYPE_INVALID;
    stRes.iArg1 = -1;
    stRes.iArg2 = -1;
    stRes.iArg3 = -1;
    stRes.iArg4 = -1;
    stRes.iArg5 = -1;
    stRes.iArg6 = -1;
    stRes.iArg7 = -1;
    stRes.iArg8 = -1;
    stRes.fArg1 = 0.0f;
    stRes.fArg2 = 0.0f;
    stRes.fArg3 = 0.0f;
    stRes.fArg4 = 0.0f;
    stRes.fArg5 = 0.0f;
    stRes.fArg6 = 0.0f;
    stRes.fArg7 = 0.0f;
    stRes.fArg8 = 0.0f;
    stRes.sArg1 = "";
    stRes.sArg2 = "";
    stRes.sArg3 = "";
    stRes.sArg4 = "";
    stRes.sArg5 = "";
    stRes.sArg6 = "";
    stRes.sArg7 = "";
    stRes.sArg8 = "";
    stRes.oArg1 = OBJECT_INVALID;
    stRes.oArg2 = OBJECT_INVALID;
    stRes.oArg3 = OBJECT_INVALID;
    stRes.oArg4 = OBJECT_INVALID;
    stRes.oArg5 = OBJECT_INVALID;
    stRes.oArg6 = OBJECT_INVALID;
    stRes.oArg7 = OBJECT_INVALID;
    stRes.oArg8 = OBJECT_INVALID;
    stRes.lArg1 = Location(OBJECT_INVALID, [0.0f, 0.0f, 0.0f], 0.0f);
    stRes.lArg2 = Location(OBJECT_INVALID, [0.0f, 0.0f, 0.0f], 0.0f);
    stRes.lArg3 = Location(OBJECT_INVALID, [0.0f, 0.0f, 0.0f], 0.0f);
    stRes.lArg4 = Location(OBJECT_INVALID, [0.0f, 0.0f, 0.0f], 0.0f);
    stRes.lArg5 = Location(OBJECT_INVALID, [0.0f, 0.0f, 0.0f], 0.0f);
    stRes.lArg6 = Location(OBJECT_INVALID, [0.0f, 0.0f, 0.0f], 0.0f);
    stRes.lArg7 = Location(OBJECT_INVALID, [0.0f, 0.0f, 0.0f], 0.0f);
    stRes.lArg8 = Location(OBJECT_INVALID, [0.0f, 0.0f, 0.0f], 0.0f);
    stRes.vArg1 = [0.0f, 0.0f, 0.0f];
    stRes.vArg2 = [0.0f, 0.0f, 0.0f];
    stRes.vArg3 = [0.0f, 0.0f, 0.0f];
    stRes.vArg4 = [0.0f, 0.0f, 0.0f];
    stRes.vArg5 = [0.0f, 0.0f, 0.0f];
    stRes.vArg6 = [0.0f, 0.0f, 0.0f];
    stRes.vArg7 = [0.0f, 0.0f, 0.0f];
    stRes.vArg8 = [0.0f, 0.0f, 0.0f];

    return stRes;
}

struct CustomEffect CustomEffectSetArgInt(struct CustomEffect stEffect, int iValue, int iArgPos)
{
    switch (iArgPos)
    {
        case 1:
        {
            stEffect.iArg1Type = TYPE_INT;
            stEffect.iArg1 = iValue;
        }
        case 2:
        {
            stEffect.iArg2Type = TYPE_INT;
            stEffect.iArg2 = iValue;
        }
        case 3:
        {
            stEffect.iArg3Type = TYPE_INT;
            stEffect.iArg3 = iValue;
        }
        case 4:
        {
            stEffect.iArg4Type = TYPE_INT;
            stEffect.iArg4 = iValue;
        }
        case 5:
        {

            stEffect.iArg5Type = TYPE_INT;
            stEffect.iArg5 = iValue;
        }
        case 6:
        {
            stEffect.iArg6Type = TYPE_INT;
            stEffect.iArg6 = iValue;
        }
        case 7:
        {
            stEffect.iArg7Type = TYPE_INT;
            stEffect.iArg7 = iValue;
        }
        case 8:
        {
            stEffect.iArg8Type = TYPE_INT;
            stEffect.iArg8 = iValue;
        }
    }
    return stEffect;
}


struct CustomEffect CustomEffectSetArgFloat(struct CustomEffect stEffect, float fValue, int iArgPos)
{
    switch (iArgPos)
    {
        case 1:
        {
            stEffect.iArg1Type = TYPE_FLOAT;
            stEffect.fArg1 = fValue;
        }
        case 2:
        {

            stEffect.iArg2Type = TYPE_FLOAT;
            stEffect.fArg2 = fValue;
        }
        case 3:
        {

            stEffect.iArg3Type = TYPE_FLOAT;
            stEffect.fArg3 = fValue;
        }
        case 4:
        {

            stEffect.iArg4Type = TYPE_FLOAT;
            stEffect.fArg4 = fValue;
        }
        case 5:
        {

            stEffect.iArg5Type = TYPE_FLOAT;
            stEffect.fArg5 = fValue;
        }
        case 6:
        {
            stEffect.iArg6Type = TYPE_FLOAT;
            stEffect.fArg6 = fValue;
        }
        case 7:
        {
            stEffect.iArg7Type = TYPE_FLOAT;
            stEffect.fArg7 = fValue;
        }
        case 8:
        {
            stEffect.iArg8Type = TYPE_FLOAT;
            stEffect.fArg8 = fValue;
        }
    }
    return stEffect;
}


struct CustomEffect CustomEffectSetArgString(struct CustomEffect stEffect, string sValue, int iArgPos)
{
    switch (iArgPos)
    {
        case 1:
        {
            stEffect.iArg1Type = TYPE_STRING;
            stEffect.sArg1 = sValue;
        }
        case 2:
        {

            stEffect.iArg2Type = TYPE_STRING;
            stEffect.sArg2 = sValue;
        }
        case 3:
        {

            stEffect.iArg3Type = TYPE_STRING;
            stEffect.sArg3 = sValue;
        }
        case 4:
        {

            stEffect.iArg4Type = TYPE_STRING;
            stEffect.sArg4 = sValue;
        }
        case 5:
        {

            stEffect.iArg5Type = TYPE_STRING;
            stEffect.sArg5 = sValue;
        }
        case 6:
        {
            stEffect.iArg6Type = TYPE_STRING;
            stEffect.sArg6 = sValue;
        }
        case 7:
        {
            stEffect.iArg7Type = TYPE_STRING;
            stEffect.sArg7 = sValue;
        }
        case 8:
        {
            stEffect.iArg8Type = TYPE_STRING;
            stEffect.sArg8 = sValue;
        }
    }
    return stEffect;
}

struct CustomEffect CustomEffectSetArgObject(struct CustomEffect stEffect, object oValue, int iArgPos)
{
    switch (iArgPos)
    {
        case 1:
        {
            stEffect.iArg1Type = TYPE_OBJECT;
            stEffect.oArg1 = oValue;
        }
        case 2:
        {

            stEffect.iArg2Type = TYPE_OBJECT;
            stEffect.oArg2 = oValue;
        }
        case 3:
        {

            stEffect.iArg3Type = TYPE_OBJECT;
            stEffect.oArg3 = oValue;
        }
        case 4:
        {

            stEffect.iArg4Type = TYPE_OBJECT;
            stEffect.oArg4 = oValue;
        }
        case 5:
        {

            stEffect.iArg5Type = TYPE_OBJECT;
            stEffect.oArg5 = oValue;
        }
        case 6:
        {
            stEffect.iArg6Type = TYPE_OBJECT;
            stEffect.oArg6 = oValue;
        }
        case 7:
        {
            stEffect.iArg7Type = TYPE_OBJECT;
            stEffect.oArg7 = oValue;
        }
        case 8:
        {
            stEffect.iArg8Type = TYPE_OBJECT;
            stEffect.oArg8 = oValue;
        }
    }
    return stEffect;
}

struct CustomEffect CustomEffectSetArgLocation(struct CustomEffect stEffect, location lValue, int iArgPos)
{
    switch (iArgPos)
    {
        case 1:
        {
            stEffect.iArg1Type = TYPE_LOCATION;
            stEffect.lArg1 = lValue;
        }
        case 2:
        {

            stEffect.iArg2Type = TYPE_LOCATION;
            stEffect.lArg2 = lValue;
        }
        case 3:
        {

            stEffect.iArg3Type = TYPE_LOCATION;
            stEffect.lArg3 = lValue;
        }
        case 4:
        {

            stEffect.iArg4Type = TYPE_LOCATION;
            stEffect.lArg4 = lValue;
        }
        case 5:
        {

            stEffect.iArg5Type = TYPE_LOCATION;
            stEffect.lArg5 = lValue;
        }
        case 6:
        {
            stEffect.iArg6Type = TYPE_LOCATION;
            stEffect.lArg6 = lValue;
        }
        case 7:
        {
            stEffect.iArg7Type = TYPE_LOCATION;
            stEffect.lArg7 = lValue;
        }
        case 8:
        {
            stEffect.iArg8Type = TYPE_LOCATION;
            stEffect.lArg8 = lValue;
        }
    }
    return stEffect;
}

struct CustomEffect CustomEffectSetArgVector(struct CustomEffect stEffect, vector vValue, int iArgPos)
{
    switch (iArgPos)
    {
        case 1:
        {
            stEffect.iArg1Type = TYPE_VECTOR;
            stEffect.vArg1 = vValue;
        }
        case 2:
        {

            stEffect.iArg2Type = TYPE_VECTOR;
            stEffect.vArg2 = vValue;
        }
        case 3:
        {

            stEffect.iArg3Type = TYPE_VECTOR;
            stEffect.vArg3 = vValue;
        }
        case 4:
        {

            stEffect.iArg4Type = TYPE_VECTOR;
            stEffect.vArg4 = vValue;
        }
        case 5:
        {

            stEffect.iArg5Type = TYPE_VECTOR;
            stEffect.vArg5 = vValue;
        }
        case 6:
        {
            stEffect.iArg6Type = TYPE_VECTOR;
            stEffect.vArg6 = vValue;
        }
        case 7:
        {
            stEffect.iArg7Type = TYPE_VECTOR;
            stEffect.vArg7 = vValue;
        }
        case 8:
        {
            stEffect.iArg8Type = TYPE_VECTOR;
            stEffect.vArg8 = vValue;
        }
    }
    return stEffect;
}

struct MaybeEffect CreateEffectFromCustomEffect(struct CustomEffect e)
{
    struct MaybeEffect stRes;
    effect  eRes;
    stRes.isValid = TRUE;

    switch(e.iType)
    {
        case EFFECT_TYPE_HEAL:
        {
            eRes = EffectHeal(e.iArg1);
            break;
        }
        case EFFECT_TYPE_DAMAGE:
        {
            eRes = EffectDamage(e.iArg1, e.iArg2, e.iArg3, e.iArg4);
            break;
        }
        case EFFECT_TYPE_DAMAGE_OVER_TIME:
        {
            eRes = EffectDamageOverTime(e.iArg1, e.fArg2, e.iArg3, e.iArg4);
            break;
        }
        case EFFECT_TYPE_ABILITY_INCREASE:
        {
            eRes = EffectAbilityIncrease(e.iArg1, e.iArg2);
            break;
        }
        case EFFECT_TYPE_DAMAGE_RESISTANCE:
        {
            eRes = EffectDamageResistance(e.iArg1, e.iArg2, e.iArg3);
            break;
        }
        case EFFECT_TYPE_RESURRECTION:
        {
            eRes = EffectResurrection();
            break;
        }
        case EFFECT_TYPE_SUMMON_CREATURE:
        {
            eRes = EffectSummonCreature(e.sArg1, e.iArg2, e.iArg3, e.iArg4);
            break;
        }
        case EFFECT_TYPE_AC_INCREASE:
        {
            eRes = EffectACIncrease(e.iArg1, e.iArg2, e.iArg3, e.iArg4);
            break;
        }
        case EFFECT_TYPE_SAVING_THROW_INCREASE:
        {
            eRes = EffectSavingThrowIncrease(e.iArg1, e.iArg2, e.iArg3, e.iArg4);
            break;
        }
        case EFFECT_TYPE_ATTACK_INCREASE:
        {
            eRes = EffectAttackIncrease(e.iArg1, e.iArg2);
            break;
        }
        case EFFECT_TYPE_DAMAGE_REDUCTION:
        {
            eRes = EffectDamageReduction(e.iArg1, e.iArg2, e.iArg3, e.iArg4);
            break;
        }
        case EFFECT_TYPE_DAMAGE_INCREASE:
        {
            eRes = EffectDamageIncrease(e.iArg1, e.iArg2, e.iArg3);
            break;
        }
        case EFFECT_TYPE_ENTANGLE:
        {
            eRes = EffectEntangle();
            break;
        }
        case EFFECT_TYPE_DEATH:
        {
            eRes = EffectDeath(e.iArg1, e.iArg2, e.iArg3, e.iArg4);
            break;
        }
        case EFFECT_TYPE_KNOCKDOWN:
        {
            eRes = EffectKnockdown();
            break;
        }
        case EFFECT_TYPE_CURSE:
        {
            eRes = EffectCurse(e.iArg1, e.iArg2, e.iArg3, e.iArg4, e.iArg5, e.iArg6);
            break;
        }
        case EFFECT_TYPE_PARALYZE:
        {
            eRes = EffectParalyze(e.iArg1, e.iArg2, e.iArg3);
            break;
        }
        case EFFECT_TYPE_SPELL_IMMUNITY:
        {
            eRes = EffectSpellImmunity(e.iArg1);
            break;
        }
        case EFFECT_TYPE_DEAF:
        {
            eRes = EffectDeaf()
            break;
        }
        case EFFECT_TYPE_SLEEP:
        {
            eRes = EffectSleep();
            break;
        }
        case EFFECT_TYPE_CHARMED:
        {
            eRes = EffectCharmed();
            break;
        }
        case EFFECT_TYPE_CONFUSED:
        {
            eRes = EffectConfused();
            break;
        }
        case EFFECT_TYPE_FRIGHTENED:
        {
            eRes = EffectFrightened();
            break;
        }
        case EFFECT_TYPE_DOMINATED:
        {
            eRes = EffectDominated();
            break;
        }
        case EFFECT_TYPE_DAZED:
        {
            eRes = EffectDazed();
            break;
        }
        case EFFECT_TYPE_STUNNED:
        {
            eRes = EffectStunned();
            break;
        }
        case EFFECT_TYPE_REGENERATE:
        {
            eRes = EffectRegenerate(e.iArg1, e.fArg2);
            break;
        }
        case EFFECT_TYPE_MOVEMENT_SPEED_INCREASE:
        {
            eRes = EffectMovementSpeedIncrease(e.iArg1);
            break;
        }
        case EFFECT_TYPE_SPELL_RESISTANCE_INCREASE:
        {
            eRes = EffectSpellResistanceIncrease(e.iArg1, e.iArg2);
            break;
        }
        case EFFEC_TYPE_POISON:
        {
            eRes = EffectPoison(e.iArgs1);
            break;
        }
        case EFFECT_TYPE_DISEASE:
        {
            eRes = EffectDisease(e.iArg1);
            break;
        }
        case EFFECT_TYPE_SILENCE:
        {
            eRes = EffectSilence();
            break;
        }
        case EFFECT_TYPE_HASTE:
        {
            eRes = EffectHaste();
            break;
        }
        case EFFECT_TYPE_SLOW:
        {
            eRes = EffectSlow();
            break;
        }
        case EFFECT_TYPE_IMMUNITY:
        {
            eRes = EffectImmunity(e.iArg1);
            break;
        }
        case EFFECT_TYPE_DAMAGE_IMMUNITY_INCREASE:
        {
            eRes = EffectDamageImmunityIncrease(e.iArg1, e.iArg2);
            break;
        }
        case EFFECT_TYPE_TEMPORARY_HITPOINTS:
        {
            eRes = EffectTemporaryHitpoints(e.iArg1);
            break;
        }
        case EFFECT_TYPE_SKILL_INCREASE:
        {
            eRes = EffectSkillIncrease(e.iArg1, e.iArg2);
            break;
        }
        case EFFECT_TYPE_TURNED:
        {
            eRes = EffectTurned();
            break;
        }
        case EFFECT_TYPE_HITPOINT_CHANGE_WHEN_DYING:
        {
            eRes = EffectHitPointChangeWhenDying(e.fArg1);
            break;
        }
        case EFFECT_TYPE_ABILITY_DECREASE:
        {
            eRes = EffectAbilityDecrease(e.iArg1, e.iArg2);
            break;
        }
        case EFFECT_TYPE_ATTACK_DECREASE:
        {
            eRes = EffectAttackDecrease(e.iArg1, e.iArg2);
            break;
        }
        case EFFECT_TYPE_DAMAGE_DECREASE:
        {
            eRes = EffectDamageDecrease(e.iArg1, e.iArg2);
            break;
        }
        case EFFECT_TYPE_DAMAGE_IMMUNITY_DECREASE:
        {
            eRes = EffectDamageImmunityDecrease(e.iArg1, e.iArg2);
            break;
        }
        case EFFECT_TYPE_AC_DECREASE:
        {
            eRes = EffectACDecrease(e.iArg1, e.iArg2, e.iArg3);
            break;
        }
        case EFFECT_TYPE_MOVEMENT_SPEED_DECREASE:
        {
            eRes = EffectMovementSpeedDecrease(e.iArg1);
            break;
        }
        case EFFECT_TYPE_SAVING_THROW_DECREASE:
        {
            eRes = EffectSavingThrowDecrease(e.iArg1, e.iArg2, e.iArg3);
            break;
        }
        case EFFECT_TYPE_SKILL_DECREASE:
        {
            eRes = EffectSkillDecrease(e.iArg1, e.iArg2);
            break;
        }
        case EFFECT_TYPE_SPELL_RESISTANCE_DECREASE:
        {
            eRes = EffectSpellResistanceDecrease(e.iArg1);
            break;
        }
        case EFFECT_TYPE_INVISIBILITY:
        {
            eRes = EffectInvisibility(e.iArg1);
            break;
        }
        case EFFECT_TYPE_CONCEALMENT:
        {
            eRes = EffectConcealment(e.iArg1, e.iArg2);
            break;
        }
        case EFFECT_TYPE_DARKNESS:
        {
            eRes = EffectDarkness();
            break;
        }
        case EFFECT_TYPE_ULTRAVISION:
        {
            eRes = EffectUltravision();
            break;
        }
        case EFFECT_TYPE_NEGATIVELEVEL:
        {
            eRes = EffectNegativeLevel(e.iArg1, e.iArg2);
            break;
        }
        case EFFECT_TYPE_POLYMORPH:
        {
            eRes = EffectPolymorph(e.iArg1, e.iArg2, e.iArg3);
            break;
        }
        case EFFECT_TYPE_SANCTUARY:
        {
            eRes = EffectSanctuary(e.iArg1);
            break;
        }
        case EFFECT_TYPE_TRUESEEING:
        {
            eRes = EffectTrueSeeing();
            break;
        }
        case EFFECT_TYPE_SEEINVISIBLE:
        {
            eRes = EffectSeeInvisible();
            break;
        }
        case EFFECT_TYPE_TIMESTOP:
        {
            eRes = EffectTimeStop();
            break;
        }
        case EFFECT_TYPE_BLINDNESS:
        {
            eRes = EffectBlindness();
            break;
        }
        case EFFECT_TYPE_SPELLLEVELABSORPTION:
        {
            eRes = EffectSpellLevelAbsorption(e.iArg1, e.iArg2, e.iArg3);
            break;
        }
        case EFFECT_TYPE_MISS_CHANCE:
        {
            eRes = EffectMissChance(e.iArg1, e.iArg2);
            break;
        }
        case EFFECT_TYPE_MODIFY_ATTACKS:
        {
            eRes = EffectModifyAttacks(e.iArg1);
            break;
        }
        case EFFECT_TYPE_ELEMENTALSHIELD:
        case EFFECT_TYPE_DAMAGESHIELD:
        {
            eRes = EffectDamageShield(e.iArg1, e.iArg2, e.iArg3);
            break;
        }
        case EFFECT_TYPE_SWARM:
        {
            eRes = EffectSwarm(e.iArg1, e.sArg2, e.sArg3, e.sArg4, e.sArg5);
            break;
        }
        case EFFECT_TYPE_TURN_RESISTANCE_DECREASE:
        {
            eRes = EffectTurnResistanceDecrease(e.iArg1);
            break;
        }
        case EFFECT_TYPE_TURN_RESISTANCE_INCREASE:
        {
            eRes = EffectTurnResistanceIncrease(e.iArg1);
            break;
        }
        case EFFECT_TYPE_PETRIFY:
        {
            eRes = EffectPetrify();
            break;
        }
        case EFFECT_TYPE_SPELL_FAILURE:
        {
            eRes = EffectSpellFailure(e.iArg1, e.iArg2);
            break;
        }
        case EFFECT_TYPE_ETHEREAL:
        {
            eRes = EffectEthereal();
            break;
        }
        case EFFECT_TYPE_DETECTUNDEAD:
        {
            eRes = EffectDetectUndead();
            break;
        }
        case EFFECT_TYPE_LOW_LIGHT_VISION:
        {
            eRes = EffectLowLightVision();
            break;
        }
        case EFFECT_TYPE_SET_SCALE:
        {
            eRes = EffectSetScale(e.fArg1. e.fArg2, e.fArg3);
            break;
        }
        case EFFECT_TYPE_SHAREDDAMAGE:
        {
            eRes = EffectShareDamage(e.oArg1, e.iArg2, e.iArg3);
            break;
        }
        case EFFECT_TYPE_ASSAYRESISTANCE:
        {
            eRes = EffectAssayResistance(e.oArg1);
            break;
        }
        case EFFECT_TYPE_SEE_TRUEHP:
        {
            eRes = EffectSeeTrueHPs();
            break;
        }
        case EFFECT_TYPE_ABSORBDAMAGE:
        {
            eRes = EffectAbsorbDamage(e.iArg1);
            break;
        }
        case EFFECT_TYPE_HIDEOUS_BLOW:
        {
            eRes = EffectHideousBlow(e.iArg1);
            break;
        }
        case EFFECT_TYPE_MESMERIZE:
        {
            eRes = EffectMesmerize(e.iArg1, e.fArg2);
            break;
        }
        case EFFECT_TYPE_DARKVISION:
        {
            eRes = EffectDarkVision();
            break;
        }
        case EFFECT_TYPE_ARMOR_CHECK_PENALTY_INCREASE:
        {
            eRes = EffectArmorCheckPenaltyIncrease(e.oArg1, e.iArg2);
            break;
        }
        case EFFECT_TYPE_DISINTEGRATE:
        {
            eRes = EffectDisintegrate(e.oArg1);
            break;
        }
        case EFFECT_TYPE_HEAL_ON_ZERO_HP:
        {
            eRes = EffectHealOnZeroHP(e.oArg1. e.iArg2);
            break;
        }
        case EFFECT_TYPE_BREAK_ENCHANTMENT:
        {
            eRes = EffectBreakEnchantment(e.iArg1);
            break;
        }
        case EFFECT_TYPE_BONUS_HITPOINTS:
        {
            eRes = EffectBonusHitpoints(e.iArg1);
            break;
        }
        case EFFECT_TYPE_BARDSONG_SINGING:
        {
            eRes = EffectBardSongSinging(e.iArg1);
            break;
        }
        case EFFECT_TYPE_JARRING:
        {
            eRes = EffectJarring();
            break;
        }
        case EFFECT_TYPE_BAB_MINIMUM:
        {
            eRes = EffectBABMinimum(e.iArg1);
            break;
        }
        case EFFECT_TYPE_MAX_DAMAGE:
        {
            eRes = EffectMaxDamage();
            break;
        }
        case EFFECT_TYPE_ARCANE_SPELL_FAILURE:
        {
            eRes = EffectArcaneSpellFailure(e.iArg1);
            break;
        }
        case EFFECT_TYPE_WILDSHAPE:
        {
            eRes = EffectWildshape();
            break;
        }
        case EFFECT_TYPE_EFFECT_ICON:
        {
            eRes = EffectEffectIcon(e.iArg1);
            break;
        }
        case EFFECT_TYPE_RESCUE:
        {
            eRes = EffectRescue(e.iArg1);
            break;
        }
        case EFFECT_TYPE_DETECT_SPIRITS:
        {
            eRes = EffectDetectSpirits();
            break;
        }
        case EFFECT_TYPE_DAMAGE_REDUCTION_NEGATED:
        {
            eRes = EffectDamageReductionNegated();
            break;
        }
        case EFFECT_TYPE_INSANE:
        {
            eRes = EffectInsane();
            break;
        }
        case EFFECT_TYPE_SUMMON_COPY:
        {
            eRes = EffectSummonCopy(e.oArg1, e.iArg2. e.fArg3, e.sArg4, e.iArg5, e.sArg6);
            break;
        }
        default:
        {
            stRes.isValid = FALSE;
        }
    }
    if (stRes.isValid) stRes.value = eRes;

    return stRes;
}
// Gets a description for the given effect.
string GetEffectStringDescription(effect e)
{
    switch (GetEffectType(e))
    {
        case EFFECT_TYPE_DAMAGE_RESISTANCE:             // 1
            return GetStringByStrRef(8028);             // "Damage Resistance"

        case EFFECT_TYPE_REGENERATE:                    // 3
            return GetStringByStrRef(8029);             // "Regenerating"

        case EFFECT_TYPE_DAMAGE_REDUCTION:              // 7
            return GetStringByStrRef(8030);             // "Damage Reduction"

        case EFFECT_TYPE_TEMPORARY_HITPOINTS:           // 9
            return GetStringByStrRef(8031);             // "Temporary Hit Points"

        case EFFECT_TYPE_ENTANGLE:                      // 11
            return GetStringByStrRef(8032);             // "Entangled"

        case EFFECT_TYPE_INVULNERABLE:                  // 12
            return GetStringByStrRef(8033);             // "Invulnerable"

        case EFFECT_TYPE_DEAF:                          // 13
            return GetStringByStrRef(8034);             // "Deaf"

        case EFFECT_TYPE_IMMUNITY:                      // 15
        {
            switch (GetEffectInteger(e, 0))
            {
                case IMMUNITY_TYPE_NONE:                        // 0
                    return GetStringByStrRef(66128);            // "Immunity: All"
                case IMMUNITY_TYPE_MIND_SPELLS:                 // 1
                    return GetStringByStrRef(66129);            // "Immunity: Mind spells"
                case IMMUNITY_TYPE_POISON:                      // 2
                    return GetStringByStrRef(66130);            // "Immunity: Poison"
                case IMMUNITY_TYPE_DISEASE:                     // 3
                    return GetStringByStrRef(66131);            // "Immunity: Disease"
                case IMMUNITY_TYPE_FEAR:                        // 4
                    return GetStringByStrRef(66132);            // "Immunity: Fear"
                case IMMUNITY_TYPE_TRAP:                        // 5
                    return GetStringByStrRef(66134);            // "Immunity: Trap"
                case IMMUNITY_TYPE_PARALYSIS:                   // 6
                    return GetStringByStrRef(66135);            // "Immunity: Paralysis"
                case IMMUNITY_TYPE_BLINDNESS:                   // 7
                    return GetStringByStrRef(66136);            // "Immunity: Blindness"
                case IMMUNITY_TYPE_DEAFNESS:                    // 8
                    return GetStringByStrRef(66137);            // "Immunity: Deafness"
                case IMMUNITY_TYPE_SLOW:                        // 9
                    return GetStringByStrRef(66139);            // "Immunity: Slow"
                case IMMUNITY_TYPE_ENTANGLE:                    // 10
                    return GetStringByStrRef(66140);            // "Immunity: Entangle"
                case IMMUNITY_TYPE_SILENCE:                     // 11
                    return GetStringByStrRef(66141);            // "Immunity: Silence"
                case IMMUNITY_TYPE_STUN:                        // 12
                    return GetStringByStrRef(66142);            // "Immunity: Stun"
                case IMMUNITY_TYPE_SLEEP:                       // 13
                    return GetStringByStrRef(66143);            // "Immunity: Sleep"
                case IMMUNITY_TYPE_CHARM:                       // 14
                    return GetStringByStrRef(66144);            // "Immunity: Charm"
                case IMMUNITY_TYPE_DOMINATE:                    // 15
                    return GetStringByStrRef(66145);            // "Immunity: Dominate"
                case IMMUNITY_TYPE_CONFUSED:                    // 16
                    return GetStringByStrRef(66146);            // "Immunity: Confuse"
                case IMMUNITY_TYPE_CURSED:                      // 17
                    return GetStringByStrRef(66147);            // "Immunity: Curse"
                case IMMUNITY_TYPE_DAZED:                       // 18
                    return GetStringByStrRef(66148);            // "Immunity: Dazed"
                case IMMUNITY_TYPE_ABILITY_DECREASE:            // 19
                    return GetStringByStrRef(66149);            // "Immunity: Ability decrease"
                case IMMUNITY_TYPE_ATTACK_DECREASE:             // 20
                    return GetStringByStrRef(66150);            // "Immunity: Attack decrease"
                case IMMUNITY_TYPE_DAMAGE_DECREASE:             // 21
                    return GetStringByStrRef(66151);            // "Immunity: Damage decrease"
                case IMMUNITY_TYPE_DAMAGE_IMMUNITY_DECREASE:    // 22
                    return GetStringByStrRef(66153);            // "Immunity: Damage immunity decrease"
                case IMMUNITY_TYPE_AC_DECREASE:                 // 23
                    return GetStringByStrRef(66154);            // "Immunity: AC decrease"
                case IMMUNITY_TYPE_MOVEMENT_SPEED_DECREASE:     // 24
                    return GetStringByStrRef(66156);            // "Immunity: Movement speed decrease"
                case IMMUNITY_TYPE_SAVING_THROW_DECREASE:       // 25
                    return GetStringByStrRef(66157);            // "Immunity: Saving throw decrease"
                case IMMUNITY_TYPE_SPELL_RESISTANCE_DECREASE:   // 26
                    return GetStringByStrRef(66158);            // "Immunity: Spell resistance decrease"
                case IMMUNITY_TYPE_SKILL_DECREASE:              // 27
                    return GetStringByStrRef(66159);            // "Immunity: Skill decrease"
                case IMMUNITY_TYPE_KNOCKDOWN:                   // 28
                    return GetStringByStrRef(66160);            // "Immunity: Knockdown"
                case IMMUNITY_TYPE_NEGATIVE_LEVEL:              // 29
                    return GetStringByStrRef(66161);            // "Immunity: Negative level"
                case IMMUNITY_TYPE_SNEAK_ATTACK:                // 30
                    return GetStringByStrRef(66162);            // "Immunity: Sneak attack"
                case IMMUNITY_TYPE_CRITICAL_HIT:                // 31
                    return GetStringByStrRef(66163);            // "Immunity: Critical hit"
                case IMMUNITY_TYPE_DEATH:                       // 32
                    return GetStringByStrRef(66164);            // "Immunity: Death Magic"
            }
            return GetStringByStrRef(8036);             // "Immunity"
        }

        case EFFECT_TYPE_ENEMY_ATTACK_BONUS:            // 17
            return "Enemy Attack Bonus";

        case EFFECT_TYPE_ARCANE_SPELL_FAILURE:          // 18
            return GetStringByStrRef(84321);            // "Arcane Spell Failure"

        case EFFECT_TYPE_CHARMED:                       // 23
            return GetStringByStrRef(8039);             // "Charmed"

        case EFFECT_TYPE_CONFUSED:                      // 24
            return GetStringByStrRef(8040);             // "Confused"

        case EFFECT_TYPE_FRIGHTENED:                    // 25
            return GetStringByStrRef(8041);             // "Frightened"

        case EFFECT_TYPE_DOMINATED:                     // 26
            return GetStringByStrRef(8042);             // "Dominated"

        case EFFECT_TYPE_PARALYZE:                      // 27
            return GetStringByStrRef(8043);             // "Paralyzed"

        case EFFECT_TYPE_DAZED:                         // 28
            return GetStringByStrRef(8044);             // "Dazed"

        case EFFECT_TYPE_STUNNED:                       // 29
            return GetStringByStrRef(8045);             // "Stunned"

        case EFFECT_TYPE_SLEEP:                         // 30
            return GetStringByStrRef(8046);             // "Asleep"

        case EFFECT_TYPE_POISON:                        // 31
            return GetStringByStrRef(8047);             // "Poisoned"

        case EFFECT_TYPE_DISEASE:                       // 32
            return GetStringByStrRef(8048);             // "Diseased"

        case EFFECT_TYPE_CURSE:                         // 33
            return GetStringByStrRef(8049);             // "Cursed"

        case EFFECT_TYPE_SILENCE:                       // 34
            return GetStringByStrRef(8050);             // "Silenced"

        case EFFECT_TYPE_TURNED:                        // 35
            return GetStringByStrRef(8051);             // "Turned"

        case EFFECT_TYPE_HASTE:                         // 36
            return GetStringByStrRef(8052);             // "Hasted"

        case EFFECT_TYPE_SLOW:                          // 37
            return GetStringByStrRef(8053);             // "Slowed"

        case EFFECT_TYPE_ABILITY_INCREASE:              // 38
        {
            switch (GetEffectInteger(e, 0))
            {
                case ABILITY_STRENGTH:
                    return GetStringByStrRef(58369);    // "Strength Increased"
                case ABILITY_DEXTERITY:
                    return GetStringByStrRef(58371);    // "Dexterity Increased"
                case ABILITY_CONSTITUTION:
                    return GetStringByStrRef(58373);    // "Constitution Increased"
                case ABILITY_INTELLIGENCE:
                    return GetStringByStrRef(58375);    // "Intelligence Increased"
                case ABILITY_WISDOM:
                    return GetStringByStrRef(58377);    // "Wisdom Increased"
                case ABILITY_CHARISMA:
                    return GetStringByStrRef(58379);    // "Charisma Increased"
            }
            return GetStringByStrRef(8054);             // "Ability Increased"
        }

        case EFFECT_TYPE_ABILITY_DECREASE:              // 39
        {
            switch (GetEffectInteger(e, 0))
            {
                case ABILITY_STRENGTH:
                    return GetStringByStrRef(58370);    // "Strength Decreased"
                case ABILITY_DEXTERITY:
                    return GetStringByStrRef(58372);    // "Dexterity Decreased"
                case ABILITY_CONSTITUTION:
                    return GetStringByStrRef(58374);    // "Constitution Decreased"
                case ABILITY_INTELLIGENCE:
                    return GetStringByStrRef(58376);    // "Intelligence Decreased"
                case ABILITY_WISDOM:
                    return GetStringByStrRef(58378);    // "Wisdom Decreased"
                case ABILITY_CHARISMA:
                    return GetStringByStrRef(58380);    // "Charisma Decreased"
            }
            return GetStringByStrRef(8055);             // "Ability Decreased"
        }

        case EFFECT_TYPE_ATTACK_INCREASE:               // 40
            return GetStringByStrRef(8056);             // "Attack Increased"

        case EFFECT_TYPE_ATTACK_DECREASE:               // 41
            return GetStringByStrRef(8057);             // "Attack Decreased"

        case EFFECT_TYPE_DAMAGE_INCREASE:               // 42
            return GetStringByStrRef(8058);             // "Damage Increased"

        case EFFECT_TYPE_DAMAGE_DECREASE:               // 43
            return GetStringByStrRef(8059);             // "Damage Decreased"

        case EFFECT_TYPE_DAMAGE_IMMUNITY_INCREASE:      // 44
        {
            string sType = GetStringByStrRef(8060);     // "Damage Immunity Increased"
            switch (GetEffectInteger(e, 0))
            {
                case DAMAGE_TYPE_BLUDGEONING:                               // 1
                    return sType + " (" + GetStringByStrRef(1031) + ")";    // "Bludgeoning"
                case DAMAGE_TYPE_PIERCING:                                  // 2
                    return sType + " (" + GetStringByStrRef(1032) + ")";    // "Piercing"
                case DAMAGE_TYPE_SLASHING:                                  // 4
                    return sType + " (" + GetStringByStrRef(1033) + ")";    // "Slashing"
                case DAMAGE_TYPE_MAGICAL:                                   // 8
                    return GetStringByStrRef(85544);                        // "Damage Immunity Increased (magic)"
                case DAMAGE_TYPE_ACID:                                      // 16
                    return GetStringByStrRef(85545);                        // "Damage Immunity Increased (acid)"
                case DAMAGE_TYPE_COLD:                                      // 32
                    return GetStringByStrRef(85546);                        // "Damage Immunity Increased (cold)"
                case DAMAGE_TYPE_DIVINE:                                    // 64
                    return GetStringByStrRef(85547);                        // "Damage Immunity Increased (divine)"
                case DAMAGE_TYPE_ELECTRICAL:                                // 128
                    return GetStringByStrRef(85548);                        // "Damage Immunity Increased (electrical)"
                case DAMAGE_TYPE_FIRE:                                      // 256
                    return GetStringByStrRef(85549);                        // "Damage Immunity Increased (fire)"
                case DAMAGE_TYPE_NEGATIVE:                                  // 512
                    return GetStringByStrRef(85550);                        // "Damage Immunity Increased (negative)"
                case DAMAGE_TYPE_POSITIVE:                                  // 1024
                    return GetStringByStrRef(85551);                        // "Damage Immunity Increased (positive)"
                case DAMAGE_TYPE_SONIC:                                     // 2048
                    return GetStringByStrRef(85552);                        // "Damage Immunity Increased (sonic)"
            }
            return sType;
        }

        case EFFECT_TYPE_DAMAGE_IMMUNITY_DECREASE:      // 45
        {
            string sType = GetStringByStrRef(8061);     // "Damage Immunity Decreased"
            switch (GetEffectInteger(e, 0))
            {
                case DAMAGE_TYPE_BLUDGEONING:                               // 1
                    return sType + " (" + GetStringByStrRef(1031) + ")";    // "Bludgeoning"
                case DAMAGE_TYPE_PIERCING:                                  // 2
                    return sType + " (" + GetStringByStrRef(1032) + ")";    // "Piercing"
                case DAMAGE_TYPE_SLASHING:                                  // 4
                    return sType + " (" + GetStringByStrRef(1033) + ")";    // "Slashing"
                case DAMAGE_TYPE_MAGICAL:                                   // 8
                    return GetStringByStrRef(85553);                        // "Damage Immunity Decreased (magic)"
                case DAMAGE_TYPE_ACID:                                      // 16
                    return GetStringByStrRef(85554);                        // "Damage Immunity Decreased (acid)"
                case DAMAGE_TYPE_COLD:                                      // 32
                    return GetStringByStrRef(85555);                        // "Damage Immunity Decreased (cold)"
                case DAMAGE_TYPE_DIVINE:                                    // 64
                    return GetStringByStrRef(85556);                        // "Damage Immunity Decreased (divine)"
                case DAMAGE_TYPE_ELECTRICAL:                                // 128
                    return GetStringByStrRef(85557);                        // "Damage Immunity Decreased (electrical)"
                case DAMAGE_TYPE_FIRE:                                      // 256
                    return GetStringByStrRef(85558);                        // "Damage Immunity Decreased (fire)"
                case DAMAGE_TYPE_NEGATIVE:                                  // 512
                    return GetStringByStrRef(85559);                        // "Damage Immunity Decreased (negative)"
                case DAMAGE_TYPE_POSITIVE:                                  // 1024
                    return GetStringByStrRef(85560);                        // "Damage Immunity Decreased (positive)"
                case DAMAGE_TYPE_SONIC:                                     // 2048
                    return GetStringByStrRef(85561);                        // "Damage Immunity Decreased (sonic)"
            }
            return sType;
        }

        case EFFECT_TYPE_AC_INCREASE:                   // 46
            return GetStringByStrRef(8062);             // "AC Increased"

        case EFFECT_TYPE_AC_DECREASE:                   // 47
            return GetStringByStrRef(8063);             // "AC Decreased"

        case EFFECT_TYPE_MOVEMENT_SPEED_INCREASE:       // 48
            return GetStringByStrRef(8064);             // "Movement Speed Increased"

        case EFFECT_TYPE_MOVEMENT_SPEED_DECREASE:       // 49
            return GetStringByStrRef(8065);             // "Movement Speed Decreased"

        case EFFECT_TYPE_SAVING_THROW_INCREASE:         // 50
        {
            string sType = "";
            switch (GetEffectInteger(e, 1))
            {
                case SAVING_THROW_FORT:
                    sType = GetStringByStrRef(317) + " ";   // "Fortitude"
                    break;
                case SAVING_THROW_REFLEX:
                    sType = GetStringByStrRef(318) + " ";   // "Reflex"
                    break;
                case SAVING_THROW_WILL:
                    sType = GetStringByStrRef(319) + " ";   // "Will"
                    break;
            }
            return sType + GetStringByStrRef(8066);     // "Saving Throw Increased"
        }

        case EFFECT_TYPE_SAVING_THROW_DECREASE:         // 51
        {
            string sType = "";
            switch (GetEffectInteger(e, 1))
            {
                case SAVING_THROW_FORT:
                    sType = GetStringByStrRef(317) + " ";   // "Fortitude"
                    break;
                case SAVING_THROW_REFLEX:
                    sType = GetStringByStrRef(318) + " ";   // "Reflex"
                    break;
                case SAVING_THROW_WILL:
                    sType = GetStringByStrRef(319) + " ";   // "Will"
                    break;
            }
            return sType + GetStringByStrRef(8067);     // "Saving Throw Decreased"
        }

        case EFFECT_TYPE_SPELL_RESISTANCE_INCREASE:     // 52
            return GetStringByStrRef(8068);             // "Spell Resistance Increased"

        case EFFECT_TYPE_SPELL_RESISTANCE_DECREASE:     // 53
            return GetStringByStrRef(8069);             // "Spell Resistance Decreased"

        case EFFECT_TYPE_SKILL_INCREASE:                // 54
            return GetStringByStrRef(8070);             // "Skill Increased"

        case EFFECT_TYPE_SKILL_DECREASE:                // 55
            return GetStringByStrRef(8071);             // "Skill Decreased"

        case EFFECT_TYPE_INVISIBILITY:                  // 56
            return GetStringByStrRef(8072);             // "Invisible"

        case EFFECT_TYPE_GREATERINVISIBILITY:           // 57
            return GetStringByStrRef(8073);             // "Improved Invisible"

        case EFFECT_TYPE_DARKNESS:                      // 58
            return GetStringByStrRef(8074);             // "Darkness"

        case EFFECT_TYPE_DISPELMAGICALL:                // 59
            return GetStringByStrRef(8075);             // "Dispel Magic All"

        case EFFECT_TYPE_ELEMENTALSHIELD:               // 60
            return GetStringByStrRef(8076);             // "Magical Shield"

        case EFFECT_TYPE_NEGATIVELEVEL:                 // 61
            return GetStringByStrRef(8077);             // "Level Drained"

        case EFFECT_TYPE_POLYMORPH:                     // 62
            return GetStringByStrRef(8078);             // "Polymorphed"

        case EFFECT_TYPE_SANCTUARY:                     // 63
            return GetStringByStrRef(8079);             // "Sanctuary"

        case EFFECT_TYPE_TRUESEEING:                    // 64
            return GetStringByStrRef(8080);             // "True Seeing"

        case EFFECT_TYPE_SEEINVISIBLE:                  // 65
            return GetStringByStrRef(8081);             // "See Invisibility"

        case EFFECT_TYPE_TIMESTOP:                      // 66
            return GetStringByStrRef(8082);             // "Time Stop"

        case EFFECT_TYPE_BLINDNESS:                     // 67
            return GetStringByStrRef(8083);             // "Blind"

        case EFFECT_TYPE_SPELLLEVELABSORPTION:          // 68
            return GetStringByStrRef(8084);             // "Spell Level Absorption"

        case EFFECT_TYPE_DISPELMAGICBEST:               // 69
            return GetStringByStrRef(8085);             // "Dispel Magic Best"

        case EFFECT_TYPE_ULTRAVISION:                   // 70
            return GetStringByStrRef(6331);             // "Ultravision"

        case EFFECT_TYPE_MISS_CHANCE:                   // 71
            return "Miss Chance";

        case EFFECT_TYPE_CONCEALMENT:                   // 72
            return GetStringByStrRef(9001);             // "Concealed"

        case EFFECT_TYPE_SPELL_IMMUNITY:                // 73
            return GetStringByStrRef(86482);            // "Spell Immunity"

        case EFFECT_TYPE_SWARM:                         // 76
            return "Swarm";

        case EFFECT_TYPE_TURN_RESISTANCE_DECREASE:      // 77
            return "Turn Resistance Decrease";

        case EFFECT_TYPE_TURN_RESISTANCE_INCREASE:      // 78
            return "Turn Resistance Increase";

        case EFFECT_TYPE_PETRIFY:                       // 79
            return GetStringByStrRef(9002);             // "Petrified"

        case EFFECT_TYPE_CUTSCENE_PARALYZE:             // 80
            return GetStringByStrRef(8043);             // "Paralyzed"

        case EFFECT_TYPE_ETHEREAL:                      // 81
            return GetStringByStrRef(79876);            // "Ethereal"

        case EFFECT_TYPE_SPELL_FAILURE:                 // 82
            return GetStringByStrRef(83317);            // "Spell Failure"

        case EFFECT_TYPE_CUTSCENEGHOST:                 // 83
            return GetStringByStrRef(40897);            // "Ghost"

        case EFFECT_TYPE_CUTSCENEIMMOBILIZE:            // 84
            return GetStringByStrRef(2319);             // "Immobile"

        case EFFECT_TYPE_BARDSONG_SINGING:              // 85
            return GetStringByStrRef(40098);            // "The Singing Sword"

        case EFFECT_TYPE_HIDEOUS_BLOW:                  // 86
            return GetStringByStrRef(111970);           // "Hideous Blow"

        case EFFECT_TYPE_NWN2_DEX_ACMOD_DISABLE:        // 87
            return GetStringByStrRef(2968);             // "Disabled"

        case EFFECT_TYPE_DETECTUNDEAD:                  // 88
            return GetStringByStrRef(111525);           // "Detect Undead"

        case EFFECT_TYPE_SHAREDDAMAGE:                  // 89
            return GetStringByStrRef(111566);           // "Shield Other"

        case EFFECT_TYPE_ASSAYRESISTANCE:               // 90
            return GetStringByStrRef(111541);           // "Assay Resistance"

        case EFFECT_TYPE_DAMAGEOVERTIME:                // 91
            return "Hurting";

        case EFFECT_TYPE_ABSORBDAMAGE:                  // 92
            return "Damage Absorption";

        case EFFECT_TYPE_AMORPENALTYINC:                // 93
            return "Armor Check Penalty Increased";

        case EFFECT_TYPE_HEAL_ON_ZERO_HP:               // 95
            return GetStringByStrRef(186004);           // "Contingent Heal"

        case EFFECT_TYPE_MESMERIZE:                     // 97
            return "Mesmerized";

        case EFFECT_TYPE_BONUS_HITPOINTS:               // 99
            return GetStringByStrRef(718);              // "Bonus Hitpoints"

        case EFFECT_TYPE_JARRING:                       // 100
            return "Jarred";

        case EFFECT_TYPE_MAX_DAMAGE:                    // 101
            return "Maximized Damage";

        case EFFECT_TYPE_WOUNDING:                      // 102
            return GetStringByStrRef(86782);            // "Wounded"

        case EFFECT_TYPE_WILDSHAPE:                     // 103
            return "Wildshaped";

        case EFFECT_TYPE_RESCUE:                        // 105
            return GetStringByStrRef(185804);           // "Rescue"

        case EFFECT_TYPE_DETECT_SPIRITS:                // 106
            return GetStringByStrRef(185970);           // "Detect Spirits"

        case EFFECT_TYPE_DAMAGE_REDUCTION_NEGATED:      // 107
            return "Damage Reduction Negated";

        case EFFECT_TYPE_CONCEALMENT_NEGATED:           // 108
            return "Concealment Negated";

        case EFFECT_TYPE_INSANE:                        // 109
            return "Insane";

        case EFFECT_TYPE_HITPOINT_CHANGE_WHEN_DYING:    // 110
            return "Bleeding";
    }
    return "";
}
