system_add_reqs(target, reqs) {
    if (!isdefined(level.system_funcs[target]) || level.system_funcs[target].ignore) {
        return; // don't care
    }

    sys = level.system_funcs[target];

    if (!isdefined(sys.reqs)) {
        // we put our system(s)
        sys.reqs = reqs;
    } else if (!isarray(sys.reqs)) {
        // convert it to an array
        sys.reqs = array(sys.reqs);
    
        if (isarray(reqs)) {
            foreach (req in reqs) {
                array::add(sys.reqs, req, false);
            }
        } else {
            array::add(sys.reqs, reqs, false);
        }
    }
}

system_all_reqs(reqs) {
    foreach (key, system in level.system_funcs) {
        // avoid recursion
        if (isarray(reqs)) {
            if (array::contains(reqs, key)) {
                continue;
            }
        } else {
            if (reqs == key) {
                continue;
            }
        }

        system_add_reqs(key, reqs);
    }
}
