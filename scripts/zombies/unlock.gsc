func_unlock_all(item) {
    thread unlock_all(self);
    return true;
}

unlock_all(player) {
    if ((isdefined(player.am_unlockall_running) && player.am_unlockall_running) || !isdefined(level.zombie_weapons)) {
        return;
    }

    player endon_callback(&player_unlock_all_off, #"disconnect", #"spawned_player");
    level endon(#"end_game", #"game_ended");

    for (tableid = 0; tableid < 6; tableid++) {
	    tablename = #"gamedata/stats/zm/statsmilestones" + tableid + ".csv";
        rows = tablelookuprowcount(tablename);
        columns = tablelookupcolumncount(tablename);

        

       //for (row = 0; row < rows; row++) {
       //    

       //}

        // value = int(tablelookup(tablename, 0, value, 2));
        // type = tablelookup(tablename, 0, value, 3);
        // name = tablelookup(tablename, 0, value, 4);
    }
    return;
    player.am_unlockall_running = true;
    
    foreach(weapon in level.zombie_weapons) {
        if(isdefined(weapon.weapon.name)) {
            player addweaponstat(weapon.weapon, #"kills", 5000);
            player addweaponstat(weapon.weapon, #"headshots", 5000);
            player addweaponstat(weapon.weapon, #"allperkkills", 5000);
            player addweaponstat(weapon.weapon, #"noperkkills", 5000);
            player addweaponstat(weapon.weapon, #"packedkills", 5000);
            player addweaponstat(weapon.weapon, #"heavykills", 5000);
            player addweaponstat(weapon.weapon, #"minibosskills", 5000);
            player addweaponstat(weapon.weapon, #"verminkills", 5000);
            player addweaponstat(weapon.weapon, #"crawlerkills", 5000);
            player addweaponstat(weapon.weapon, #"instakills", 5000);
            player addweaponstat(weapon.weapon, #"hash_657e22dcdd18da77", 5000); // pop shocks
            player iprintlnbold("^5Camo unlocked for ^6" + hash_lookup(weapon.weapon.name));
            waitframe(1);
        }
    }
    player.am_unlockall_running = false;
}

player_unlock_all_off() {
    if (isdefined(self.am_unlockall_running) && self.am_unlockall_running) {
        self.am_unlockall_running = false;
    }
}