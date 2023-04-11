
InfiniteAmmo() {
    self endon(#"spawned_player", #"disconnect");
    level endon(#"end_game", #"game_ended");    
    while(true)
    {
        if (is_mod_activated("maxammo")) {
            weapon  = self GetCurrentWeapon();
            offhand = self GetCurrentOffhand();
            if(!(!isdefined(weapon) || weapon === level.weaponNone || !isdefined(weapon.clipSize) || weapon.clipSize < 1))
            {
                self SetWeaponAmmoClip(weapon, 1337);
                self givemaxammo(weapon);
                self givemaxammo(offhand);
                self gadgetpowerset(2, 100);
                self gadgetpowerset(1, 100);
                self gadgetpowerset(0, 100);
            }
            if(isdefined(offhand) && offhand !== level.weaponNone) self givemaxammo(offhand);
        }
        // waittill now returns a variable
        result = self waittill(#"weapon_fired", #"grenade_fire", #"missile_fire", #"weapon_change", #"melee");
    }
}