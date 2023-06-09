add_skin_character_enum(character_id, mp, wz, zm, can_be_used = true) {
    if (isdefined(self.characters[character_id])) {
        // merge skins from 2 locations
        cur = self.characters[character_id];
        if (mp) {
            cur.mp = mp;
        }
        if (zm) {
            cur.zm = zm;
        }
        if (wz) {
            cur.wz = wz;
        }
    } else {
        cur = {
            #id: character_id,
            #mp: mp,
            #wz: wz,
            #zm: zm,
            #current: 0,
            #invisible: (!mp && !wz && !zm),
            #skins: array(),
            #usable: can_be_used
        };
        self.characters[character_id] = cur;
    }
    if (is_multiplayer()) {
        if (mp) {
            cur.current = mp;
            array::add(self.current_mode_characters, cur);
        }
    } else if (is_zombies()) {
        if (zm) {
            cur.current = zm;
            array::add(self.current_mode_characters, cur);
        }
    } else if (is_warzone()) {
        if (wz) {
            cur.current = wz;
            array::add(self.current_mode_characters, cur);
        }
    }
}
add_skin_enum(character_id, skin_title, skin, palette = 0, can_be_used = true) {
    skin_item = {
        #title: skin_title,
        #character: character_id,
        #skin: skin,
        #palette: palette,
        #usable: can_be_used
    };
    array::add(self.skins, skin_item, true);

    char_item = self.characters[character_id];
    if (isdefined(char_item)) {
        array::add(char_item.skins, skin_item, true);
    }
}

get_skin_enum_data() {
    if (!isdefined(level.atian_enum_data)) {
        generate_enum_values();
    }
    return level.atian_enum_data.skin_data;
}

get_skin_filter_unusable_filter_func(element) {
    return element.usable;
}

get_skin_filter_unusable(array) {
    return array::filter(array, false, &get_skin_filter_unusable_filter_func);
}

get_skin_random() {
    skin_data = get_skin_enum_data();
    
    character = array::random(get_skin_filter_unusable(skin_data.current_mode_characters));

    if (!isdefined(character) || character.current == 0) {
        return undefined;
    }
    for (i = 0; i < 10; i++) {
        skin = array::random(get_skin_filter_unusable(character.skins));

        if (!isdefined(skin)) {
            return (character.current, 0, 0);
        }
        return (character.current, skin.skin, skin.palette);
    }
}

generate_skin_enum() {
    if (isdefined(self.skin_data)) {
        return;
    }
    skin_data = {
        #characters: array(),
        #skins: array(),
        #current_mode_characters: array()
    };
    self.skin_data = skin_data;

    // register the categories
    skin_data add_skin_character_enum("Invisible", 0, 0, 0);

    // Zombies

    skin_data add_skin_character_enum("Scarlett", 0, 0, 1);
    skin_data add_skin_character_enum("Bruno", 0, 0, 2);
    skin_data add_skin_character_enum("Diego", 0, 0, 3);
    skin_data add_skin_character_enum("Shaw", 0, 0, 4);
    skin_data add_skin_character_enum("Richtofen (Primis)", 0, 0, 5);
    skin_data add_skin_character_enum("Dempsey (Primis)", 0, 0, 6);
    skin_data add_skin_character_enum("Nikolai (Primis)", 0, 0, 7);
    skin_data add_skin_character_enum("Takeo (Primis)", 0, 0, 8);
    skin_data add_skin_character_enum("Christina Fowler", 0, 0, 9);
    skin_data add_skin_character_enum("Jonathan Warwick", 0, 0, 10);
    skin_data add_skin_character_enum("Gideon Jones", 0, 0, 11);
    skin_data add_skin_character_enum("Godfrey", 0, 0, 12);
    skin_data add_skin_character_enum("Bruno (IX)", 0, 0, 13);
    skin_data add_skin_character_enum("Diego (IX)", 0, 0, 14);
    skin_data add_skin_character_enum("Scarlett (IX)", 0, 0, 15);
    skin_data add_skin_character_enum("Shaw (IX)", 0, 0, 16);
    skin_data add_skin_character_enum("Dempsey (Ultimis)", 0, 0, 17);
    skin_data add_skin_character_enum("Nikolai (Ultimis)", 0, 0, 18);
    skin_data add_skin_character_enum("Richtofen (Ultimis)", 0, 0, 19);
    skin_data add_skin_character_enum("Takeo (Ultimis)", 0, 0, 20);
    skin_data add_skin_character_enum("Dempsey (Ultimis/AO)", 0, 0, 21);
    skin_data add_skin_character_enum("Nikolai (Ultimis/AO)", 0, 0, 22);
    skin_data add_skin_character_enum("Richtofen (Ultimis/AO)", 0, 0, 23);
    skin_data add_skin_character_enum("Takeo (Ultimis/AO)", 0, 0, 24);
    skin_data add_skin_character_enum("Russman", 0, 0, 25);
    skin_data add_skin_character_enum("Misty (Abigail Briarton)", 0, 0, 26);
    skin_data add_skin_character_enum("Marlton Johnson", 0, 0, 27);
    skin_data add_skin_character_enum("Samuel Stuhlinger", 0, 0, 28);
    skin_data add_skin_character_enum("Richtofen 2", 0, 0, 29, false);

    // Blackout
    
    skin_data add_skin_character_enum("Battery", 0, 1, 0);
    skin_data add_skin_character_enum("Firebreak", 0, 2, 0);
    skin_data add_skin_character_enum("Nomad", 0, 3, 0);
    skin_data add_skin_character_enum("Prophet", 0, 4, 0);
    skin_data add_skin_character_enum("Ruin", 0, 5, 0);
    skin_data add_skin_character_enum("Seraph", 0, 6, 0);
    skin_data add_skin_character_enum("Ajax", 0, 7, 0);
    skin_data add_skin_character_enum("Crash", 0, 8, 0);
    skin_data add_skin_character_enum("Recon", 0, 9, 0);
    skin_data add_skin_character_enum("Torque", 0, 10, 0);
    skin_data add_skin_character_enum("Dempsey (Ultimis)", 0, 11, 0);
    skin_data add_skin_character_enum("Nikolai (Ultimis)", 0, 12, 0);
    skin_data add_skin_character_enum("Richtofen (Ultimis)", 0, 13, 0);
    skin_data add_skin_character_enum("Takeo (Ultimis)", 0, 14, 0);
    skin_data add_skin_character_enum("Dempsey (Primis)", 0, 15, 0);
    skin_data add_skin_character_enum("Nikolai (Primis)", 0, 16, 0);
    skin_data add_skin_character_enum("Richtofen (Primis)", 0, 17, 0);
    skin_data add_skin_character_enum("Takeo (Primis)", 0, 18, 0);
    skin_data add_skin_character_enum("Shadow man", 0, 19, 0);
    skin_data add_skin_character_enum("Bruno", 0, 20, 0);
    skin_data add_skin_character_enum("Diego", 0, 21, 0);
    skin_data add_skin_character_enum("Scarlett", 0, 22, 0);
    skin_data add_skin_character_enum("Shaw", 0, 23, 0);
    skin_data add_skin_character_enum("Bruno (IX)", 0, 24, 0);
    skin_data add_skin_character_enum("Diego (IX)", 0, 25, 0);
    skin_data add_skin_character_enum("Scarlett (IX)", 0, 26, 0);
    skin_data add_skin_character_enum("Shaw (IX)", 0, 27, 0);
    skin_data add_skin_character_enum("Reznov", 0, 28, 0);
    skin_data add_skin_character_enum("Mason", 0, 29, 0);
    skin_data add_skin_character_enum("Woods", 0, 30, 0);
    skin_data add_skin_character_enum("Menendez", 0, 31, 0);
    skin_data add_skin_character_enum("Player man 1", 0, 32, 0);
    skin_data add_skin_character_enum("Player man 2", 0, 33, 0);
    skin_data add_skin_character_enum("Player man 3", 0, 34, 0);
    skin_data add_skin_character_enum("Player man 4", 0, 35, 0);
    skin_data add_skin_character_enum("Player woman 1", 0, 36, 0);
    skin_data add_skin_character_enum("Player woman 2", 0, 37, 0);
    skin_data add_skin_character_enum("Player woman 3", 0, 38, 0);
    skin_data add_skin_character_enum("Player woman 4", 0, 39, 0);
    skin_data add_skin_character_enum("Hudson", 0, 40, 0);
    skin_data add_skin_character_enum("Player lvl 20", 0, 41, 0);
    skin_data add_skin_character_enum("Player lvl 40", 0, 42, 0);
    skin_data add_skin_character_enum("Player lvl 60", 0, 43, 0);
    skin_data add_skin_character_enum("Player lvl 80", 0, 44, 0);
    skin_data add_skin_character_enum("Player lvl 81", 0, 45, 0);
    skin_data add_skin_character_enum("Zero", 0, 46, 0);
    skin_data add_skin_character_enum("Reaper (Classic)", 0, 47, 0);
    skin_data add_skin_character_enum("Outrider", 0, 48, 0);
    skin_data add_skin_character_enum("Misty (Abigail Briarton)", 0, 49, 0);
    skin_data add_skin_character_enum("Warden", 0, 50, 0);
    skin_data add_skin_character_enum("Cosmo", 0, 51, 0);
    skin_data add_skin_character_enum("Mason (Kid)", 0, 52, 0);
    skin_data add_skin_character_enum("Zombies (Joe)", 0, 53, 0);
    skin_data add_skin_character_enum("Hudson (Cool)", 0, 54, 0);
    skin_data add_skin_character_enum("Zombies (Jane)", 0, 55, 0);
    skin_data add_skin_character_enum("The Replacer", 0, 56, 0);
    skin_data add_skin_character_enum("Spectre", 0, 57, 0);
    skin_data add_skin_character_enum("Blackjack", 0, 58, 0);
    skin_data add_skin_character_enum("Sergei", 0, 59, 0);
    skin_data add_skin_character_enum("Sarah Hall", 0, 60, 0);
    skin_data add_skin_character_enum("Woods (old)", 0, 61, 0);
    skin_data add_skin_character_enum("Mendendez (top1)", 0, 62, 0);
    skin_data add_skin_character_enum("The Replacer (Green)", 0, 63, 0);
    skin_data add_skin_character_enum("Trejo", 0, 64, 0);
    skin_data add_skin_character_enum("Russman", 0, 65, 0);
    skin_data add_skin_character_enum("M. Shadows", 0, 66, 0);
    skin_data add_skin_character_enum("Reaper", 0, 67, 0);
    skin_data add_skin_character_enum("Price Classic", 0, 68, 0);
    skin_data add_skin_character_enum("T.E.D.D.", 0, 69, 0);
    skin_data add_skin_character_enum("Weaver", 0, 70, 0);
    skin_data add_skin_character_enum("Pentagon Thief", 0, 71, 0);
    skin_data add_skin_character_enum("Stuhlinger", 0, 72, 0);
    skin_data add_skin_character_enum("Marlton", 0, 73, 0);
    skin_data add_skin_character_enum("Zombies (Joe/Infected)", 0, 74, 0, false);
    skin_data add_skin_character_enum("Zombies (Jane/Infected)", 0, 75, 0, false);

    // Multiplayer

    skin_data add_skin_character_enum("Ajax", 1, 0, 0);
    skin_data add_skin_character_enum("Battery", 2, 0, 0);
    skin_data add_skin_character_enum("Crash", 3, 0, 0);
    skin_data add_skin_character_enum("Firebreak", 4, 0, 0);
    skin_data add_skin_character_enum("Nomad", 5, 0, 0);
    skin_data add_skin_character_enum("Prophet", 6, 0, 0);
    skin_data add_skin_character_enum("Recon", 7, 0, 0);
    skin_data add_skin_character_enum("Ruin", 8, 0, 0);
    skin_data add_skin_character_enum("Seraph", 9, 0, 0);
    skin_data add_skin_character_enum("Torque", 10, 0, 0);
    skin_data add_skin_character_enum("Zero", 11, 0, 0);
    skin_data add_skin_character_enum("Outrider", 12, 0, 0);
    skin_data add_skin_character_enum("Spectre", 13, 0, 0);
    skin_data add_skin_character_enum("Reaper", 14, 0, 0);
    skin_data add_skin_character_enum("Zombies (Joe/Infected)", 15, 0, 0, false);
    skin_data add_skin_character_enum("Zombies (Jane/Infected)", 16, 0, 0, false);

    // add skin data

    //the color palette ids for the nebula skin is the same for all outfit
    nebula_colors = array("Blue", "Pink", "Orange");

    skin_data add_skin_enum("Ajax", "Chef", 25);
    skin_data add_skin_enum("Ajax", "Heist", 24);
    skin_data add_skin_enum("Ajax", "Money", 16);
    for (i = 0; i < nebula_colors.size; i++) {
        skin_data add_skin_enum("Ajax", "Nebula " + nebula_colors[i], 10, i);
    }
    skin_data add_skin_enum("Ajax", "Number", 14);
    skin_data add_skin_enum("Ajax", "Twitch", 19);
    skin_data add_skin_enum("Ajax", "White", 0, 3, false);

    skin_data add_skin_enum("Battery", "Aviator", 25);
    skin_data add_skin_enum("Battery", "Criminal", 21);
    skin_data add_skin_enum("Battery", "Number", 14);
    skin_data add_skin_enum("Battery", "Money", 16);
    skin_data add_skin_enum("Battery", "Twitter", 19);
    
    skin_data add_skin_enum("Crash", "Banana", 30);
    skin_data add_skin_enum("Crash", "Blue", 0, 2);
    skin_data add_skin_enum("Crash", "Magnum", 19);
    skin_data add_skin_enum("Crash", "Money", 16);
    for (i = 0; i < nebula_colors.size; i++) {
        skin_data add_skin_enum("Crash", "Nebula " + nebula_colors[i], 9, i);
    }
    skin_data add_skin_enum("Crash", "Number", 14);
    skin_data add_skin_enum("Crash", "Rambo", 20);
    skin_data add_skin_enum("Crash", "Red", 8);
    skin_data add_skin_enum("Crash", "Rigor Mortis", 29);
    skin_data add_skin_enum("Crash", "Spectre", 28);
    skin_data add_skin_enum("Crash", "Twitch", 21);
    skin_data add_skin_enum("Crash", "White", 0, 3, false);

    for (i = 0; i < nebula_colors.size; i++) {
        skin_data add_skin_enum("Firebreak", "Nebula " + nebula_colors[i], 10, i);
    }
    skin_data add_skin_enum("Firebreak", "Money", 17);
    skin_data add_skin_enum("Firebreak", "Number", 14);
    skin_data add_skin_enum("Firebreak", "Rabbit", 15);
    skin_data add_skin_enum("Firebreak", "Silverfish", 9);
    
    skin_data add_skin_enum("Nomad", "80", 16);
    skin_data add_skin_enum("Nomad", "Elvis", 17);
    skin_data add_skin_enum("Nomad", "Money", 15);
    skin_data add_skin_enum("Nomad", "Number", 13);
    skin_data add_skin_enum("Nomad", "Twitch", 20);
    skin_data add_skin_enum("Nomad", "Pirate", 23);
    skin_data add_skin_enum("Nomad", "Werewolf", 31);
    skin_data add_skin_enum("Nomad", "White", 0, 3, false);
    skin_data add_skin_enum("Nomad", "Zombie", 27);
    
    skin_data add_skin_enum("Outrider", "Blank", 19, 1);
    skin_data add_skin_enum("Outrider", "Cheerleader", 14);
    skin_data add_skin_enum("Outrider", "Green", 15);
    skin_data add_skin_enum("Outrider", "Heroes",18);
    skin_data add_skin_enum("Outrider", "Money", 3);
    skin_data add_skin_enum("Outrider", "Number", 4);
    skin_data add_skin_enum("Outrider", "Pink", 19);
    skin_data add_skin_enum("Outrider", "Pirate", 10);
    skin_data add_skin_enum("Outrider", "Red", 1);
    skin_data add_skin_enum("Outrider", "White", 8, false);
    // DO NOT TEST 12

    skin_data add_skin_enum("Prophet", "Money", 16);
    for (i = 0; i < nebula_colors.size; i++) {
        skin_data add_skin_enum("Prophet", "Nebula " + nebula_colors[i], 9, i);
    }
    skin_data add_skin_enum("Prophet", "Number", 14);
    skin_data add_skin_enum("Prophet", "Pirate", 22);
    skin_data add_skin_enum("Prophet", "Plague", 20);
    skin_data add_skin_enum("Prophet", "Space", 28);
    skin_data add_skin_enum("Prophet", "Twitch", 19);
    skin_data add_skin_enum("Prophet", "White", 0, 3, false);

    skin_data add_skin_enum("Reaper", "Spectre", 1);
    skin_data add_skin_enum("Reaper", "Punk", 2);
    skin_data add_skin_enum("Reaper", "Red", 3);
    skin_data add_skin_enum("Reaper", "Number", 4);

    skin_data add_skin_enum("Recon", "Money", 16);
    for (i = 0; i < nebula_colors.size; i++) {
        skin_data add_skin_enum("Recon", "Nebula " + nebula_colors[i], 10, i);
    }
    skin_data add_skin_enum("Recon", "Number", 14);
    skin_data add_skin_enum("Recon", "Fish", 22);
    skin_data add_skin_enum("Recon", "Snake", 20);
    skin_data add_skin_enum("Recon", "Twitch", 19);
    skin_data add_skin_enum("Recon", "White", 0, 3, false);


    skin_data add_skin_enum("Ruin", "Biker", 17);
    skin_data add_skin_enum("Ruin", "Hero", 30);
    skin_data add_skin_enum("Ruin", "Money", 14);
    skin_data add_skin_enum("Ruin", "Muertos", 6);
    for (i = 0; i < nebula_colors.size; i++) {
        skin_data add_skin_enum("Ruin", "Nebula " + nebula_colors[i], 10, i);
    }
    skin_data add_skin_enum("Ruin", "Number", 15);
    skin_data add_skin_enum("Ruin", "Police", 16);
    skin_data add_skin_enum("Ruin", "Twitch", 21);
    skin_data add_skin_enum("Ruin", "White", 0, 3, false);
    skin_data add_skin_enum("Ruin", "Yellow", 22);
    skin_data add_skin_enum("Ruin", "Zombie", 26);
    
    skin_data add_skin_enum("Richtofen (Primis)", "Great war", 2);
    skin_data add_skin_enum("Richtofen (Primis)", "Zombie", 1);
    
    skin_data add_skin_enum("Seraph", "Heist", 17);
    skin_data add_skin_enum("Seraph", "Hero", 30);
    skin_data add_skin_enum("Seraph", "Money", 18);
    for (i = 0; i < nebula_colors.size; i++) {
        skin_data add_skin_enum("Seraph", "Nebula " + nebula_colors[i], 10, i);
    }
    skin_data add_skin_enum("Seraph", "Number", 14);
    skin_data add_skin_enum("Seraph", "Police", 16);
    skin_data add_skin_enum("Seraph", "Red", 0, 2);
    skin_data add_skin_enum("Seraph", "Twitch", 21);
    skin_data add_skin_enum("Seraph", "Vampire", 24);
    skin_data add_skin_enum("Seraph", "White", 0, 3, false);

    skin_data add_skin_enum("Spectre", "Apocalypse Z", 8);
    skin_data add_skin_enum("Spectre", "Hero", 12);
    skin_data add_skin_enum("Spectre", "Japan", 3);
    skin_data add_skin_enum("Spectre", "Number", 4);
    skin_data add_skin_enum("Spectre", "Twitch", 6);
    skin_data add_skin_enum("Spectre", "White", 1, 3, false);

    skin_data add_skin_enum("Torque", "Blue", 0, 1);
    skin_data add_skin_enum("Torque", "Money", 16);
    skin_data add_skin_enum("Torque", "Number", 14);
    skin_data add_skin_enum("Torque", "Twitch", 19);
    skin_data add_skin_enum("Torque", "White", 0, 3, false);
    skin_data add_skin_enum("Torque", "Yellow", 0, 2);
    skin_data add_skin_enum("Torque", "Zombie killer", 21);


    skin_data add_skin_enum("Zero", "Blue", 1);
    skin_data add_skin_enum("Zero", "Dark", 6);
    skin_data add_skin_enum("Zero", "Hero", 23);
    skin_data add_skin_enum("Zero", "Money", 27);
    for (i = 0; i < nebula_colors.size; i++) {
        skin_data add_skin_enum("Zero", "Nebula " + nebula_colors[i], 4, i);
    }
    skin_data add_skin_enum("Zero", "Number", 26);
    skin_data add_skin_enum("Zero", "Pirate", 16);
    skin_data add_skin_enum("Zero", "Twitch", 13);
    skin_data add_skin_enum("Zero", "Water", 14);
    skin_data add_skin_enum("Zero", "White", 0, 3, false);
    skin_data add_skin_enum("Zero", "Zombie", 19);

}

func_set_random_skin(item = undefined) {
    rnd_skin = get_skin_random();
    if (!isdefined(rnd_skin)) {
        self debugln("^1Can't find random skin!");
        return;
    }
    self debugln("^1using skin ^5" + rnd_skin);
    self setspecialistindex(int(rnd_skin[0]));
    self setcharacteroutfit(int(rnd_skin[1]));
    self function_ab96a9b5("palette", int(rnd_skin[2]));
}