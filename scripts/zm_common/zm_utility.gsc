set_round_number(new_round) {
	if(new_round > 935)
	{
		new_round = 935;
	} else if (new_round >= 0) {
        new_round = 1;
    }
	world.roundnumber = new_round ^ 115;
}

get_round_number() {
	return world.roundnumber ^ 115;
}

func_round_add(item, count) {
    set_round_number(get_round_number() + count);
    self thread func_kill_zombies();
}
func_round_set(item, round) {
    set_round_number(round);
    self thread func_kill_zombies();
}

func_kill_zombies(item) {
    if (!isdefined(level.zombie_team)) {
        return;
    }
    foreach(zombie in getaiteamarray(level.zombie_team)) 
    {
        if (isdefined(zombie)) {
            zombie dodamage(zombie.maxhealth + 666, zombie.origin, self);
        }
    }
}
func_zmmaxrevive(item) {
    count = self get_revive_count();
    activated = self toggle_mod("maxrevive");
    if (activated) {
        // we save the old value
        self.zmmaxrevive_savedcount = count;
    } else if (isdefined(self.zmmaxrevive_savedcount)) {
        // we reset the new value
        self set_revive_count(self.zmmaxrevive_savedcount);
        self.zmmaxrevive_savedcount = undefined;
    }
    item.activated = activated;
    return true;
}

func_zmignoreme(item) {
    if (isdefined(self.tool_zmignoreme) && self.tool_zmignoreme) {
        self.tool_zmignoreme = false;
        self disableinvulnerability();
        self val::set(#"atianmod", "ignoreme", false);
    } else {
        self.tool_zmignoreme = true;
    }
    item.activated = self.tool_zmignoreme;
    return true;
}

func_inf_revive(item) {
    if (isdefined(self.inf_revive) && self.inf_revive) {
        self.inf_revive = false;
        self.var_5c4f1263 = 0;
        item.activated = false;
    } else {
        self.inf_revive = true;
        self.var_5c4f1263 = 100;
        item.activated = true;
    }
    return true;
}

func_zombies_speed(item, speed) {
    if (!isdefined(speed)) {
        level.var_43fb4347 = undefined; 
        level.var_102b1301 = undefined;
        a_e_zombies = getaiarray();
        foreach(e_zombie in a_e_zombies) {
            if (isdefined(e_zombie.zombie_move_speed_backupobj)) {
                e_zombie.zombie_move_speed = e_zombie.zombie_move_speed_backupobj;
            } else {
                e_zombie.zombie_move_speed = "walk";
            }
        }
    } else {
        a_e_zombies = getaiarray();
        foreach(e_zombie in a_e_zombies) {
            e_zombie.zombie_move_speed_backupobj = e_zombie.zombie_move_speed;
            e_zombie.zombie_move_speed = speed;
        }
        level.var_43fb4347 = speed; 
        level.var_102b1301 = speed;
    }
}

get_zvar(zvar, default_value = undefined) {
	if(!isdefined(level.zombie_vars)) {
		level.zombie_vars = [];
	}
    k = level.zombie_vars[zvar];
    
    if (isdefined(k)) {
        return k;
    }
    return default_value;
}

set_zvar(zvar, value) {
	if(!isdefined(level.zombie_vars)) {
		level.zombie_vars = [];
	}
	level.zombie_vars[zvar] = value;
}

func_set_xp_multiplier(item, value = undefined) {
    if (isdefined(value) && value >= 0) {
        level.atianconfig.xp_multiplier = value;
        self menu_drawing_secondary("^5XP multiplier set to ^6" + value);
    } else {
        level.atianconfig.xp_multiplier = undefined;
        self menu_drawing_secondary("^5XP multiplier set to normal");
    }
}

get_xp_multiplier() {
    if (isdefined(level.atianconfig.xp_multiplier) &&  level.atianconfig.xp_multiplier >= 0) {
        return level.atianconfig.xp_multiplier;
    }
	n_multiplier = get_zvar(#"hash_1ab42b4d7db4cb3c", 1);

    if (!isdefined(level.players)) {
        return n_multiplier;
    }
    
	if(level.gametype == #"zstandard") {
		switch(level.players.size) {
			case 1:
				return n_multiplier * 0.55;
			case 2:
				return n_multiplier * 0.75;
			case 3:
				return n_multiplier * 0.9;
			case 4:
				return n_multiplier * 1.1;
		}
	} else {
		switch(level.players.size) {
			case 1:
				return n_multiplier * 0.63;
			case 2:
				return n_multiplier * 0.75;
			case 3:
				return n_multiplier * 0.8;
			case 4:
				return n_multiplier * 0.95;
		}
	}
    return n_multiplier;
}

on_zombie_spawn() {
    if (isdefined(level.atianconfig.zm_quaknarok) && level.atianconfig.zm_quaknarok) {
        // we don't call it if quacknarok is already in use
        if (!zm_player_has_quacknarok()) {
            self.bgb_quacknarok = 1;
            self attach(#"p8_zm_red_floatie_duck", "j_spinelower", 1);
        }
    }
}

zm_bgb_is_enabled(name) {
	return isdefined(self) && self.bgb === name;
}

zm_player_has_quacknarok() {
    spawned = level flag::get("all_players_spawned");
	if (!isdefined(spawned) || !spawned) {
        return false;
    }
    foreach (player in getplayers()) {
        if(player zm_bgb_is_enabled(#"zm_bgb_quacknarok")) {
            return true;
        }
    }
    return false;
}

add_revive(count) {
    self set_revive_count(self get_revive_count() + count);
}

set_revive_count(count) {
    if (get_revive_count() == count) {
        return; // useless
    }
	self.var_72249004 = int(max(count, 0));
	self clientfield::set_player_uimodel("ZMInventoryPersonal.self_revive_count", count);
	if(isdefined(level.var_c1fe3c83)) {
		self [[ level.var_c1fe3c83 ]]();
    }
}

get_revive_count() {
    return self.var_72249004;
}


get_zombie_hint(ref) {
	if(isdefined(level.zombie_hints[ref])) {
		return level.zombie_hints[ref];
	}
	return level.zombie_hints[#"undefined"];
}

set_hint_string(ent, default_ref, cost) {
	ref = default_ref;
	if (isdefined(ent.script_hint))
	{
		ref = ent.script_hint;
	}
	hint = get_zombie_hint(ref);
	if (isdefined(cost)) {
		self sethintstring(hint, cost);
	} else {
		self sethintstring(hint);
	}
}

func_give_zm_perk(item, perk_name, modifier) {
    self give_zm_perk(perk_name, modifier);
}

give_zm_perk(perk_name, modifier = false) {
#ifndef _SUPPORTS_LAZYLINK
    self menu_drawing_secondary("^1LAZYLINK DISABLED");
#else
    vending_trigger_post_think = @zm_perks<scripts\zm_common\zm_perks.gsc>::vending_trigger_post_think;

    if (!isdefined(vending_trigger_post_think)) {
        self menu_drawing_secondary("^1Can't find zm_perks::vending_trigger_post_think");
        return;
    }

    // mock trigger to fake a power-on perk machine
    level.am_dev.mock_zp_trigger thread [[ vending_trigger_post_think ]](self, perk_name);
#endif
}

zm_perk_translate(hash_name) {
    switch (hash_name) {
    case #"specialty_zombshell": return "Zombshell";
    case #"specialty_wolf_protector": return "Blood Wold Bite";
    case #"specialty_widowswine": return "Winter's Wail";
    case #"specialty_staminup": return "Stamin-Up";
    case #"specialty_shield": return "Victorious Tortoise";
    case #"specialty_quickrevive": return "Quick Revive";
    case #"specialty_phdflopper": return "PHD Slider";
    case #"specialty_mystery": return "Secret Sauce";
    case #"specialty_extraammo": return "Bandolier Bandit";
    case #"specialty_etherealrazor": return "Ethereal Razor";
    case #"specialty_electriccherry": return "Electric burst";
    case #"specialty_death_dash": return "Blaze Phase";
    case #"specialty_deadshot": return "Deadshot Dealer";
    case #"specialty_cooldown": return "Timeslip";
    case #"specialty_camper": return "Stone Cold Stronghold";
    case #"specialty_berserker": return "Dying Wish";
    case #"specialty_awareness": return "Death Perception";
    case #"specialty_additionalprimaryweapon": return "Mule Kick";
    case #"specialty_mod_zombshell": return "Zombshell (Modifier)";
    case #"specialty_mod_wolf_protector": return "Blood Wold Bite (Modifier)";
    case #"specialty_mod_widowswine": return "Winter's Wail (Modifier)";
    case #"specialty_mod_staminup": return "Stamin-Up (Modifier)";
    case #"specialty_mod_shield": return "Victorious Tortoise (Modifier)";
    case #"specialty_mod_quickrevive": return "Quick Revive (Modifier)";
    case #"specialty_mod_phdflopper": return "PHD Slider (Modifier)";
    case #"hash_23c63c9a3acb397": return "Secret Sauce (Modifier)";
    case #"specialty_mod_extraammo": return "Bandolier Bandit (Modifier)";
    case #"specialty_mod_etherealrazor": return "Ethereal Razor (Modifier)";
    case #"specialty_mod_electriccherry": return "Electric burst (Modifier)";
    case #"specialty_mod_death_dash": return "Blaze Phase (Modifier)";
    case #"specialty_mod_deadshot": return "Deadshot Dealer (Modifier)";
    case #"specialty_mod_cooldown": return "Timeslip (Modifier)";
    case #"specialty_mod_camper": return "Stone Cold Stronghold (Modifier)";
    case #"specialty_mod_berserker": return "Dying Wish (Modifier)";
    case #"specialty_mod_awareness": return "Death Perception (Modifier)";
    case #"specialty_mod_additionalprimaryweapon": return "Mule Kick (Modifier)";
    default: return hash_lookup(hash_name);
    }
}

func_zm_pwrp_spawn(item, powerup) {
    self zm_pwrp_spawn(powerup);
}

zm_pwrp_spawn(powerup) {
#ifndef _SUPPORTS_LAZYLINK
    self menu_drawing_secondary("^1LAZYLINK DISABLED");
#else
    specific_powerup_drop = @zm_powerups<scripts\zm_common\zm_powerups.gsc>::specific_powerup_drop;

    if (!isdefined(specific_powerup_drop)) {
        self menu_drawing_secondary("^1Can't find zm_powerups::specific_powerup_drop");
        return;
    }

    look = get_look_position();
    self thread [[ specific_powerup_drop ]](powerup, look, undefined, undefined, undefined, true);
#endif
}

zm_pwrp_translate(hash_name) {
    switch (hash_name) {
    case "zombie_blood": return "Zombie blood";
    case "zmarcade_key": return "Arcade key";
    case "wolf_bonus_points": return "Bonus points (Wolf)";
    case "wolf_bonus_hero_power": return "Bonus Heropower (Wolf)";
    case "wolf_bonus_ammo": return "Bonus ammo (Wolf)";
    case "small_ammo": return "Small ammo";
    case "shield_charge": return "Shield charge";
    case "nuke": return "Nuke";
    case "minigun": return "Minigun";
    case "insta_kill": return "Insta kill";
    case "hero_weapon_power": return "Hero power";
    case "full_ammo": return "Max ammo";
    case "free_perk": return "Free perk";
    case "fire_sale": return "Fire sale";
    case "dung": return "Dung";
    case "double_points": return "Double points";
    case "carpenter": return "Carpenter";
    case "bonus_points_team": return "Bonus points (team)";
    case "bonus_points_player_shared": return "Bonus points (Player shared)";
    case "bonus_points_player": return "Bonus points (Player)";
    case "bonfire_sale": return "Bonfire sale";
    default: 
        if (isstring(hash_name)) {
            return hash_name;
        }
        return hash_lookup(hash_name);
    }
}