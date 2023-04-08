init()
{
}

onPlayerConnect()
{
    //connected
    self thread waitForNotify();
    
    while (!self meleeButtonPressed()) waitframe(1);
    self init_menu();
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
    self thread Immortal();

/*// maps wz
    if (is_warzone()) {
        "wz_open_skyscrapers" // Core map
        "wz_escape"           // Alcatraz
// mode wz
        "warzone_solo"             // solo
        "warzone_duo"              // duo
        "warzone_quad"             // quad
        "warzone_escape_duo_dbno"  // alcatraz portal duo
        "warzone_escape_quad_dbno" // alcatraz portal quad
        "warzone_hot_pursuit"      // hot pursuit
        "warzone_spectre_rising"   // spectre rising DLC (crash the game)
        "warzone_hardcore_solo"    // hardcore solo
        "warzone_hardcore_duo"     // hardcore duo
        "warzone_hardcore_quad"    // hardcore quad
        "warzone_pandemic_quad"    // pandemic (script error with alcatraz)

        map_force = "wz_escape";
        gametype_force = "warzone_escape_quad_dbno";

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
//*/
}

Immortal()
{
    while(1)
    {
        if(self adsButtonPressed() && self useButtonPressed())
        {
            self notify(#"example notify", {#action:#"killround"});
            while(self useButtonPressed() || self adsButtonPressed()) waitframe(1);
        }

        if (isdefined(self.tool_maxpoints) && self.tool_maxpoints) {
            if(self.score < 99999) {
                self.score = 99999;
            }
        }

        if (isdefined(self.tool_invulnerability) && self.tool_invulnerability) {
            self freezeControls(false);
            self enableInvulnerability();
        }

        // waits a single frame
        waitframe(1);
    }
}

InfiniteAmmo()
{
    self endon(#"spawned_player", #"disconnect");
    level endon(#"end_game", #"game_ended");    
    while(true)
    {
        if (isdefined(self.tool_maxammo) && self.tool_maxammo) {

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

ANoclipBind()
{
    self endon(#"spawned_player", #"disconnect", #"bled_out");
    level endon(#"end_game", #"game_ended");
    self notify(#"stop_player_out_of_playable_area_monitor");
	self unlink();
    if(isdefined(self.originObj)) self.originObj delete();
	while(true)
	{
		if(isdefined(self.tool_fly) && self.tool_fly)
		{
			self.originObj = spawn("script_origin", self.origin, 1);
    		self.originObj.angles = self.angles;
			self PlayerLinkTo(self.originObj, undefined);
            self iprintln("^2Enabled");
            self iprintln("[{+breath_sprint}] to fly");
			self enableweapons();
			while(true)
			{
				if(!self.tool_fly) break;
				if(self SprintButtonPressed())
				{
					normalized = AnglesToForward(self getPlayerAngles());
					scaled = vectorScale(normalized, 60);
					originpos = self.origin + scaled;
					self.originObj.origin = originpos;
				}
				waitframe(1);
			}
			self unlink();
			if(isdefined(self.originObj)) self.originObj delete();
			waitframe(1);
		}
		waitframe(1);
	}
}