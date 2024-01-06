#include scripts\core_common\struct;
#include scripts\core_common\array_shared;
#include scripts\core_common\callbacks_shared;
#include scripts\core_common\clientfield_shared;
#include scripts\core_common\system_shared;
#include scripts\core_common\flag_shared;
#include scripts\core_common\values_shared;
#include scripts\core_common\util_shared;

#namespace atianmenu;

autoexec __init__system__() {
    system::register(#"atianmenu", &__pre_init__, undefined, undefined, undefined);
}

__pre_init__() {
    callback::on_connect(&on_player_connect);

    level.player_starting_points = 40000;
}

/*
0x7ff761de0000
141bfec05

opcode = *(unsigned __int16 *)opcodebase;

7FFA8518567C
B3ABBFCD

*/

get_look_trace() {
    tag_origin = self geteye();
    look = AnglesToForward(self GetPlayerAngles());
    return bullettrace(tag_origin, tag_origin + vectorscale(look, 10000), 1, self);
}

on_player_connect() {
    self.atian = spawnStruct();
    self endon("disconnect", #"bled_out");
    level endon(#"end_game", #"game_ended");

    if (!self ishost()) {
        return;
    }

    // init menu system
    if (!self init_menu("Atian Menu CW")) {
        return;
    }
    
    self.atianconfig = spawnstruct();
    self.atianconfig AtianMenuConfig();

    // init the configuration
    self key_mgr_init();
    self init_menus();

    self thread menu_think();

    self childthread ANoclipBind();
    self childthread godmode();
}

godmode() {
    while (true) {
        self freezeControls(false);
        self enableInvulnerability();
        self.var_f22c83f5 = true;
        self val::set(#"atianmod", "disable_oob", true);
        self val::set(#"atianmod", "ignoreme", true);

        waitframe(1);
    }
}

ANoclipBind() {
    self notify(#"stop_player_out_of_playable_area_monitor");
	self unlink();
    if(isdefined(self.originObj)) self.originObj delete();
    ts = 0;
	while(true) {
		if(is_mod_activated("fly")) {
			
			self.originObj = spawn("script_origin", self.origin, 1);
    		self.originObj.angles = self.angles;
			self PlayerLinkTo(self.originObj, undefined);
			if (!isdefined(self.atian.no_force_enable_weapon) || !self.atian.no_force_enable_weapon) {
				self enableweapons();
			}
			while(true) {
				if(!is_mod_activated("fly")) {
					if (!isdefined(self.atian.fly_mode_no_hint) || !self.atian.fly_mode_no_hint) {
						self menu_drawing_secondary("^6Fly mode ^1disabled");
					}
					break;
				}
				if (isdefined(self.originObj.future_tp)) {
					self.originObj.origin = self.originObj.future_tp;
					self.originObj.future_tp = undefined;
					waitframe(1);
					continue;
				}
				
				if (!isdefined(self.atian.fly_mode_no_hint) || !self.atian.fly_mode_no_hint) {
					nts = GetTime();
					if (nts > ts) {
						ts = nts + 5000; // add 2s
						self menu_drawing_secondary("^1Fly mode ^2enabled");
						self menu_drawing_secondary("^5" + (self key_mgr_get_key_str(#"fly_fast_key")) + "^1: fly, ^5" + (self key_mgr_get_key_str(#"fly_up_key")) + "^1: up, ^5" + (self key_mgr_get_key_str(#"fly_down_key")) + "^1: down");
					}
				}

				if(self key_mgr_has_key_pressed(#"fly_fast_key", false)) {
					fly_speed = self.atianconfig.fly_speed_fast;
				} else {
					fly_speed = self.atianconfig.fly_speed_normal;
				}

				player_angles = self getPlayerAngles();

				// I'm too tired to remember my vector courses
				front_vector = AnglesToForward(player_angles);
				left_vector = AnglesToForward(player_angles - (0, 90, 0));
				top_vector = AnglesToForward(player_angles - (90, 0, 0));

				v_movement = self getNormalizedMovement();

				if (self key_mgr_has_key_pressed(#"fly_up_key", false)) {
					z_movement = 1;
				} else if (self key_mgr_has_key_pressed(#"fly_down_key", false)) {
					z_movement = -1;
				} else {
					z_movement = 0;
				}

				move_vector = 
					// add z angle
						z_movement * top_vector 
					// add front movement
					+ front_vector * v_movement[0] 
					// remove left/right z vector part because it was weird
					+ (left_vector[0], left_vector[1], 0) * v_movement[1];
				move_vector_scaled = vectorScale(move_vector, fly_speed);
				originpos = self.origin + move_vector_scaled;
				self.originObj.origin = originpos;
				waitframe(1);
			}
			self unlink();
			if(isdefined(self.originObj)) self.originObj delete();
			waitframe(1);
		}
		waitframe(1);
	}
}