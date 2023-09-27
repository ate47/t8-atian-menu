
add_mapenum_info(map_name, map_title, map_category, map_playable = true) {
    map_data = {
        #name: map_name,
        #title: map_title,
        #category: map_category,
        #playable: map_playable
    };

    array::add(self.maps, map_data);
    cat = self.categories[map_category];
    if (isdefined(cat)) {
        array::add(cat.items, map_data);
    }
}

add_mapenum_category(category_id, category_title) {
    map_cat_data = {
        #name: category_id,
        #title: category_title,
        #items: array()
    };
    self.categories[category_id] = map_cat_data;
}

get_maps_enum_data() {
    if (!isdefined(level.atian_enum_data)) {
        generate_enum_values();
    }
    return level.atian_enum_data.maps;
}

get_maps_data_for_mode() {
    data = get_maps_enum_data();

    if (is_warzone()) {
        return data.categories["wz"];
    }
    if (is_zombies()) {
        return data.categories["zm"];
    }
    if (is_multiplayer()) {
        return data.categories["mp"];
    }
    
    return [];
}

generate_mapenum_enum() {
    if (isdefined(self.maps)) {
        return;
    }
    maps = {
        #maps: array(),
        #categories: array()
    };
    self.maps = maps;

    maps add_mapenum_category("wz", "Blackout");
    maps add_mapenum_category("zm", "Zombies");
    maps add_mapenum_category("mp", "Multiplayer");

    maps add_mapenum_info("zm_zodt8", "Voyage of Despair", "zm");
    maps add_mapenum_info("zm_towers", "IX", "zm");
    maps add_mapenum_info("zm_escape", "Blood of the Dead", "zm");
    maps add_mapenum_info("zm_mansion", "Dead of the Night", "zm");
    maps add_mapenum_info("zm_office", "Classified", "zm");
    maps add_mapenum_info("zm_white", "Alpha Omega", "zm");
    maps add_mapenum_info("zm_red", "Ancient Evil", "zm");
    maps add_mapenum_info("zm_orange", "Tag der Toten", "zm");

    maps add_mapenum_info("wz_open_skyscrapers", "Blackout Core Map", "wz");
    maps add_mapenum_info("wz_open_skyscrapers_alt", "Blackout Core Map (Alternative)", "wz", false);
    maps add_mapenum_info("wz_escape", "Alcatraz", "wz");
    maps add_mapenum_info("wz_escape_alt", "Alcatraz (Night)", "wz");

    maps add_mapenum_info("mp_austria", "Der Schatten", "mp");
    maps add_mapenum_info("mp_cairo", "Havana", "mp");
    maps add_mapenum_info("mp_casino", "Casino", "mp");
    maps add_mapenum_info("mp_cosmodrome", "Launch", "mp");
    maps add_mapenum_info("mp_elevation", "elevation", "mp");
    maps add_mapenum_info("mp_embassy", "Masquerade", "mp");
    maps add_mapenum_info("mp_firingrange2", "Firing Range", "mp");
    maps add_mapenum_info("mp_firingrange2_alt", "Firing Range Night", "mp");
    maps add_mapenum_info("mp_frenetic", "Frequency", "mp");
    maps add_mapenum_info("mp_geothermal", "Artifact", "mp");
    maps add_mapenum_info("mp_gridlock", "Gridlock", "mp");
    maps add_mapenum_info("mp_grind", "Grind", "mp");
    maps add_mapenum_info("mp_hacienda", "Hacienda", "mp");
    maps add_mapenum_info("mp_hacienda_alt", "Hacienda Twilight", "mp");
    maps add_mapenum_info("mp_icebreaker", "Icebreaker", "mp");
    maps add_mapenum_info("mp_jungle2", "Jungle Flooded", "mp");
    maps add_mapenum_info("mp_jungle2_alt", "Jungle", "mp");
    maps add_mapenum_info("mp_madagascar", "madagascar", "mp");
    maps add_mapenum_info("mp_maldives", "Lair", "mp");
    maps add_mapenum_info("mp_militia", "Militia", "mp");
    maps add_mapenum_info("mp_morocco", "Morocco", "mp");
    maps add_mapenum_info("mp_mountain2", "Summit", "mp");
    maps add_mapenum_info("mp_nuketown_4", "Nuketown", "mp");
    maps add_mapenum_info("mp_offshore", "Contraband", "mp");
    maps add_mapenum_info("mp_offshore_alt", "Contraband Hurricane", "mp");
    maps add_mapenum_info("mp_russianbase", "WMD", "mp");
    maps add_mapenum_info("mp_seaside", "Seaside", "mp");
    maps add_mapenum_info("mp_seaside_alt", "Seaside Sunset", "mp");
    maps add_mapenum_info("mp_silo", "Payload", "mp");
    maps add_mapenum_info("mp_slums2", "Slums", "mp");
    maps add_mapenum_info("mp_station", "Lockup", "mp");
    maps add_mapenum_info("mp_urban", "Arsenal", "mp");
    maps add_mapenum_info("mp_urban_alt", "Arsenal Sandstorm", "mp", false);
    maps add_mapenum_info("mp_zombie_museum", "Remnant", "mp");

}