#include "x2_inc_itemprop"


//================================================ Declarations =================

string ItemPropertyToString(itemproperty ipProp);

itemproperty ItemPropertyFromString(string sIPStringRepr);

//=============================================== Implementation ================

// code taken from jallaix's jx_inc_data_func.nss
string ItemPropertyToString(itemproperty ipProp)
{
    int iIPType = GetItemPropertyType(ipProp);

    //catch unrepresentable types
    if ((iIPType == ITEM_PROPERTY_MIND_BLANK)
        || (iIPType == ITEM_PROPERTY_ON_MONSTER_HIT))
        return "";

    int iIPSubType = GetItemPropertySubType(ipProp);
    int iIPParam1Value = GetItemPropertyParam1Value(ipProp);
    int iIPCostTableValue = GetItemPropertyCostTableValue(ipProp);

    string sItemProperty = IntToString(iIPType);

    // Sub-type
    if ((iIPType == ITEM_PROPERTY_BONUS_FEAT)
     || (iIPType == ITEM_PROPERTY_IMMUNITY_MISCELLANEOUS)
     || (iIPType == ITEM_PROPERTY_IMMUNITY_SPELL_SCHOOL)
     || (iIPType == ITEM_PROPERTY_USE_LIMITATION_ALIGNMENT_GROUP)
     || (iIPType == ITEM_PROPERTY_USE_LIMITATION_CLASS)
     || (iIPType == ITEM_PROPERTY_USE_LIMITATION_RACIAL_TYPE)
     || (iIPType == ITEM_PROPERTY_USE_LIMITATION_SPECIFIC_ALIGNMENT)
     || (iIPType == ITEM_PROPERTY_SPECIAL_WALK)
     || (iIPType == ITEM_PROPERTY_VISUALEFFECT))
        sItemProperty += "," + IntToString(iIPSubType);
    else
    // Cost table value
    if ((iIPType == ITEM_PROPERTY_AC_BONUS)
     || (iIPType == ITEM_PROPERTY_ENHANCEMENT_BONUS)
     || (iIPType == ITEM_PROPERTY_DECREASED_ENHANCEMENT_MODIFIER)
     || (iIPType == ITEM_PROPERTY_BASE_ITEM_WEIGHT_REDUCTION)
     || (iIPType == ITEM_PROPERTY_DECREASED_DAMAGE)
     || (iIPType == ITEM_PROPERTY_ENHANCED_CONTAINER_REDUCED_WEIGHT)
     || (iIPType == ITEM_PROPERTY_EXTRA_MELEE_DAMAGE_TYPE)
     || (iIPType == ITEM_PROPERTY_EXTRA_RANGED_DAMAGE_TYPE)
     || (iIPType == ITEM_PROPERTY_SPELL_RESISTANCE)
     || (iIPType == ITEM_PROPERTY_REGENERATION)
     || (iIPType == ITEM_PROPERTY_IMMUNITY_SPECIFIC_SPELL)
     || (iIPType == ITEM_PROPERTY_THIEVES_TOOLS)
     || (iIPType == ITEM_PROPERTY_ATTACK_BONUS)
     || (iIPType == ITEM_PROPERTY_DECREASED_ATTACK_MODIFIER)
     || (iIPType == ITEM_PROPERTY_UNLIMITED_AMMUNITION)
     || (iIPType == ITEM_PROPERTY_REGENERATION_VAMPIRIC)
     || (iIPType == ITEM_PROPERTY_BONUS_HITPOINTS)
     || (iIPType == ITEM_PROPERTY_TURN_RESISTANCE)
     || (iIPType == ITEM_PROPERTY_MASSIVE_CRITICALS)
     || (iIPType == ITEM_PROPERTY_MONSTER_DAMAGE)
     || (iIPType == ITEM_PROPERTY_HEALERS_KIT)
     || (iIPType == ITEM_PROPERTY_ARCANE_SPELL_FAILURE)
     || (iIPType == ITEM_PROPERTY_MIGHTY))
        sItemProperty += "," + IntToString(iIPCostTableValue);
    else
    // Cost table value + 1
    if (iIPType == ITEM_PROPERTY_IMMUNITY_SPELLS_BY_LEVEL)
        sItemProperty += "," + IntToString(iIPCostTableValue + 1);
    else
    // Param1 value
    if (iIPType == ITEM_PROPERTY_WEIGHT_INCREASE)
        sItemProperty += "," + IntToString(iIPParam1Value);
    else
    // Sub-type + Cost table value
    if ((iIPType == ITEM_PROPERTY_ABILITY_BONUS)
     || (iIPType == ITEM_PROPERTY_AC_BONUS_VS_ALIGNMENT_GROUP)
     || (iIPType == ITEM_PROPERTY_AC_BONUS_VS_DAMAGE_TYPE)
     || (iIPType == ITEM_PROPERTY_AC_BONUS_VS_RACIAL_GROUP)
     || (iIPType == ITEM_PROPERTY_AC_BONUS_VS_SPECIFIC_ALIGNMENT)
     || (iIPType == ITEM_PROPERTY_ENHANCEMENT_BONUS_VS_ALIGNMENT_GROUP)
     || (iIPType == ITEM_PROPERTY_ENHANCEMENT_BONUS_VS_SPECIFIC_ALIGNEMENT)
     || (iIPType == ITEM_PROPERTY_ENHANCEMENT_BONUS_VS_RACIAL_GROUP)
     || (iIPType == ITEM_PROPERTY_BONUS_SPELL_SLOT_OF_LEVEL_N)
     || (iIPType == ITEM_PROPERTY_CAST_SPELL)
     || (iIPType == ITEM_PROPERTY_DAMAGE_BONUS)
     || (iIPType == ITEM_PROPERTY_IMMUNITY_DAMAGE_TYPE)
     || (iIPType == ITEM_PROPERTY_DAMAGE_RESISTANCE)
     || (iIPType == ITEM_PROPERTY_DAMAGE_VULNERABILITY)
     || (iIPType == ITEM_PROPERTY_DECREASED_ABILITY_SCORE)
     || (iIPType == ITEM_PROPERTY_DECREASED_AC)
     || (iIPType == ITEM_PROPERTY_DECREASED_SKILL_MODIFIER)
     || (iIPType == ITEM_PROPERTY_SAVING_THROW_BONUS)
     || (iIPType == ITEM_PROPERTY_SAVING_THROW_BONUS_SPECIFIC)
     || (iIPType == ITEM_PROPERTY_DECREASED_SAVING_THROWS)
     || (iIPType == ITEM_PROPERTY_DECREASED_SAVING_THROWS_SPECIFIC)
     || (iIPType == ITEM_PROPERTY_SKILL_BONUS)
     || (iIPType == ITEM_PROPERTY_ATTACK_BONUS_VS_ALIGNMENT_GROUP)
     || (iIPType == ITEM_PROPERTY_ATTACK_BONUS_VS_RACIAL_GROUP)
     || (iIPType == ITEM_PROPERTY_ATTACK_BONUS_VS_SPECIFIC_ALIGNMENT)
     || (iIPType == ITEM_PROPERTY_TRAP))
        sItemProperty += "," + IntToString(iIPSubType) + "," + IntToString(iIPCostTableValue);
    else
    // Sub-type + Cost table value + 1
    if (iIPType == ITEM_PROPERTY_ONHITCASTSPELL)
        sItemProperty += "," + IntToString(iIPSubType) + "," + IntToString(iIPCostTableValue + 1);
    else
    // Cost table value + Param1 value
    if (iIPType == ITEM_PROPERTY_LIGHT)
        sItemProperty += "," + IntToString(iIPCostTableValue) + "," + IntToString(iIPParam1Value);
    else
    // Sub-type + Cost table value + Param1 value
    if (iIPType == ITEM_PROPERTY_ON_HIT_PROPERTIES)
        sItemProperty += "," + IntToString(iIPSubType) + "," + IntToString(iIPCostTableValue) + "," + IntToString(iIPParam1Value);
    else
    // Sub-type + Param1 value + Cost table value
    if ((iIPType == ITEM_PROPERTY_DAMAGE_BONUS_VS_ALIGNMENT_GROUP)
     || (iIPType == ITEM_PROPERTY_DAMAGE_BONUS_VS_RACIAL_GROUP)
     || (iIPType == ITEM_PROPERTY_DAMAGE_BONUS_VS_SPECIFIC_ALIGNMENT))
        sItemProperty += "," + IntToString(iIPSubType) + "," + IntToString(iIPParam1Value) + "," + IntToString(iIPCostTableValue);
    // No parameter required
    /*
    else
    if ((iIPType == ITEM_PROPERTY_DARKVISION)
     || (iIPType == ITEM_PROPERTY_HASTE)
     || (iIPType == ITEM_PROPERTY_HOLY_AVENGER)
     || (iIPType == ITEM_PROPERTY_IMPROVED_EVASION)
     || (iIPType == ITEM_PROPERTY_KEEN)
     || (iIPType == ITEM_PROPERTY_NO_DAMAGE)
     || (iIPType == ITEM_PROPERTY_TRUE_SEEING)
     || (iIPType == ITEM_PROPERTY_FREEDOM_OF_MOVEMENT)) {}
    */

    // Item properties that don't exist
    /*
      ITEM_PROPERTY_DAMAGE_REDUCTION_DEPRECATED : deprecated !
      25 (Dancing Weapon) : not implemented
      30 (Double Stack) : not implemented
      31 (Enhanced Container Bonus Slot) : not implemented
      42 (unknown value) : not implemented
      68 (Vorpal) : not implemented (now On Hit subtype)
      69 (Wounding) : not implemented
      ITEM_PROPERTY_POISON : not implemented (now a On Hit subtype)
      ITEM_PROPERTY_DAMAGE_REDUCTION : ItemPropertyDamageReduction() is bugged and the property is never returned by GetFirst/NextItemProperty
                                       Currently = 85 (Arrow Catching), should be 90)
      86 (Bashing) : not implemented
      87 (Animated) : not implemented
      88 (Wild) : not implemented
      89 (Etherealness) : not implemented
      90 (Damage Reduction) : not implemented
    */

    return sItemProperty;

}

// itemproperty ItemPropertyFromString(string sIPStringRepr)
// {

// }
