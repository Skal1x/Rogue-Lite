for (var i = 0; i < ds_list_size(timer); i++) {
	ds_list_set(timer, i, ds_list_find_value(timer, i) - 1);
	
	if (ds_list_find_value(timer, i) <= 0) {
		ds_list_delete(timer, i);
		ds_list_delete(messages, i);
	}
}