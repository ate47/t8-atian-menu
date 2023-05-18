generate_enum_values() {
    if (isdefined(level.atian_enum_data)) {
        return;
    }

    level.atian_enum_data = spawnstruct();
    level.atian_enum_data generate_camo_enum();
    level.atian_enum_data generate_skin_enum();
    level.atian_enum_data generate_mastercraft_enum();
    level.atian_enum_data generate_weapon_enum();
    level.atian_enum_data generate_wzitems_enum();
}

