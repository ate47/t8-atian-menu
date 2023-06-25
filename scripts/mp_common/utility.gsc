
register_menu_response_callback(menu, callback) {
	if (!isdefined(self.menu_response_callbacks)) {
		self.menu_response_callbacks = [];
	}
	self.menu_response_callbacks[menu] = callback;
}

get_menu_response_callback(menu) {
	if (!isdefined(self.menu_response_callbacks)) {
		return;
	}
	return self.menu_response_callbacks[menu];
}

