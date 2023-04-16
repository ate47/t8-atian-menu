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

