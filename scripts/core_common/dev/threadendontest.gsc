#ifdef _SUPPORTS_THREADENDON

test_thread_endon(it, use_endon, first1) {
    self thread test_thread_endon_main(use_endon);

    if (first1) {
        self iPrintLn("^0waiting for event 2");
        wait 5;
        self iPrintLn("^0killing main2");
        self notify(#"killendonmain2");
        wait 5;
        self iPrintLn("^0killing main1");
        self notify(#"killendonmain1");
    } else {
        self iPrintLn("^0waiting for event 1");
        wait 5;
        self iPrintLn("^0killing main1");
        self notify(#"killendonmain1");
        wait 5;
        self iPrintLn("^0killing main2");
        self notify(#"killendonmain2");
    }
    
    self iPrintLn("^0Waiting remnant");
    wait 6;

    self iPrintLn("done");
}

test_thread_endon_main(use_endon) {
    self endon(#"killendonmain1");
    if (use_endon) {
        self threadendon test_thread_endon_secondary();
    } else {
        self thread test_thread_endon_secondary();
    }
    
    for (i = 0; i < 15; i++) {
        self iPrintLn("hello from main " + i);
        wait 1;
    }
}

test_thread_endon_secondary() {
    self endon(#"killendonmain2");

    for (i = 0; i < 15; i++) {
        self iPrintLn("hello from secondary "  + i);
        wait 1;
    }
}

#else

test_thread_endon(it, val, val2) {
    self menu_drawing_secondary("^1not implemented");
}



#endif