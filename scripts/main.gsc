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

    self.atianconfig = level.atianconfig;
    atianconfig = self.atianconfig;

    self.atianconfig_no_menu = false; //(isdefined(atianconfig.only_host) && atianconfig.only_host && !self IsHost()) || (isdefined(atianconfig.no_menu) && atianconfig.no_menu);

    self thread InfiniteAmmo();
    self thread ANoclipBind();
    self thread MainRunner();
    self thread GunModifier();

    if (is_warzone()) {
        if (isdefined(atianconfig.force_blackout_gametype)) {
            gametype_force = atianconfig.force_blackout_gametype;
        } else {
            gametype_force = level.gametype;
        }
        if (isdefined(atianconfig.force_blackout_map)) {
            map_force = atianconfig.force_blackout_map;
        } else {
            map_force = util::get_map_name();
        }

        if (isdefined(atianconfig.character_skin)) {
            skins = strtok(atianconfig.character_skin, ";");
            mode_skin = get_characters_for_mode();
            if (isdefined(mode_skin)) {
                for (i = 0; i < skins.size; i++) {
                    if (skins[i] == "random") {
                        self SetSkin(randomint(mode_skin.size) + 1);
                        break;
                    } else {
                        // 0NAME:1OUTFIT:2PALETTE:3WARPAINT:4DECAL
                        modifiers = strtok(skins[i], ":");
                        skin_id = array::find(mode_skin, modifiers[0]);
                        if (isdefined(skin_id)) {
                            self SetSkin(skin_id);
                            if (modifiers.size > 1) { // 1OUTFIT
                                self setcharacteroutfit(int(modifiers[1]));
                                if (modifiers.size > 2) { // 2PALETTE
                                    self function_ab96a9b5("palette", int(modifiers[2]));
                                    if (modifiers.size > 3) { // 3WARPAINT
                                        self function_ab96a9b5("warpaint", int(modifiers[3]));
                                        if (modifiers.size > 4) { // 4DECAL
                                            self function_ab96a9b5("decal", int(modifiers[4]));
                                        }
                                    }
                                }
                            }
                            break;
                        }
                    }
                }
            }
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
    if (self.atianconfig_no_menu) {
        return;
    }
    while (!self meleeButtonPressed()) waitframe(1);
    self init_menu();
}
