autoexec_simple() {
	system::register("atianmenu", &__init_simple__, &__post__init_simple__, undefined);
	
    init_detours();
}

__init_simple__() {

}

__post__init_simple__() {
    
}