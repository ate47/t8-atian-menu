add_camo_category_enum(category_id, category_name) {
    self.categories[category_id] = {
        #id: category_id,
        #name: category_name,
        #camos: array()
    };
}
add_camo_enum(camo_category_id, camo_title, camo_id) {
    camo_item = {
        #title: camo_title,
        #category: camo_category_id,
        #id: camo_id
    };
    array::add(self.camos, camo_item, true);

    cat_item = self.categories[camo_category_id];
    if (isdefined(cat_item)) {
        array::add(cat_item.camos, camo_item, true);
    }
}

get_camo_enum_data() {
    if (!isdefined(level.atian_enum_data)) {
        generate_enum_values();
    }
    return level.atian_enum_data.camo_data;
}

generate_camo_enum() {
    if (isdefined(self.camo_data)) {
        return;
    }
    camo_data = {
        #categories: array(),
        #camos: array()
    };
    self.camo_data = camo_data;

    // register the categories
    camo_data add_camo_category_enum("master", "Mastery");
    camo_data add_camo_category_enum("pap", "Pack a punch");
    camo_data add_camo_category_enum("blackjack_reactive", "Black market (Reactive)");
    camo_data add_camo_category_enum("blackjack", "Black market");
    camo_data add_camo_category_enum("mp", "Multiplayer");
    camo_data add_camo_category_enum("zm", "Zombies");
    camo_data add_camo_category_enum("wz", "Blackout");

    // multiplayer
    for (i = 1; i < 43; i += 3) {
        camo_data add_camo_enum("mp", "Generic MP " + int(1 + i / 3), i);
    }

    // blackout
    for (i = 2; i < 43; i += 3) {
        camo_data add_camo_enum("wz", "Generic BR " + int(1 + i / 3), i);
    }

    // zombies
    for (i = 3; i < 43; i += 3) {
        camo_data add_camo_enum("zm", "Generic ZM " + int(i / 3), i);
    }

    // mastery
    camo_data add_camo_enum("master", "Gold", 43);
    camo_data add_camo_enum("master", "Diamond", 44);
    camo_data add_camo_enum("master", "Dark matter", 45);
    
    // Pack a punch
    camo_data add_camo_enum("pap", "Voyage of despair purple", 146);
    camo_data add_camo_enum("pap", "Voyage of despair red", 147);
    camo_data add_camo_enum("pap", "Voyage of despair green", 148);
    camo_data add_camo_enum("pap", "Voyage of despair yellow", 149);
    camo_data add_camo_enum("pap", "Voyage of despair pink", 150);
    camo_data add_camo_enum("pap", "IX blue", 151);
    camo_data add_camo_enum("pap", "IX red", 152);
    camo_data add_camo_enum("pap", "IX green", 153);
    camo_data add_camo_enum("pap", "IX purple", 154);
    camo_data add_camo_enum("pap", "IX orange", 155);
    camo_data add_camo_enum("pap", "Blood of the Dead yellow", 156);
    camo_data add_camo_enum("pap", "Blood of the Dead red", 157);
    camo_data add_camo_enum("pap", "Blood of the Dead yellow", 158);
    camo_data add_camo_enum("pap", "Blood of the Dead green", 159);
    camo_data add_camo_enum("pap", "Blood of the Dead purple", 160);
    camo_data add_camo_enum("pap", "Classified 1", 161);
    camo_data add_camo_enum("pap", "Classified 2", 162);
    camo_data add_camo_enum("pap", "Classified 3", 163);
    camo_data add_camo_enum("pap", "Classified 4", 164);
    camo_data add_camo_enum("pap", "Classified 5", 165);
    camo_data add_camo_enum("pap", "Dead of the night green", 280);
    camo_data add_camo_enum("pap", "Dead of the night purple", 281);
    camo_data add_camo_enum("pap", "Dead of the night red", 282);
    camo_data add_camo_enum("pap", "Dead of the night blue", 283);
    camo_data add_camo_enum("pap", "Dead of the night orange", 284);
    camo_data add_camo_enum("pap", "Ancien Evil purple", 74);
    camo_data add_camo_enum("pap", "Ancien Evil blue", 75);
    camo_data add_camo_enum("pap", "Ancien Evil orange", 76);
    camo_data add_camo_enum("pap", "Ancien Evil yellow", 77);
    camo_data add_camo_enum("pap", "Ancien Evil green", 78);
    camo_data add_camo_enum("pap", "Alpha Omega", 345);
    camo_data add_camo_enum("pap", "Tag der toten", 394);

    // blackjack (reactive)
    camo_data add_camo_enum("blackjack_reactive", "D-Day", 298);
    camo_data add_camo_enum("blackjack_reactive", "Roadtrip", 300);
    camo_data add_camo_enum("blackjack_reactive", "Masked", 310);
    camo_data add_camo_enum("blackjack_reactive", "Bobine", 52);
    camo_data add_camo_enum("blackjack_reactive", "Search", 57);
    camo_data add_camo_enum("blackjack_reactive", "Strip", 62);
    camo_data add_camo_enum("blackjack_reactive", "Rave", 67);
    camo_data add_camo_enum("blackjack_reactive", "Nebula", 89);
    camo_data add_camo_enum("blackjack_reactive", "After life", 90);
    camo_data add_camo_enum("blackjack_reactive", "Postluminescence", 119);
    camo_data add_camo_enum("blackjack_reactive", "115", 129);
    camo_data add_camo_enum("blackjack_reactive", "Grey matter", 131);
    camo_data add_camo_enum("blackjack_reactive", "Denied access (waifu)", 167);
    camo_data add_camo_enum("blackjack_reactive", "Skull", 168);
    camo_data add_camo_enum("blackjack_reactive", "Solar eruption", 381);
    camo_data add_camo_enum("blackjack_reactive", "Vision of the future", 387);
    camo_data add_camo_enum("blackjack_reactive", "Pestilence", 389);
    camo_data add_camo_enum("blackjack_reactive", "Crypted", 286);
    camo_data add_camo_enum("blackjack_reactive", "Judas", 357);
    camo_data add_camo_enum("blackjack_reactive", "Incandescent", 359);
    camo_data add_camo_enum("blackjack_reactive", "Encoded", 363);

    // blackjack
    camo_data add_camo_enum("blackjack", "Twitch 1", 79);
    camo_data add_camo_enum("blackjack", "Twitch 2", 118);
    camo_data add_camo_enum("blackjack", "$", 46);
    camo_data add_camo_enum("blackjack", "Green course", 47);
    camo_data add_camo_enum("blackjack", "Blue", 48);
    camo_data add_camo_enum("blackjack", "Kiss", 49);
    camo_data add_camo_enum("blackjack", "Fortuna", 50);
    camo_data add_camo_enum("blackjack", "Donuts", 51);
    camo_data add_camo_enum("blackjack", "Serment", 80);
    camo_data add_camo_enum("blackjack", "Imbu", 81);
    camo_data add_camo_enum("blackjack", "Megalodon", 82);
    camo_data add_camo_enum("blackjack", "Surf", 83);
    camo_data add_camo_enum("blackjack", "Goinfre", 84);
    camo_data add_camo_enum("blackjack", "Chrysalide", 86);
    camo_data add_camo_enum("blackjack", "Locker", 87);
    camo_data add_camo_enum("blackjack", "Bacon", 117);
    camo_data add_camo_enum("blackjack", "Dead time", 120);
    camo_data add_camo_enum("blackjack", "Dirty buble", 121);
    camo_data add_camo_enum("blackjack", "Heaven", 122);
    camo_data add_camo_enum("blackjack", "Pique nique royal", 123);
    camo_data add_camo_enum("blackjack", "Mai Tai Zombie", 124);
    camo_data add_camo_enum("blackjack", "Heaven", 122);
    camo_data add_camo_enum("blackjack", "Colonne piégée", 126);
    camo_data add_camo_enum("blackjack", "Derezzed", 134);
    camo_data add_camo_enum("blackjack", "Steam explosion", 135);
    camo_data add_camo_enum("blackjack", "Goinfre", 136);
    camo_data add_camo_enum("blackjack", "Arabesque", 137);
    camo_data add_camo_enum("blackjack", "Se sentir visé", 166);
    camo_data add_camo_enum("blackjack", "Rampage", 170);
    camo_data add_camo_enum("blackjack", "Soul eater", 171);
    camo_data add_camo_enum("blackjack", "Marathon", 172);
    camo_data add_camo_enum("blackjack", "Avant garde", 173);
    camo_data add_camo_enum("blackjack", "Plasma", 293);
    camo_data add_camo_enum("blackjack", "Air fight", 305);
    camo_data add_camo_enum("blackjack", "Cherry", 314);
    camo_data add_camo_enum("blackjack", "Gigakiller", 315);
    camo_data add_camo_enum("blackjack", "Flicker", 316);
    camo_data add_camo_enum("blackjack", "Rocket box", 317);
    camo_data add_camo_enum("blackjack", "USA", 346);
    camo_data add_camo_enum("blackjack", "Juicy", 347);
    camo_data add_camo_enum("blackjack", "Glyph", 348);
    camo_data add_camo_enum("blackjack", "Gratte-gratte", 350);
    camo_data add_camo_enum("blackjack", "Flocon", 351);
    camo_data add_camo_enum("blackjack", "Vertige", 353);
    camo_data add_camo_enum("blackjack", "High tension", 354);
    camo_data add_camo_enum("blackjack", "Gluant", 355);


}