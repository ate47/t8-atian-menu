func_create_big_array(item, count) {
    arr = array();

    for (i = 0; i < count; i++) {
        arr[i] = i;
    }
}
func_create_big_array_hash(item, count) {
    arr = array();

    for (i = 0; i < count; i++) {
        arr["el" + i] = i;
    }
}
func_create_big_array_add(item, count) {
    arr = array();

    for (i = 0; i < count; i++) {
        array::add(arr, i, true);
    }
}