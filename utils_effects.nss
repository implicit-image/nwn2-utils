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
            break
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
