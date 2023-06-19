
on_wz_zombie_spawn() {
    self.am_noted = 1;
    if (isdefined(level.atianconfig.backout_zombies_eyes)) {
        color_id = wz_set_zombies_eyes_color_title(level.atianconfig.backout_zombies_eyes);
        // delay the call to bypass the default implementation
        self thread wz_zombie_eye_glow_delay(color_id);
    }
}

func_wz_set_zombies_eyes_color(item, color_id) {
    wz_set_zombies_eyes_color(color_id);
}

wz_set_zombies_eyes_color(color_id) {
    level.atianconfig.backout_zombies_eyes = color_id;
    if (!isdefined(level.var_5b357434)) {
        self debugln("^1No ai zones, fail");
        return; // no ai zone yet, wtf?
    }//ai_zones
    if (isString(color_id) || isHash(color_id)) {
        color_id = wz_set_zombies_eyes_color_title(color_id);
    }

    foreach(ai_zone in level.var_5b357434) {
        // set the new zombies' color for the ai zones
        ai_zone.var_80bea5a6 = wz_zombie_eye_glow_rainbow(color_id);
    }

    
    all_ai = getaiteamarray(#"world");
    if (!isdefined(all_ai)) {
        return;
    }

    foreach (ai in all_ai) {
        if (isalive(ai)) {
            // set the zombies' color for the alive one
            ai thread wz_zombie_eye_glow(color_id);
        }
    }
}

wz_zombie_eye_glow_rainbow(color_id) {
    if (color_id == #"random") {
        return randomIntRange(1, 4);
    }
    return color_id;
}

wz_zombie_eye_glow_delay(color_id) {
	self endon(#"death");
	if(isdefined(self.in_the_ground) && self.in_the_ground || (isdefined(self.in_the_ceiling) && self.in_the_ceiling)) {
		while(!isdefined(self.create_eyes)) {
			wait(0.1);
		}
	} else {
		wait(0.5);
	}
    wait 0.1;
	self wz_zombie_eye_glow(color_id);
}

wz_zombie_eye_glow(color_id) {
	if(!isdefined(self) || !isactor(self)) {
		return;
	}
	self clientfield::set("zombie_has_eyes_col", wz_zombie_eye_glow_rainbow(color_id));
}

wz_set_zombies_eyes_color_title(color_title) {
    if (!ishash(color_title)) {
        color_title = hash(color_title);
    }
    switch (color_title) {
        case #"blue":
            return 2;
        case #"green":
            return 3;
        case #"clear":
            return 0;
        case #"random":
            return #"random";
        default:
            return 1;
    }
}