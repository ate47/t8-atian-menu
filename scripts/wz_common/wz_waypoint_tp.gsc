wz_waypoint_tp_init() {
    self.atian.waypoint_old_func = get_menu_response_callback("WaypointPlaced");
	self register_menu_response_callback("WaypointPlaced", &wz_waypoint_tp_callback);
}

wz_waypoint_tp_callback(response, intpayload) {
	if(!isalive(self) || response != "placed" || !self is_mod_activated("waypoint_tp")) {
        return self [[ self.atian.waypoint_old_func ]](response, intpayload);
	}
    
    if (!isdefined(level.var_405a6738) || !isdefined(level.var_8a390df2)) {
        self menu_drawing_secondary("^1can't get map size");
        return;
    }
    
    if (isdefined(level.mapcenter)) {
        mapcenter = level.mapcenter;
    } else {
        mapcenter = (0, 0, 0);
    }

    xcoord = int(intpayload / 1000);
    ycoord = intpayload - (xcoord * 1000);

    // map size x : var_405a6738
    // map size y : var_8a390df2
    y = (xcoord - 500) / 500 * (0-level.var_405a6738) + mapcenter[1];
    x = (ycoord - 500) / 500 * (0-level.var_8a390df2) + mapcenter[0];
    
    self menu_drawing_secondary("^6Teleported to ^2" + x + "^6/^2" + y);

    position = bullettrace((x, y, 5000), (x, y, -5000), 0, self, 1)[#"position"];
    self setOrigin(position);
}
