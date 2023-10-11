func_setpbgactivebank(item, value) {
    self menu_drawing_secondary("^6setpbgactivebank: ^2" + value);
	self clientfield::set_to_player("player_pbg_bank_scene_system", value);
    return true;
}