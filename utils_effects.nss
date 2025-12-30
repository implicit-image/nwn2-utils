#include "utils_types"
#include "utils_stringify"
#include "utils_array"


string GetEffectString(effect e);

effect UXEffectLink3Effects(effect e1, effect e2, effect e3);

effect UXEffectLink4Effects(effect e1, effect e2, effect e3, effect e4);

effect UXEffectLink5Effects(effect e1, effect e2, effect e3, effect e4, effect e5);

effect UXEffectLink6Effects(effect e1, effect e2, effect e3, effect e4, effect e5, effect e6);

effect UXEffectLink7Effects(effect e1, effect e2, effect e3, effect e4, effect e5, effect e6, effect e7);

effect UXEffectLink8Effects(effect e1, effect e2, effect e3, effect e4, effect e5, effect e6, effect e7, effect e8);

effect UXEffectLink9Effects(effect e1, effect e2, effect e3, effect e4, effect e5, effect e6, effect e7, effect e8, effect e9);

effect UXEffectLink10Effects(effect e1, effect e2, effect e3, effect e4, effect e5, effect e6, effect e7, effect e8, effect e9, effect e10);

//========================================= implementation =======================================

// Link 3 effects
// - e(1-3) effects to link
// * Returns an effect link with e1 as the parent
effect UXEffectLink3Effects(effect e1, effect e2, effect e3)
{
    e1 = EffectLinkEffects(e1, e2);
    e1 = EffectLinkEffects(e1, e3);
    return e1;
}

// Link 4 effects
// - e(1-4) effects to link
// * Returns an effect link with e1 as the parent
effect UXEffectLink4Effects(effect e1, effect e2, effect e3, effect e4)
{
    e1 = EffectLinkEffects(e1, e2);
    e1 = EffectLinkEffects(e1, e3);
    e1 = EffectLinkEffects(e1, e4);
    return e1;
}

// Link 5 effects
// - e(1-5) effects to link
// * Returns an effect link with e1 as the parent
effect UXEffectLink5Effects(effect e1, effect e2, effect e3, effect e4, effect e5)
{
    e1 = EffectLinkEffects(e1, e2);
    e1 = EffectLinkEffects(e1, e3);
    e1 = EffectLinkEffects(e1, e4);
    e1 = EffectLinkEffects(e1, e5);
    return e1;
}

// Link 6 effects
// - e(1-6) effects to link
// * Returns an effect link with e1 as the parent
effect UXEffectLink6Effects(effect e1, effect e2, effect e3, effect e4, effect e5, effect e6)
{
    e1 = EffectLinkEffects(e1, e2);
    e1 = EffectLinkEffects(e1, e3);
    e1 = EffectLinkEffects(e1, e4);
    e1 = EffectLinkEffects(e1, e5);
    e1 = EffectLinkEffects(e1, e6);
    return e1;
}

// Link 7 effects
// - e(1-7) effects to link
// * Returns an effect link with e1 as the parent
effect UXEffectLink7Effects(effect e1, effect e2, effect e3, effect e4, effect e5, effect e6, effect e7)
{
    e1 = EffectLinkEffects(e1, e2);
    e1 = EffectLinkEffects(e1, e3);
    e1 = EffectLinkEffects(e1, e4);
    e1 = EffectLinkEffects(e1, e5);
    e1 = EffectLinkEffects(e1, e6);
    e1 = EffectLinkEffects(e1, e7);
    return e1;
}

// Link 8 effects
// - e(1-8) effects to link
// * Returns an effect link with e1 as the parent
effect UXEffectLink8Effects(effect e1, effect e2, effect e3, effect e4, effect e5, effect e6, effect e7, effect e8)
{
    e1 = EffectLinkEffects(e1, e2);
    e1 = EffectLinkEffects(e1, e3);
    e1 = EffectLinkEffects(e1, e4);
    e1 = EffectLinkEffects(e1, e5);
    e1 = EffectLinkEffects(e1, e6);
    e1 = EffectLinkEffects(e1, e7);
    e1 = EffectLinkEffects(e1, e8);
    return e1;
}

// Link 9 effects
// - e(1-9) effects to link
// * Returns an effect link with e1 as the parent
effect UXEffectLink9Effects(effect e1, effect e2, effect e3, effect e4, effect e5, effect e6, effect e7, effect e8, effect e9)
{
    e1 = EffectLinkEffects(e1, e2);
    e1 = EffectLinkEffects(e1, e3);
    e1 = EffectLinkEffects(e1, e4);
    e1 = EffectLinkEffects(e1, e5);
    e1 = EffectLinkEffects(e1, e6);
    e1 = EffectLinkEffects(e1, e7);
    e1 = EffectLinkEffects(e1, e8);
    e1 = EffectLinkEffects(e1, e9);
    return e1;
}

// Link 10 effects
// - e(1-10) effects to link
// * Returns an effect link with e1 as the parent
effect UXEffectLink10Effects(effect e1, effect e2, effect e3, effect e4, effect e5, effect e6, effect e7, effect e8, effect e9, effect e10)
{
    e1 = EffectLinkEffects(e1, e2);
    e1 = EffectLinkEffects(e1, e3);
    e1 = EffectLinkEffects(e1, e4);
    e1 = EffectLinkEffects(e1, e5);
    e1 = EffectLinkEffects(e1, e6);
    e1 = EffectLinkEffects(e1, e7);
    e1 = EffectLinkEffects(e1, e8);
    e1 = EffectLinkEffects(e1, e9);
    e1 = EffectLinkEffects(e1, e10);
    return e1;
}
