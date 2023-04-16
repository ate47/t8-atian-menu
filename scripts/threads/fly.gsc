
ANoclipBind() {
    self endon(#"spawned_player", #"disconnect", #"bled_out");
    level endon(#"end_game", #"game_ended");
    self notify(#"stop_player_out_of_playable_area_monitor");
	self unlink();
    if(isdefined(self.originObj)) self.originObj delete();
	while(true)
	{
		if(is_mod_activated("fly"))
		{
			self.originObj = spawn("script_origin", self.origin, 1);
    		self.originObj.angles = self.angles;
			self PlayerLinkTo(self.originObj, undefined);
            self iprintln("^2Enabled");
            self iprintln("[{+breath_sprint}] to fly");
			self enableweapons();
			while(true)
			{
				if(!is_mod_activated("fly")) break;
				if(self key_mgr_has_key_pressed(#"fly_key", false))
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