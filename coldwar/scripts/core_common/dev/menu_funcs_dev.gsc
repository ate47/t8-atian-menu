function func_dev_weap_1(item) {
    weap = getweapon(#"ar_accurate_t9");

    attach = weap.supportedattachments;

    if (!isdefined(attach)) {
        self iprintlnbold("^1Not attachs");
        return;
    }

    i = 0;
    foreach (key, val in attach) {
        self iprintln(i + " - " + val);
        i++;
        if (i % 3 == 0) {
            while (!self key_mgr_has_key_pressed(#"parent_page", true)) { waitframe(1); }
        }
    }
    while (!self key_mgr_has_key_pressed(#"parent_page", true)) { waitframe(1); }
}

function func_dev_weap_2(item) {
    weap = getweapon(#"ar_accurate_t9");

    attach = weap.supportedattachments;

    if (!isdefined(attach) || attach.size < 2) {
        self iprintlnbold("^1Not attachs");
        return;
    }
    
    self giveweapon(getweapon(weap.name, attach[1]));
}