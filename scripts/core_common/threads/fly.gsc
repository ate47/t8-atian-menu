
ANoclipBind() {
    self endon(#"spawned_player", #"disconnect", #"bled_out");
    level endon(#"end_game", #"game_ended");
    self notify(#"stop_player_out_of_playable_area_monitor");
	self unlink();
    if(isdefined(self.originObj)) self.originObj delete();
    ts = 0;
	while(true) {
		if(is_mod_activated("fly")) {
			
			self.originObj = spawn("script_origin", self.origin, 1);
    		self.originObj.angles = self.angles;
			self PlayerLinkTo(self.originObj, undefined);
			self enableweapons();
			while(true) {
				if(!is_mod_activated("fly")) {
					self iprintlnbold("^6Fly mode ^1disabled");
					break;
				}
				if (isdefined(self.originObj.future_tp)) {
					self.originObj.origin = self.originObj.future_tp;
					self.originObj.future_tp = undefined;
					waitframe(1);
					continue;
				}
				
				nts = GetTime();
				if (nts > ts) {
					ts = nts + 5000; // add 2s
					self iprintlnbold("^6Fly mode ^2enabled");
					self iprintlnbold("^5" + (self key_mgr_get_key_str(#"fly_fast_key")) + "^6: fly, ^5" + (self key_mgr_get_key_str(#"fly_up_key")) + "^6: up, ^5" + (self key_mgr_get_key_str(#"fly_down_key")) + "^6: down");
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