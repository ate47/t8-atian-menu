add_skin_character_enum(character_id, mp, wz, zm) {
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

        return;
    }
    self.characters[character_id] = {
        #id: character_id,
        #mp: mp,
        #wz: wz,
        #zm: zm,
        #invisible: (!mp && !wz && !zm),
        #skins: array()
    };
}
add_skin_enum(character_id, skin_title, skin, palette = 0) {
    skin_item = {
        #title: skin_title,
        #character: character_id,
        #skin: skin,
        #palette: palette
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

generate_skin_enum() {
    if (isdefined(self.skin_data)) {
        return;
    }
    skin_data = {
        #characters: array(),
        #skins: array()
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
    skin_data add_skin_character_enum("Richtofen 2", 0, 0, 29);

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
    skin_data add_skin_character_enum("Price Classic", 0, 71, 0);
    skin_data add_skin_character_enum("Stuhlinger", 0, 72, 0);
    skin_data add_skin_character_enum("Marlton", 0, 73, 0);
    skin_data add_skin_character_enum("Zombies (Joe/Infected)", 0, 74, 0);
    skin_data add_skin_character_enum("Zombies (Jane/Infected)", 0, 75, 0);

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
    skin_data add_skin_character_enum("Zombies (Joe/Infected)", 15, 0, 0);
    skin_data add_skin_character_enum("Zombies (Jane/Infected)", 16, 0, 0);

    // add skin data

    skin_data add_skin_enum("Battery", "Aviator", 25);
    skin_data add_skin_enum("Battery", "Criminal", 21);
    skin_data add_skin_enum("Battery", "Number", 14);
    skin_data add_skin_enum("Battery", "Money", 16);
    skin_data add_skin_enum("Battery", "Twitter", 19);
    
    skin_data add_skin_enum("Firebreak", "Nebula", 10);
    skin_data add_skin_enum("Firebreak", "Money", 17);
    skin_data add_skin_enum("Firebreak", "Number", 14);
    skin_data add_skin_enum("Firebreak", "Rabbit", 15);
    skin_data add_skin_enum("Firebreak", "Silverfish", 9);
    
    skin_data add_skin_enum("Outrider", "Blank", 19, 1);
    skin_data add_skin_enum("Outrider", "Cheerleader", 14);
    skin_data add_skin_enum("Outrider", "Green", 15);
    skin_data add_skin_enum("Outrider", "Heroes",18);
    skin_data add_skin_enum("Outrider", "Money", 3);
    skin_data add_skin_enum("Outrider", "Number", 4);
    skin_data add_skin_enum("Outrider", "Pink", 19);
    skin_data add_skin_enum("Outrider", "Pirate", 10);
    skin_data add_skin_enum("Outrider", "Red", 1);
    skin_data add_skin_enum("Outrider", "White", 8);
    // DO NOT TEST 12

    skin_data add_skin_enum("Reaper", "Spectre", 1);
    skin_data add_skin_enum("Reaper", "Punk", 2);
    skin_data add_skin_enum("Reaper", "Red", 3);
    skin_data add_skin_enum("Reaper", "Number", 4);
    
    skin_data add_skin_enum("Richtofen (Primis)", "Great war", 2);
    skin_data add_skin_enum("Richtofen (Primis)", "Zombie", 1);
    
    skin_data add_skin_enum("Torque", "Blue", 0, 1);
    skin_data add_skin_enum("Torque", "Money", 16);
    skin_data add_skin_enum("Torque", "Number", 14);
    skin_data add_skin_enum("Torque", "Twitch", 19);
    skin_data add_skin_enum("Torque", "White", 0, 3);
    skin_data add_skin_enum("Torque", "Yellow", 0, 2);
    skin_data add_skin_enum("Torque", "Zombie killer", 21);

    skin_data add_skin_enum("Crash", "Banana", 30);
    skin_data add_skin_enum("Crash", "Blue", 0, 2);
    skin_data add_skin_enum("Crash", "Magnum", 19);
    skin_data add_skin_enum("Crash", "Money", 16);
    skin_data add_skin_enum("Crash", "Nebula", 9);
    skin_data add_skin_enum("Crash", "Number", 14);
    skin_data add_skin_enum("Crash", "Rambo", 20);
    skin_data add_skin_enum("Crash", "Red", 8);
    skin_data add_skin_enum("Crash", "Rigor Mortis", 29);
    skin_data add_skin_enum("Crash", "Spectre", 28);
    skin_data add_skin_enum("Crash", "Twitch", 21);
    skin_data add_skin_enum("Crash", "White", 0, 3);
}