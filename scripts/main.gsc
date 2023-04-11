init()
{
}

onPlayerConnect()
{
    //connected
    self thread waitForNotify();
}

waitForNotify()
{
    self endon(#"disconnect");
    while(true)
    {
        result = self waittill(#"example notify");
        if(!isdefined(result.action)) continue;
        if(result.action == #"killround")
        {
            level.zombie_total = 0;
            foreach(ai in getaiteamarray(level.zombie_team)) ai kill();
            self iprintln(level.tutorial.var);
        }
    }
}

onPlayerSpawned()
{
    // notice how endon now takes variadic parameters
    self endon(#"disconnect", #"spawned_player");
    level endon(#"end_game", #"game_ended");

    self thread InfiniteAmmo();
    self thread ANoclipBind();
    self thread MainRunner();
    self thread GunModifier();

    self.atianconfig = spawnstruct();
    self.atianconfig AtianMenuConfig();

    if (is_warzone()) {
        if (isdefined(self.force_blackout_gametype)) {
            gametype_force = self.force_blackout_gametype;
        } else {
            gametype_force = level.gametype;
        }
        if (isdefined(self.force_blackout_map)) {
            map_force = self.force_blackout_gametype;
        } else {
            map_force = util::get_map_name();
        }

        if (util::get_map_name() != map_force || level.gametype != gametype_force) {
            // we need to wait before loading the other map
            wait(10);
            self iPrintLn("loading " + map_force + "/" + gametype_force);

            switchmap_load(map_force, gametype_force);
            wait(1);
            switchmap_switch();
            return;
        }
    }

    while (!self meleeButtonPressed()) waitframe(1);
    self init_menu();
}
