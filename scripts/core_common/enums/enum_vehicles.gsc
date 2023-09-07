
add_vehicle_info(vehicle_name, vehicle_title) {
    if (!isassetloaded("vehicle", vehicle_name) || isdefined(self.vehicles[vehicle_name])) {
        return; // vehicle not loaded or already in the enum
    }

    vehicle_data = {
        #name: vehicle_name,
        #title: vehicle_title
    };

    self.vehicles[vehicle_name] = vehicle_data;
}

get_vehicles_enum_data() {
    if (!isdefined(level.atian_enum_data)) {
        generate_enum_values();
    }
    return level.atian_enum_data.vehicles;
}

generate_wzvehicle_enum() {
    if (isdefined(self.vehicles)) {
        return;
    }

    vehicles = {
        #vehicles: array()
    };
    self.vehicles = vehicles;
    vehicles add_vehicle_info(#"hash_50df12a3f608295f", "Cargo dark");
    vehicles add_vehicle_info(#"hash_2321fdb723c1833e", "Cargo green");
    vehicles add_vehicle_info(#"hash_1207be62f5586002", "Cargo grey");
    vehicles add_vehicle_info(#"hash_9c4bbd4ed2ab01a", "Zodiac 1");
    vehicles add_vehicle_info(#"hash_262b20d4fdef3691", "Zodiac 2");
    vehicles add_vehicle_info(#"hash_5e74d2d4d4a1d9dd", "Zodiac 3");
    vehicles add_vehicle_info(#"hash_232aa3a4e81249c6", "ATV 1");
    vehicles add_vehicle_info(#"hash_1d6e04a52d9a5fe2", "ATV 2");
    vehicles add_vehicle_info(#"hash_7acdf9a4d20bca08", "ATV Green");
    vehicles add_vehicle_info(#"hash_2c40642bbbab460d", "ATV Police");
    vehicles add_vehicle_info(#"hash_1a7b0eaf3ae726cd", "Helicopter police");
    vehicles add_vehicle_info(#"hash_ec710c12a11ba1b", "Helicopter hero");
    vehicles add_vehicle_info(#"hash_371dca31a8d2a390", "Helicopter 1");
    vehicles add_vehicle_info(#"hash_1f38eb47b13ae0a2", "Helicopter 2");
    vehicles add_vehicle_info(#"hash_7473bb4a4fe9a17f", "Helicopter 3");
    vehicles add_vehicle_info(#"hash_a32b2557c188dbe", "Helicopter 4");
    vehicles add_vehicle_info(#"hash_15f6b46a381e7007", "Arav hero");
    vehicles add_vehicle_info(#"hash_32e2d28d167e8e92", "Arav 1");
    vehicles add_vehicle_info(#"hash_4c1a688d248f81bc", "Arav 2");
    vehicles add_vehicle_info(#"hash_6eba738d801e1796", "Arav 3");
    vehicles add_vehicle_info("veh_muscle_car_convertible_player_wz_replacer", "Muscle car replacer");
    vehicles add_vehicle_info(#"hash_4e73f59c7e21ce5a", "Muscle car heist");
    vehicles add_vehicle_info(#"hash_769bc3a07e8bc079", "Muscle car hero");
    vehicles add_vehicle_info(#"hash_2f8f4f949bf9ac15", "Muscle car blue");
    vehicles add_vehicle_info(#"hash_15ddcb948d817b45", "Muscle car green");
    vehicles add_vehicle_info(#"hash_516b7a9466fa5c12", "Muscle car orange");
    vehicles add_vehicle_info(#"hash_25efdc944e4cca5b", "Muscle car red");
    vehicles add_vehicle_info(#"hash_cd755944056a13d", "Muscle car white");
    vehicles add_vehicle_info(#"hash_56e75c94213b20da", "Muscle car yellow");
    vehicles add_vehicle_info(#"hash_2f8f41949bf9944b", "Muscle car black");
    vehicles add_vehicle_info(#"hash_2da622f0e5b37c60", "Muscle car green 2");
    vehicles add_vehicle_info(#"hash_54469210eb79f8fa", "Suv Police");
    vehicles add_vehicle_info(#"hash_fd30bfe9c72da01", "SUV black");
    vehicles add_vehicle_info(#"hash_762e82fe8e052b0e", "SUV grey");
    vehicles add_vehicle_info(#"hash_6a5a5607b259798f", "SUV silver");
    vehicles add_vehicle_info(#"hash_6d35ebfe40e6564f", "SUV white");
    vehicles add_vehicle_info(#"hash_2e86e4a61f2237f6", "SUV black light");
    vehicles add_vehicle_info(#"hash_660785b539889002", "Tank dark grey");
    vehicles add_vehicle_info(#"hash_54bf3cd56e8c5c4a", "Tank green");
    vehicles add_vehicle_info(#"hash_6fdb3b0114439974", "Tank light grey");
    vehicles add_vehicle_info(#"hash_327d1f9834b6b91e", "Tank white");
    vehicles add_vehicle_info(#"hash_6125436f40323d0c", "Motorcycle white");
    vehicles add_vehicle_info(#"hash_27cb5ec4239072e2", "Motorcycle grey");
    vehicles add_vehicle_info(#"hash_1420be7cd22fba24", "Motorcycle green");
    vehicles add_vehicle_info(#"hash_7450e3a35eaf7c7d", "Motorcycle dark");
    vehicles add_vehicle_info(#"hash_187ccca8e5fca987", "Motorcycle grey");
    vehicles add_vehicle_info(#"hash_187ccca8e5fca987", "Motorcycle black");
    vehicles add_vehicle_info(#"hash_7709d71ab3699f7e", "Motorcycle dark");
    vehicles add_vehicle_info(#"hash_132ff84412bc229", "Motorcycle hero");
    vehicles add_vehicle_info(#"hash_5a8d85277c6e81cc", "PBR Police");
    vehicles add_vehicle_info(#"hash_2466ddfe7224bda1", "PBR Black");
    vehicles add_vehicle_info(#"hash_559a470c57ff48f1", "PBR Green");
    vehicles add_vehicle_info(#"hash_7c419239b3b272a1", "PBR Blue");
    vehicles add_vehicle_info(#"hash_750e85ddbd818361", "PBR Yellow");
    vehicles add_vehicle_info(#"hash_6bb2c4db63712ba6", "Attack Helicopter Dark 1");
    vehicles add_vehicle_info(#"hash_2a3f3e38128fc907", "Attack Helicopter Dark 2");
    vehicles add_vehicle_info(#"hash_5aaa847b9e03f876", "Attack Helicopter Dark 3");
    vehicles add_vehicle_info(#"hash_18fa6d20a6e8fa78", "Attack Helicopter Clear 1");
    vehicles add_vehicle_info(#"hash_5b0fb5b643c105fa", "Attack Helicopter Clear 2");
    vehicles add_vehicle_info(#"vehicle_zmb_air_alcatraz_plane", "Icarus");
    vehicles add_vehicle_info(#"vehicle_t8_mil_helicopter_transport_dark_wz", "Drop helicopter");
    vehicles add_vehicle_info(#"vehicle_t8_mil_air_transport_infiltration", "Drop plane");
    vehicles add_vehicle_info(#"veh_ultimate_turret_wz", "Turret");
    

    vehicleassets = function_951b4205(); // return undefined

    if (isdefined(vehicleassets) && isarray(vehicleassets)) {
        for (i = 0; i < vehicleassets.size; i++) {
            if (isdefined(vehicleassets[i])) {
                vehicles add_vehicle_info(vehicleassets[i].name, "" + vehicleassets[i].name);
            }
        }
    }

    vehicles add_vehicle_info(#"hash_2db015dc967ccf56", "Elephant shot 1");
    vehicles add_vehicle_info(#"hash_6be593a62b8b87a5", "Elephant shot 2");
    vehicles add_vehicle_info(#"spawner_bo3_mini_raps", "spawner_bo3_mini_raps");
    vehicles add_vehicle_info(#"spawner_bo3_wasp_enemy", "spawner_bo3_wasp_enemy");
    vehicles add_vehicle_info(#"archetype_mini_quadtank_mp", "archetype_mini_quadtank_mp");
    vehicles add_vehicle_info(#"veh_flak_drone_mp", "Turret");
    vehicles add_vehicle_info(#"qrdrone_mp", "qrdrone_mp");
    vehicles add_vehicle_info(#"veh_ultimate_turret_cp", "veh_ultimate_turret_cp");
    vehicles add_vehicle_info(#"veh_ultimate_turret", "veh_ultimate_turret");
    vehicles add_vehicle_info(#"vehicle_t8_mil_helicopter_swat_transport", "vehicle_t8_mil_helicopter_swat_transport");
    vehicles add_vehicle_info(#"vehicle_t8_mil_helicopter_transport_dark_wz_infiltration", "vehicle_t8_mil_helicopter_transport_dark_wz_infiltration");
    // vehicles add_vehicle_info(#"veh_seeker_mine_mp", "veh_seeker_mine_mp"); // stack overflow
    vehicles add_vehicle_info(#"veh_dart_wz", "veh_dart_wz");
    vehicles add_vehicle_info(#"veh_hawk_player_wz", "veh_hawk_player_wz");
    //vehicles add_vehicle_info(#"veh_mini_turret_zm", "veh_mini_turret_zm");
    vehicles add_vehicle_info(#"hash_77ac4aa97a8b5aa2", "hash_77ac4aa97a8b5aa2");
    vehicles add_vehicle_info(#"hash_232abda4e81275f4", "hash_232abda4e81275f4");
    vehicles add_vehicle_info(#"hash_2f8d60a5381870ee", "hash_2f8d60a5381870ee");
    vehicles add_vehicle_info(#"hash_482e864157620248", "hash_482e864157620248");
    vehicles add_vehicle_info(#"hash_1d37bc413f25898e", "hash_1d37bc413f25898e");
    vehicles add_vehicle_info(#"hash_1d37af413f257377", "hash_1d37af413f257377");
    vehicles add_vehicle_info(#"hash_8ea0340ead96490", "hash_8ea0340ead96490");
    vehicles add_vehicle_info(#"hash_79bf6a7491c80c7", "hash_79bf6a7491c80c7");
    vehicles add_vehicle_info(#"hash_32e4c0a7619f03a9", "hash_32e4c0a7619f03a9");
    vehicles add_vehicle_info(#"hash_22d9b5a7a0d9dd73", "hash_22d9b5a7a0d9dd73");
    vehicles add_vehicle_info(#"hash_275b12ca9b3cc010", "hash_275b12ca9b3cc010");

    vehicles add_vehicle_info(#"veh_dart_mp", "Dart");
    vehicles add_vehicle_info(#"veh_drone_squadron_mp", "Drone squadron");
    vehicles add_vehicle_info(#"spawner_boct_mp_wing_drone", "Drone squadron (Wing)");
    vehicles add_vehicle_info(#"vehicle_t8_mil_helicopter_transport_mp", "Transport helicopter");
    vehicles add_vehicle_info(#"vehicle_t8_mil_helicopter_transport_mp_escort", "Transport helicopter (Escort)");
    vehicles add_vehicle_info(#"archetype_mini_quadtank_ct", "Mantis (CT)");
    vehicles add_vehicle_info(#"veh_t8_helicopter_gunship_mp", "Attack helicopter");
    vehicles add_vehicle_info(#"vehicle_straferun_mp", "Straferun A-10");
    vehicles add_vehicle_info(#"veh_t8_ac130_gunship_mp", "Gunship");
    vehicles add_vehicle_info(#"veh_bo3_mil_gunship_mp", "Mothership");
    vehicles add_vehicle_info(#"vehicle_t8_drone_recon", "UAV");
    vehicles add_vehicle_info(#"vehicle_t8_drone_cuav_mp", "C-UAV");
    vehicles add_vehicle_info(#"vehicle_t8_mil_helicopter_overwatch", "Helicopter");

}
