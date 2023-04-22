add_camo_category_enum(category_id, category_name) {
    self generate_camo_enum();

    camo_data = self.camo_data;
    camo_data.categories[category_id] = {
        #id: category_id,
        #name: category_name,
        #camos: array()
    };
}
add_camo_enum(camo_category_id, camo_title, camo_id) {
    self generate_camo_enum();

    camo_data = self.camo_data;

    camo_item = {
        #title: camo_title,
        #category: camo_category_id,
        #id: camo_id
    };
    array::add(camo_data.camos, camo_item, true);

    cat_item = camo_data.categories[camo_category_id];
    if (isdefined(cat_item)) {
        array::add(cat_item.camos, camo_item, true);
    }
}

get_camo_enum_data() {
    generate_enum_values();
    return level.atian_enum_data.camo_data;
}

generate_camo_enum() {
    if (isdefined(self.camo_data)) {
        return;
    }
    self.camo_data = {
        #categories: array(),
        #camos: array()
    };
    return;
    // register the categories
    self add_camo_category_enum("master", "Mastery");
    self add_camo_category_enum("pap", "Pack a punch");
    self add_camo_category_enum("blackjack_reactive", "Black market (Reactive)");
    self add_camo_category_enum("blackjack", "Black market");
    self add_camo_category_enum("mp", "Multiplayer");
    self add_camo_category_enum("zm", "Zombies");
    self add_camo_category_enum("wz", "Blackout");


    // multiplayer
    for (i = 1; i < 43; i += 3) {
        self add_camo_enum("mp", "Generic MP " + i, i);
    }

    // blackout
    for (i = 2; i < 43; i += 3) {
        self add_camo_enum("wz", "Generic BR " + i, i);
    }

    // zombies
    for (i = 3; i < 43; i += 3) {
        self add_camo_enum("zm", "Generic ZM " + i, i);
    }

    // mastery
    self add_camo_enum("master", "Gold", 43);
    self add_camo_enum("master", "Diamond", 44);
    self add_camo_enum("master", "Dark matter", 45);
    
    // Pack a punch
    self add_camo_enum("pap", "Voyage of despair purple", 146);
    self add_camo_enum("pap", "Voyage of despair red", 147);
    self add_camo_enum("pap", "Voyage of despair green", 148);
    self add_camo_enum("pap", "Voyage of despair yellow", 149);
    self add_camo_enum("pap", "Voyage of despair pink", 150);
    self add_camo_enum("pap", "IX blue", 151);
    self add_camo_enum("pap", "IX red", 152);
    self add_camo_enum("pap", "IX green", 153);
    self add_camo_enum("pap", "IX purple", 154);
    self add_camo_enum("pap", "IX orange", 155);
    self add_camo_enum("pap", "Blood of the Dead yellow", 156);
    self add_camo_enum("pap", "Blood of the Dead red", 157);
    self add_camo_enum("pap", "Blood of the Dead yellow", 158);
    self add_camo_enum("pap", "Blood of the Dead green", 159);
    self add_camo_enum("pap", "Blood of the Dead purple", 160);
    self add_camo_enum("pap", "Classified 1", 161);
    self add_camo_enum("pap", "Classified 2", 162);
    self add_camo_enum("pap", "Classified 3", 163);
    self add_camo_enum("pap", "Classified 4", 164);
    self add_camo_enum("pap", "Classified 5", 165);
    self add_camo_enum("pap", "Dead of the night green", 280);
    self add_camo_enum("pap", "Dead of the night purple", 281);
    self add_camo_enum("pap", "Dead of the night red", 282);
    self add_camo_enum("pap", "Dead of the night blue", 283);
    self add_camo_enum("pap", "Dead of the night orange", 284);
    self add_camo_enum("pap", "Ancien Evil purple", 74);
    self add_camo_enum("pap", "Ancien Evil blue", 75);
    self add_camo_enum("pap", "Ancien Evil orange", 76);
    self add_camo_enum("pap", "Ancien Evil yellow", 77);
    self add_camo_enum("pap", "Ancien Evil green", 78);
    self add_camo_enum("pap", "Alpha Omega", 345);
    self add_camo_enum("pap", "Tag der toten", 394);

    // blackjack (reactive)
    self add_camo_enum("blackjack_reactive", "D-Day", 298);
    self add_camo_enum("blackjack_reactive", "Roadtrip", 300);
    self add_camo_enum("blackjack_reactive", "Masked", 310);
    self add_camo_enum("blackjack_reactive", "Bobine", 52);
    self add_camo_enum("blackjack_reactive", "Search", 57);
    self add_camo_enum("blackjack_reactive", "Strip", 62);
    self add_camo_enum("blackjack_reactive", "Rave", 67);
    self add_camo_enum("blackjack_reactive", "Nebula", 89);
    self add_camo_enum("blackjack_reactive", "After life", 90);
    self add_camo_enum("blackjack_reactive", "Postluminescence", 119);
    self add_camo_enum("blackjack_reactive", "115", 129);
    self add_camo_enum("blackjack_reactive", "Grey matter", 131);
    self add_camo_enum("blackjack_reactive", "Denied access (waifu)", 167);
    self add_camo_enum("blackjack_reactive", "Skull", 168);
    self add_camo_enum("blackjack_reactive", "Solar eruption", 381);
    self add_camo_enum("blackjack_reactive", "Vision of the future", 387);
    self add_camo_enum("blackjack_reactive", "Pestilence", 389);
    self add_camo_enum("blackjack_reactive", "Crypted", 286);
    self add_camo_enum("blackjack_reactive", "Judas", 357);
    self add_camo_enum("blackjack_reactive", "Incandescent", 359);
    self add_camo_enum("blackjack_reactive", "Encoded", 363);

    // blackjack
    self add_camo_enum("blackjack", "Twitch 1", 79);
    self add_camo_enum("blackjack", "Twitch 2", 118);
    self add_camo_enum("blackjack", "$", 46);
    self add_camo_enum("blackjack", "Green course", 47);
    self add_camo_enum("blackjack", "Blue", 48);
    self add_camo_enum("blackjack", "Kiss", 49);
    self add_camo_enum("blackjack", "Fortuna", 50);
    self add_camo_enum("blackjack", "Donuts", 51);
    self add_camo_enum("blackjack", "Serment", 80);
    self add_camo_enum("blackjack", "Imbu", 81);
    self add_camo_enum("blackjack", "Megalodon", 82);
    self add_camo_enum("blackjack", "Surf", 83);
    self add_camo_enum("blackjack", "Goinfre", 84);
    self add_camo_enum("blackjack", "Chrysalide", 86);
    self add_camo_enum("blackjack", "Locker", 87);
    self add_camo_enum("blackjack", "Bacon", 117);
    self add_camo_enum("blackjack", "Dead time", 120);
    self add_camo_enum("blackjack", "Dirty buble", 121);
    self add_camo_enum("blackjack", "Heaven", 122);
    self add_camo_enum("blackjack", "Pique nique royal", 123);
    self add_camo_enum("blackjack", "Mai Tai Zombie", 124);
    self add_camo_enum("blackjack", "Heaven", 122);
    self add_camo_enum("blackjack", "Colonne piégée", 126);
    self add_camo_enum("blackjack", "Derezzed", 134);
    self add_camo_enum("blackjack", "Steam explosion", 135);
    self add_camo_enum("blackjack", "Goinfre", 136);
    self add_camo_enum("blackjack", "Arabesque", 137);
    self add_camo_enum("blackjack", "Se sentir visé", 166);
    self add_camo_enum("blackjack", "Rampage", 170);
    self add_camo_enum("blackjack", "Soul eater", 171);
    self add_camo_enum("blackjack", "Marathon", 172);
    self add_camo_enum("blackjack", "Avant garde", 173);
    self add_camo_enum("blackjack", "Plasma", 293);
    self add_camo_enum("blackjack", "Air fight", 305);
    self add_camo_enum("blackjack", "Cherry", 314);
    self add_camo_enum("blackjack", "Gigakiller", 315);
    self add_camo_enum("blackjack", "Flicker", 316);
    self add_camo_enum("blackjack", "Rocket box", 317);
    self add_camo_enum("blackjack", "USA", 346);
    self add_camo_enum("blackjack", "Juicy", 347);
    self add_camo_enum("blackjack", "Glyph", 348);
    self add_camo_enum("blackjack", "Gratte-gratte", 350);
    self add_camo_enum("blackjack", "Flocon", 351);
    self add_camo_enum("blackjack", "Vertige", 353);
    self add_camo_enum("blackjack", "High tension", 354);
    self add_camo_enum("blackjack", "Gluant", 355);


}