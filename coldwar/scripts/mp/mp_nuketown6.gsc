function init_mp_nuketown6() {
    // hash_269852f320baca83 xmas
    // hash_435b3a7c7c2f2c07 halloween

    if (isdefined(level.atianconfig.nuketown_event)) {
        setdvar(#"hash_269852f320baca83", 0);
        setdvar(#"hash_269852f320baca83", 0);
        switch (level.atianconfig.nuketown_event) {
            case #"xmas":
                setdvar(#"hash_269852f320baca83", 1);
                break;
            case #"halloween":
                setdvar(#"hash_435b3a7c7c2f2c07", 1);
                break;
        }
    }
}

