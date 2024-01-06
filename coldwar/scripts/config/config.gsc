
AtianMenuConfig() {
    // - fly when moving, default 20
    self.fly_speed_normal = 20;
    // - fly when moving fast, default 60
    self.fly_speed_fast = 60;

    self.preloaded_menus = array(
        "tool_menu::Ammos",
        "tool_menu::Max Points",
        "tool_menu::Ignore me",
        "tool_menu::Invulnerability"
    );

    // set starting points
    self.player_starting_points = 123450;
}