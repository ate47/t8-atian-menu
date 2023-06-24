
set_door_price(new_price) {
    set_entarray_elem_price(getentarray("zombie_door", "targetname"), new_price);
    set_entarray_elem_price(getentarray("zombie_debris", "targetname"), new_price);
}

set_magixbox_price(new_price) {
    set_entarray_elem_price(struct::get_array("treasure_chest_use", "targetname"), new_price);
}

set_fasttravel_price(new_price) {
    set_entarray_elem_price(struct::get_array("fasttravel_trigger", "targetname"), new_price);
}

set_entarray_elem_price(entarray, new_price) {
    if (!isdefined(entarray)) {
        return;
    }
    if (!isdefined(new_price)) {
        foreach(ent in entarray) {
            if (isdefined(ent.am_oldprice)) {
                ent.zombie_cost = ent.am_oldprice;
                ent.am_oldprice = undefined;
            }
        }
    } else if (isfunctionptr(new_price)) {
        foreach(ent in entarray) {
            if (!isdefined(ent.am_oldprice)) {
                ent.am_oldprice = ent.zombie_cost;
            }
            ent.zombie_cost = int([[ new_price ]](ent.zombie_cost));
        }
    } else {
        foreach(ent in entarray) {
            if (!isdefined(ent.am_oldprice)) {
                ent.am_oldprice = ent.zombie_cost;
            }
            ent.zombie_cost = int(new_price);
        }
    }
}
