function on_zm_zombie_spawn() {
    self.am_noted = 1;
    if (isdefined(level.atianconfig.zombies_eyes)) {
        color_id = zm_set_zombies_eyes_color_title(level.atianconfig.zombies_eyes);
        // delay the call to bypass the default implementation
        self thread zm_zombie_eye_glow_delay(color_id);
    }
}

function func_zm_set_zombies_eyes_color(item, color_id) {
    zm_set_zombies_eyes_color(color_id);
}

function zm_set_zombies_eyes_color(color_id) {
    level.atianconfig.zombies_eyes = color_id;
    
    all_ai = getaiteamarray(#"world");
    if (isdefined(all_ai)) {
        foreach (ai in all_ai) {
            if (isalive(ai)) {
                // set the zombies' color for the alive one
                ai thread zm_zombie_eye_glow(color_id);
            }
        }
    }
}

function zm_zombie_eye_glow_rainbow(color_id) {
    if (color_id == #"random") {
        return randomintrange(1, 5);
    }
    return color_id;
}

function zm_zombie_eye_glow_delay(color_id) {
	self endon(#"death");
	if(isdefined(self.in_the_ground) && self.in_the_ground || (isdefined(self.in_the_ceiling) && self.in_the_ceiling)) {
		while(!isdefined(self.create_eyes)) {
			wait(0.1);
		}
	} else {
		wait(0.5);
	}
    wait 0.1;
	self zm_zombie_eye_glow(color_id);
}

function zm_zombie_eye_glow(color_id) {
	if(!isdefined(self) || !isactor(self)) {
		return;
	}
	self clientfield::set("zombie_eye_glow", zm_zombie_eye_glow_rainbow(color_id));
}

function zm_set_zombies_eyes_color_title(color_title) {
    if (!ishash(color_title)) {
        color_title = hash(color_title);
    }
    switch (color_title) {
        case #"blue":
            return 2;
        case #"green":
            return 3;
        case #"orange":
            return 4;
        case #"clear":
            return 0;
        case #"random":
            return #"random";
        default:
            return 1;
    }
}
