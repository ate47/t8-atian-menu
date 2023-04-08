init_menus() {
    self add_menu(#"tool_menu", "Tools", #"start_menu");
    self add_menu_item_menuswitch(#"start_menu", "Tools", #"tool_menu");

    self add_menu_item(#"tool_menu", "Info", "func_helloworld");
    self add_menu_item(#"tool_menu", "Fly", "func_fly");
    self add_menu_item(#"tool_menu", "Third person", "func_3rdperson");

    self add_menu_item(#"tool_menu", "Ammos", "func_maxammo");
    self add_menu_item(#"tool_menu", "Max Points", "func_points");
    self add_menu_item(#"tool_menu", "Invulnerability", "func_invulnerability");

    // ---- Weapons ----
    self add_menu(#"weapons", "Weapons", #"start_menu");
    self add_menu_item_menuswitch(#"start_menu", "Weapons", #"weapons");

    weapons = get_weapons_all();

    for (i = 0; i < weapons.size; i++) {
        self add_menu_item(#"weapons", weapons[i], "func_give_weapon", weapons[i]);
    }

    if (is_warzone()) {
        self add_menu(#"map_wz", "Set map", #"start_menu");
        self add_menu_item_menuswitch(#"start_menu", "Set map", #"map_wz");
        
        self add_menu(#"gmap_wz", "Set map/gametype", #"start_menu");
        self add_menu_item_menuswitch(#"start_menu", "Set map/gametype", #"gmap_wz");

        self add_menu_item(#"gmap_wz", "Core Solo", "func_set_mapgametype", "wz_open_skyscrapers", "warzone_solo");
        self add_menu_item(#"gmap_wz", "Core Duo", "func_set_mapgametype", "wz_open_skyscrapers", "warzone_duo");
        self add_menu_item(#"gmap_wz", "Core Quad", "func_set_mapgametype", "wz_open_skyscrapers", "warzone_quad");
        
        self add_menu_item(#"gmap_wz", "Alcatraz portal Quo", "func_set_mapgametype", "wz_escape", "warzone_escape_duo_dbno");
        self add_menu_item(#"gmap_wz", "Alcatraz portal Quad", "func_set_mapgametype", "wz_escape", "warzone_escape_quad_dbno");

        self add_menu_item(#"gmap_wz", "Hot pursuit", "func_set_mapgametype", "wz_open_skyscrapers", "warzone_hot_pursuit");
        self add_menu_item(#"gmap_wz", "Pandemic", "func_set_mapgametype", "wz_open_skyscrapers", "warzone_pandemic_quad");
        self add_menu_item(#"gmap_wz", "Heavy metal heroes", "func_set_mapgametype", "wz_open_skyscrapers", "warzone_heavy_metal_heroes");

        self add_menu_item(#"gmap_wz", "Core hardcore Solo", "func_set_mapgametype", "wz_escape", "warzone_hardcore_solo");
        self add_menu_item(#"gmap_wz", "Core hardcore Duo", "func_set_mapgametype", "wz_escape", "warzone_hardcore_duo");
        self add_menu_item(#"gmap_wz", "Core hardcore Quad", "func_set_mapgametype", "wz_escape", "warzone_hardcore_quad");
        
        self add_menu_item(#"gmap_wz", "Alcatraz hardcore Solo", "func_set_mapgametype", "wz_escape", "warzone_hardcore_solo");
        self add_menu_item(#"gmap_wz", "Alcatraz hardcore Duo", "func_set_mapgametype", "wz_escape", "warzone_hardcore_duo");
        self add_menu_item(#"gmap_wz", "Alcatraz hardcore Quad", "func_set_mapgametype", "wz_escape", "warzone_hardcore_quad");

        self add_menu_item(#"gmap_wz", "Alcatraz Solo (no respawn)", "func_set_mapgametype", "wz_escape", "warzone_solo");
        self add_menu_item(#"gmap_wz", "Alcatraz Duo (no respawn)", "func_set_mapgametype", "wz_escape", "warzone_duo");
        self add_menu_item(#"gmap_wz", "Alcatraz Quad (no respawn)", "func_set_mapgametype", "wz_escape", "warzone_quad");

        map_wz = get_all_maps_wz();
        
        for (i = 0; i < map_wz.size; i++) {
            self add_menu_item(#"map_wz", map_wz[i], "func_set_map", map_wz[i]);
        }
        
        self add_menu(#"mode_wz", "Set gametype", #"start_menu");
        self add_menu_item_menuswitch(#"start_menu", "Set gametype", #"mode_wz");

        mode_wz = get_all_modes_wz();
        
        for (i = 0; i < mode_wz.size; i++) {
            self add_menu_item(#"mode_wz", mode_wz[i], "func_set_gametype", mode_wz[i]);
        }
    } else if (is_multiplayer()) {
        self add_menu(#"map_mp", "Set map", #"start_menu");
        self add_menu_item_menuswitch(#"start_menu", "Set map", #"map_mp");

        map_mp = get_all_maps_mp();
        
        for (i = 0; i < map_mp.size; i++) {
            self add_menu_item(#"map_mp", map_mp[i], "func_set_map", map_mp[i]);
        }
        
        self add_menu(#"mode_mp", "Set gametype", #"start_menu");
        self add_menu_item_menuswitch(#"start_menu", "Set gametype", #"mode_mp");

        mode_mp = get_all_modes_mp();
        
        for (i = 0; i < mode_mp.size; i++) {
            self add_menu_item(#"mode_mp", mode_mp[i], "func_set_gametype", mode_mp[i]);
        }
    } else if (is_zombies()) {
        // ---- Weapons (Upgraded) ----
        self add_menu(#"weapons_upgraded", "Weapons (Upgraded)", #"start_menu");
        self add_menu_item_menuswitch(#"start_menu", "Weapons (Upgraded)", #"weapons_upgraded");

        weapons = get_weapons_all();

        for (i = 0; i < weapons.size; i++) {
            self add_menu_item(#"weapons_upgraded", weapons[i], "func_give_weapon", weapons[i] + "_upgraded");
        }
    }

    // ---- Characters ----
    self add_menu(#"characters", "Characters", #"start_menu");
    self add_menu_item_menuswitch(#"start_menu", "Characters", #"characters");

    characters = get_characters_for_mode();

    for (i = 0; i < characters.size; i++) {
        self add_menu_item(#"characters", characters[i], "func_set_char", i);
    }

    // ---- Camos ----
    self add_menu(#"camos", "Camos", #"start_menu");
    self add_menu_item_menuswitch(#"start_menu", "Camos", #"camos");
    
    // ---- Camos/Mastery ----
    self add_menu(#"camos_master", "Mastery", #"camos");
    self add_menu_item_menuswitch(#"camos", "Mastery", #"camos_master");
    
    // ---- Camos/Pack a punch ----
    self add_menu(#"camos_pap", "Pack a punch", #"camos");
    self add_menu_item_menuswitch(#"camos", "Pack a punch", #"camos_pap");
    
    // ---- Camos/Black market ----
    self add_menu(#"camos_blackjack", "Black market", #"camos");
    self add_menu_item_menuswitch(#"camos", "Black market", #"camos_blackjack");
    
    // ---- Camos/Multiplayer ----
    self add_menu(#"camos_mp", "Multiplayer", #"camos");
    self add_menu_item_menuswitch(#"camos", "Multiplayer", #"camos_mp");
    
    // ---- Camos/Zombies ----
    self add_menu(#"camos_zm", "Zombies", #"camos");
    self add_menu_item_menuswitch(#"camos", "Zombies", #"camos_zm");
    
    // ---- Camos/Blackout ----
    self add_menu(#"camos_wz", "Blackout", #"camos");
    self add_menu_item_menuswitch(#"camos", "Blackout", #"camos_wz");
    
    // ---- Camos/By id ----
    self add_menu(#"camos_id", "By id", #"camos");
    self add_menu_item_menuswitch(#"camos", "By id", #"camos_id");

    for (i = 1; i < 43; i += 3) {
        self add_menu_item(#"camos_mp", "Generic MP " + i, "func_set_camo", i);
    }

    for (i = 2; i < 43; i += 3) {
        self add_menu_item(#"camos_wz", "Generic BR " + i, "func_set_camo", i);
    }

    for (i = 3; i < 43; i += 3) {
        self add_menu_item(#"camos_zm", "Generic ZM " + i, "func_set_camo", i);
    }

    self add_menu_item(#"camos_master", "Gold", "func_set_camo", 43);
    self add_menu_item(#"camos_master", "Diamond", "func_set_camo", 44);
    self add_menu_item(#"camos_master", "Dark matter", "func_set_camo", 45);
    

    self add_menu_item(#"camos_pap", "Voyage of despair purple", "func_set_camo", 146);
    self add_menu_item(#"camos_pap", "Voyage of despair red", "func_set_camo", 147);
    self add_menu_item(#"camos_pap", "Voyage of despair green", "func_set_camo", 148);
    self add_menu_item(#"camos_pap", "Voyage of despair yellow", "func_set_camo", 149);
    self add_menu_item(#"camos_pap", "Voyage of despair pink", "func_set_camo", 150);
    self add_menu_item(#"camos_pap", "IX blue", "func_set_camo", 151);
    self add_menu_item(#"camos_pap", "IX red", "func_set_camo", 152);
    self add_menu_item(#"camos_pap", "IX green", "func_set_camo", 153);
    self add_menu_item(#"camos_pap", "IX purple", "func_set_camo", 154);
    self add_menu_item(#"camos_pap", "IX orange", "func_set_camo", 155);
    self add_menu_item(#"camos_pap", "Blood of the Dead yellow", "func_set_camo", 156);
    self add_menu_item(#"camos_pap", "Blood of the Dead red", "func_set_camo", 157);
    self add_menu_item(#"camos_pap", "Blood of the Dead yellow", "func_set_camo", 158);
    self add_menu_item(#"camos_pap", "Blood of the Dead green", "func_set_camo", 159);
    self add_menu_item(#"camos_pap", "Blood of the Dead purple", "func_set_camo", 160);
    self add_menu_item(#"camos_pap", "Classified 1", "func_set_camo", 161);
    self add_menu_item(#"camos_pap", "Classified 2", "func_set_camo", 162);
    self add_menu_item(#"camos_pap", "Classified 3", "func_set_camo", 163);
    self add_menu_item(#"camos_pap", "Classified 4", "func_set_camo", 164);
    self add_menu_item(#"camos_pap", "Classified 5", "func_set_camo", 165);
    self add_menu_item(#"camos_pap", "Dead of the night green", "func_set_camo", 280);
    self add_menu_item(#"camos_pap", "Dead of the night purple", "func_set_camo", 281);
    self add_menu_item(#"camos_pap", "Dead of the night red", "func_set_camo", 282);
    self add_menu_item(#"camos_pap", "Dead of the night blue", "func_set_camo", 283);
    self add_menu_item(#"camos_pap", "Dead of the night orange", "func_set_camo", 284);
    self add_menu_item(#"camos_pap", "Ancien Evil purple", "func_set_camo", 74);
    self add_menu_item(#"camos_pap", "Ancien Evil blue", "func_set_camo", 75);
    self add_menu_item(#"camos_pap", "Ancien Evil orange", "func_set_camo", 76);
    self add_menu_item(#"camos_pap", "Ancien Evil yellow", "func_set_camo", 77);
    self add_menu_item(#"camos_pap", "Ancien Evil green", "func_set_camo", 78);
    self add_menu_item(#"camos_pap", "Alpha Omega", "func_set_camo", 345);
    self add_menu_item(#"camos_pap", "Tag der toten", "func_set_camo", 394);

    self add_menu_item(#"camos_blackjack", "D-Day", "func_set_camo", 298);
    self add_menu_item(#"camos_blackjack", "Roadtrip", "func_set_camo", 300);
    self add_menu_item(#"camos_blackjack", "Masked", "func_set_camo", 310);
    self add_menu_item(#"camos_blackjack", "$", "func_set_camo", 46);
    self add_menu_item(#"camos_blackjack", "Green course", "func_set_camo", 47);
    self add_menu_item(#"camos_blackjack", "Blue", "func_set_camo", 48);
    self add_menu_item(#"camos_blackjack", "Kiss", "func_set_camo", 49);
    self add_menu_item(#"camos_blackjack", "Fortuna", "func_set_camo", 50);
    self add_menu_item(#"camos_blackjack", "Donuts", "func_set_camo", 51);
    self add_menu_item(#"camos_blackjack", "Bobine", "func_set_camo", 52);
    self add_menu_item(#"camos_blackjack", "Search", "func_set_camo", 57);
    self add_menu_item(#"camos_blackjack", "Strip", "func_set_camo", 62);
    self add_menu_item(#"camos_blackjack", "Rave", "func_set_camo", 67);
    self add_menu_item(#"camos_blackjack", "Twitch 1", "func_set_camo", 79);
    self add_menu_item(#"camos_blackjack", "Twitch 2", "func_set_camo", 118);
    self add_menu_item(#"camos_blackjack", "Serment", "func_set_camo", 80);
    self add_menu_item(#"camos_blackjack", "Imbu", "func_set_camo", 81);
    self add_menu_item(#"camos_blackjack", "Megalodon", "func_set_camo", 82);
    self add_menu_item(#"camos_blackjack", "Surf", "func_set_camo", 83);
    self add_menu_item(#"camos_blackjack", "Goinfre", "func_set_camo", 84);
    self add_menu_item(#"camos_blackjack", "Chrysalide", "func_set_camo", 86);
    self add_menu_item(#"camos_blackjack", "Locker", "func_set_camo", 87);
    self add_menu_item(#"camos_blackjack", "Nebula", "func_set_camo", 89);
    self add_menu_item(#"camos_blackjack", "After life", "func_set_camo", 90);
    self add_menu_item(#"camos_blackjack", "Bacon", "func_set_camo", 117);
    self add_menu_item(#"camos_blackjack", "Postluminescence", "func_set_camo", 119);
    self add_menu_item(#"camos_blackjack", "Dead time", "func_set_camo", 120);
    self add_menu_item(#"camos_blackjack", "Dirty buble", "func_set_camo", 121);
    self add_menu_item(#"camos_blackjack", "Heaven", "func_set_camo", 122);
    self add_menu_item(#"camos_blackjack", "Pique nique royal", "func_set_camo", 123);
    self add_menu_item(#"camos_blackjack", "Mai Tai Zombie", "func_set_camo", 124);
    self add_menu_item(#"camos_blackjack", "Heaven", "func_set_camo", 122);
    self add_menu_item(#"camos_blackjack", "Colonne piégée", "func_set_camo", 126);
    self add_menu_item(#"camos_blackjack", "115", "func_set_camo", 129);
    self add_menu_item(#"camos_blackjack", "Grey matter", "func_set_camo", 131);
    self add_menu_item(#"camos_blackjack", "Derezzed", "func_set_camo", 134);
    self add_menu_item(#"camos_blackjack", "Steam explosion", "func_set_camo", 135);
    self add_menu_item(#"camos_blackjack", "Goinfre", "func_set_camo", 136);
    self add_menu_item(#"camos_blackjack", "Arabesque", "func_set_camo", 137);
    self add_menu_item(#"camos_blackjack", "Se sentir visé", "func_set_camo", 166);
    self add_menu_item(#"camos_blackjack", "Denied access (waifu)", "func_set_camo", 167);
    self add_menu_item(#"camos_blackjack", "Skull", "func_set_camo", 168);
    self add_menu_item(#"camos_blackjack", "Rampage", "func_set_camo", 170);
    self add_menu_item(#"camos_blackjack", "Soul eater", "func_set_camo", 171);
    self add_menu_item(#"camos_blackjack", "Marathon", "func_set_camo", 172);
    self add_menu_item(#"camos_blackjack", "Avant garde", "func_set_camo", 173);
    self add_menu_item(#"camos_blackjack", "Crypted", "func_set_camo", 286);
    self add_menu_item(#"camos_blackjack", "Plasma", "func_set_camo", 293);
    self add_menu_item(#"camos_blackjack", "Air fight", "func_set_camo", 305);
    self add_menu_item(#"camos_blackjack", "Cherry", "func_set_camo", 314);
    self add_menu_item(#"camos_blackjack", "Gigakiller", "func_set_camo", 315);
    self add_menu_item(#"camos_blackjack", "Flicker", "func_set_camo", 316);
    self add_menu_item(#"camos_blackjack", "Rocket box", "func_set_camo", 317);
    self add_menu_item(#"camos_blackjack", "USA", "func_set_camo", 346);
    self add_menu_item(#"camos_blackjack", "Juicy", "func_set_camo", 347);
    self add_menu_item(#"camos_blackjack", "Glyph", "func_set_camo", 348);
    self add_menu_item(#"camos_blackjack", "Gratte-gratte", "func_set_camo", 350);
    self add_menu_item(#"camos_blackjack", "Flocon", "func_set_camo", 351);
    self add_menu_item(#"camos_blackjack", "Vertige", "func_set_camo", 353);
    self add_menu_item(#"camos_blackjack", "High tension", "func_set_camo", 354);
    self add_menu_item(#"camos_blackjack", "Gluant", "func_set_camo", 355);
    self add_menu_item(#"camos_blackjack", "Judas", "func_set_camo", 357);
    self add_menu_item(#"camos_blackjack", "Incandescent", "func_set_camo", 359);
    self add_menu_item(#"camos_blackjack", "Encoded", "func_set_camo", 363);
    self add_menu_item(#"camos_blackjack", "Solar eruption", "func_set_camo", 381);
    self add_menu_item(#"camos_blackjack", "Vision of the future", "func_set_camo", 387);
    self add_menu_item(#"camos_blackjack", "Pestilence", "func_set_camo", 389);

    for (i = 0; i < 512; i++) {
        self add_menu_item(#"camos_id", "Id " + i, "func_set_camo", i);
    }

    // ---- Reticles ----
    self add_menu(#"reticles", "Reticles", #"start_menu");
    self add_menu_item_menuswitch(#"start_menu", "Reticles", #"reticles");
    
    // ---- Reticles/By id ----
    self add_menu(#"reticles_id", "Reticles Id", #"start_menu");
    self add_menu_item_menuswitch(#"reticles", "By id", #"reticles_id");
    
    for (i = 0; i < 512; i++) {
        self add_menu_item(#"reticles_id", "Id " + i, "func_set_reticle", i);
    }


    if (is_multiplayer() || is_warzone()) {
        // ---- Skin custom ----
        self add_menu(#"skin_custom", "Skin custom", #"start_menu");
        self add_menu_item_menuswitch(#"start_menu", "Skin custom", #"skin_custom");
        
        self add_menu_item(#"skin_custom", "Clear", "func_set_skin_custom_clear");

        // ---- Skin custom/Skin ----
        self add_menu(#"skin_custom_skin", "Skin", #"skin_custom");
        self add_menu_item_menuswitch(#"skin_custom", "Skin", #"skin_custom_skin");
        self add_menu_item(#"skin_custom_skin", "Default", "func_set_skin_custom", 0);
        
        for (i = 1; i < 100; i++) {
            self add_menu_item(#"skin_custom_skin", "Skin " + i, "func_set_skin_custom", i);
        }

        // ---- Skin custom/Palette ----
        self add_menu(#"skin_custom_palette", "Palette", #"skin_custom");
        self add_menu_item_menuswitch(#"skin_custom", "Palette", #"skin_custom_palette");
        self add_menu_item(#"skin_custom_palette", "Default", "func_set_skin_custom_palette", 0);
        
        for (i = 1; i < 100; i++) {
            self add_menu_item(#"skin_custom_palette", "Skin " + i, "func_set_skin_custom_palette", i);
        }

        // ---- Skin custom/Decal ----
        self add_menu(#"skin_custom_decal", "Decal", #"skin_custom");
        self add_menu_item_menuswitch(#"skin_custom", "Decal", #"skin_custom_decal");
        self add_menu_item(#"skin_custom_decal", "Default", "func_set_skin_custom_decal", 0);
        
        for (i = 1; i < 100; i++) {
            self add_menu_item(#"skin_custom_decal", "Skin " + i, "func_set_skin_custom_decal", i);
        }

        // ---- Skin custom/Warpaint ----
        self add_menu(#"skin_custom_warpaint", "Warpaint", #"skin_custom");
        self add_menu_item_menuswitch(#"skin_custom", "Warpaint", #"skin_custom_warpaint");
        self add_menu_item(#"skin_custom_warpaint", "Default", "func_set_skin_custom_warpaint", 0);
        
        for (i = 1; i < 100; i++) {
            self add_menu_item(#"skin_custom_warpaint", "Skin " + i, "func_set_skin_custom_warpaint", i);
        }
    }

    self thread menu_think();
}

menu_handlefunc(func_name, data, data2, data3, data4, data5) {
    switch (func_name) {
    case "func_helloworld":
        return self func_helloworld(data);
    case "func_give_weapon":
        return self func_give_weapon(data);
    case "func_set_map":
        return self func_set_map(data);
    case "func_set_gametype":
        return self func_set_gametype(data);
    case "func_set_mapgametype":
        return self func_set_mapgametype(data, data2);
    case "func_3rdperson":
        return self func_3rdperson();
    case "func_set_char":
        return self func_set_char(data);
    case "func_fly":
        return self func_fly();
    case "func_maxammo":
        return self func_maxammo();
    case "func_points":
        return self func_points();
    case "func_set_camo":
        return self func_set_camo(data);
    case "func_set_reticle":
        return self func_set_reticle(data);
    case "func_set_skin_custom":
        return self func_set_skin_custom(data);
    case "func_set_skin_custom_clear":
        return self func_set_skin_custom_clear();
    case "func_set_skin_custom_palette":
        return self func_set_skin_custom_palette(data);
    case "func_set_skin_custom_decal":
        return self func_set_skin_custom_decal(data);
    case "func_set_skin_custom_warpaint":
        return self func_set_skin_custom_warpaint(data);
    case "func_invulnerability":
        return self func_invulnerability();
    case "menu_switch":
        return self menu_switch(data);
    default: 
        self iPrintLnBold("^1bad function " + func_name);
        return self menu_switch();
    }
}
func_helloworld(text) {
    if (isdefined(text)) {
        self iprintln(text);
    }
    weapon = self GetCurrentWeapon();
    if (isdefined(weapon) && isdefined(weapon.name)) {
        str_weapon = weapon.name;
        self iprintln("weapon: " + weapon.name);
    }
    if (isdefined(level.gametype)) {
        self iprintln("gtype:  " + level.gametype);
    }
    if (isdefined(get_gamemode())) {
        self iprintln("gmode:  " + get_gamemode());
    }
    if (isdefined(level.script)) {
        self iprintln("map:    " + level.script);
    }
    if (isdefined(self.origin)) {
        self iprintln("origin: " + self.origin);
    }
    role = self player_role::get();
    if (isdefined(role)) {
        self iprintln("role:   " + role);
    }
    self.menu_info.no_render = true;
}

func_give_weapon(weapon_name) {
    weapon = getweapon(hash(weapon_name));

    if (isdefined(weapon)) {
        weapon_options = self calcweaponoptions(0, 0, 0);

        old_weapon = self GetCurrentWeapon();

        if (isdefined(old_weapon)) {
            self takeweapon(old_weapon);
        }

        self giveweapon(weapon, weapon_options);

        if (isdefined(weapon.name)) {
            self iPrintLn("gave weapon : " + weapon.name);
        } else {
            self iPrintLn("gave weapon nn: " + weapon_name);
        }
    } else {
        self iPrintLn("unknown weapon " + weapon_name);
    }
}
func_3rdperson() {
    if (!isdefined(self.thirdperson)) {
        self.thirdperson = false;
    }

    self.thirdperson = !self.thirdperson;
    
    self setclientthirdperson(self.thirdperson);

}

func_set_mapgametype(map_name, gametype) {
    self iPrintLn("loading map " + map_name + " with mode " + gametype);

    switchmap_load(map_name, gametype);
    wait(1);
    switchmap_switch();
}

func_set_map(map_name) {
    self iPrintLn("loading " + map_name);

    map(map_name);
    wait(1);
    switchmap_switch();
}
func_set_gametype(gametype) {
    map_name = util::get_map_name();
    self iPrintLn("loading mode " + gametype);

    switchmap_load(map_name, gametype);
    wait(1);
    switchmap_switch();
}

func_set_char(character_id) {
    self setspecialistindex(character_id);
    self player_role::update_fields();

    // clear fields
    self setcharacteroutfit(0);
    self function_9b48a8e5(0);
    self function_ab96a9b5("head", 0);
    self function_ab96a9b5("headgear", 0);
    self function_ab96a9b5("arms", 0);
    self function_ab96a9b5("torso", 0);
    self function_ab96a9b5("legs", 0);
    self function_ab96a9b5("palette", 0);
    self function_ab96a9b5("warpaint", 0);
    self function_ab96a9b5("decal", 0);
    return true;
}
func_fly() {
    if (isdefined(self.tool_fly) && self.tool_fly) {
        self.tool_fly = false;
    } else {
        self.tool_fly = true;
    }
    return true;
}
func_invulnerability() {
    if (isdefined(self.tool_invulnerability) && self.tool_invulnerability) {
        self.tool_invulnerability = false;
        self disableinvulnerability();
    } else {
        self.tool_invulnerability = true;
    }
    return true;
}
func_maxammo() {
    if (isdefined(self.tool_maxammo) && self.tool_maxammo) {
        self.tool_maxammo = false;
    } else {
        self.tool_maxammo = true;
    }
    return true;
}
func_points() {
    if (isdefined(self.tool_maxpoints) && self.tool_maxpoints) {
        self.tool_maxpoints = false;
    } else {
        self.tool_maxpoints = true;
    }
    return true;
}

func_set_camo(data) {
    self SetCamo(data, 0);
    return true;
}
func_set_reticle(data) {
    SetReticle(data);
    return true;
}
func_set_skin_custom_clear() {
    self setcharacteroutfit(0);
    self function_9b48a8e5(0);
    self function_ab96a9b5("head", 0);
    self function_ab96a9b5("headgear", 0);
    self function_ab96a9b5("arms", 0);
    self function_ab96a9b5("torso", 0);
    self function_ab96a9b5("legs", 0);
    self function_ab96a9b5("palette", 0);
    self function_ab96a9b5("warpaint", 0);
    self function_ab96a9b5("decal", 0);
    return true;
}
func_set_skin_custom(data) {
    self setcharacteroutfit(data);
    return true;
}
func_set_skin_custom_palette(data) {
    self function_ab96a9b5("palette", data);
    return true;
}
func_set_skin_custom_warpaint(data) {
    self function_ab96a9b5("warpaint", data);
    return true;
}
func_set_skin_custom_decal(data) {
    self function_ab96a9b5("decal", data);
    return true;
}

SetReticle(reticle) {
    weapon = self getCurrentWeapon();
    if (isdefined(weapon)) {
        self takeweapon(weapon);
        camo_index = getCamoIndex(self getBuildKitWeaponOptions(weapon));
        weapon_options = self calcweaponoptions(camo_index, reticle, 0);
        
        self giveweapon(weapon, weapon_options);
    }
}
SetCamo(id, reticle) {
    weapon = self GetCurrentWeapon();

    if (!isdefined(reticle)) {
        reticle = 0;
    }

    if (isdefined(weapon)) {
        self takeweapon(weapon);
        weapon_options = self calcweaponoptions(id, reticle, 0);
        
        self giveweapon(weapon, weapon_options);
        camo_index_var = getcamoindex(weapon_options);
        camo_var2 = function_11c873a(camo_index_var);
        self iPrintLn("camo: " + camo_index_var + ", reticle: " + reticle);
        if (isdefined(camo_var2)) {
            self iPrintLn("var:camo: " + camo_var2);
        }
    }
}