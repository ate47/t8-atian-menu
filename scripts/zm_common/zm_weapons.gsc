func_give_zm_melee(item, melee) {
#ifndef _SUPPORTS_LAZYLINK
    // fallback to default implementation
    self func_give_weapon(item, melee);
#else
    award_melee_weapon = @zm_melee_weapon<scripts\zm_common\zm_melee_weapon.gsc>::award_melee_weapon;

    if (!isdefined(award_melee_weapon)) {
        self iPrintLnBold("^1Can't find zm_melee_weapon::award_melee_weapon");
        return;
    }

    self [[ award_melee_weapon ]](melee);
#endif
}