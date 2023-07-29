autoexec_simple() {
	system::register("atianmenu", &__init_simple__, &__post__init_simple__, undefined);
	
#ifdef ATIANMENU_DETOURS
    init_detours();
#endif
}

__init_simple__() {

}

__post__init_simple__() {
    
}