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

func_round_add(count) {
    set_round_number(get_round_number() + count);
    self thread func_kill_zombies();
}
func_round_set(round) {
    set_round_number(round);
    self thread func_kill_zombies();
}

func_kill_zombies() {
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