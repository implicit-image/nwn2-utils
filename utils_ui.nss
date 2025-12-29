// utils_ui.nss :: utility functions for ui (moslty data retrieval and display).

string GetSavingThrowName(int iSave);

string GetAlignmentName(int iLC, int iGE);

string GetEffectStringDescription(effect e);
//==================================== implementation ====================================

// Get human readable saving throw name
// - iSave SAVING_THROW_* constant
// * Returns human readable name for iSave.
string GetSavingThrowName(int iSave)
{
    switch(iSave)
    {
        case SAVING_THROW_FORT: return "Fortitude";
        case SAVING_THROW_REFLEX: return "Reflex";
        case SAVING_THROW_WILL: return "Will";
    }
    return "";
}

// Get human readable name for given alignment values
// - iLC value on Law-Chaos axis
// - iGE value on Good-Evil axis
// * Returns human readable name
string GetAlignmentName(int iLC, int iGE)
{
    string sAlignment = "";
    switch (iLC)
    {
        case ALIGNMENT_CHAOTIC: { sAlignment = "Chaotic"; break; }
        case ALIGNMENT_NEUTRAL: { sAlignment = "Neutral"; break; }
        case ALIGNMENT_LAWFUL: { sAlignment = "Lawful"; break; }
    }

    switch (iGE)
    {
        case ALIGNMENT_EVIL: { sAlignment += " Evil"; break; }
        case ALIGNMENT_NEUTRAL:
        {
            sAlignment += " Neutral";
            if (iLC == ALIGNMENT_NEUTRAL)
            {
                sAlignment = "True Neutral";
            }
            break;
        }
        case ALIGNMENT_GOOD: { sAlignment += " Good"; break; }
    }
    return sAlignment;
}

// Gets a description for the given effect.
// - e effect to describe
// * Returns human readable description
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

