func_setpbgactivebank(item, value) {
    self iprintlnbold("^6setpbgactivebank: ^2" + value);
	self clientfield::set_to_player("player_pbg_bank_scene_system", value);
    return true;
}