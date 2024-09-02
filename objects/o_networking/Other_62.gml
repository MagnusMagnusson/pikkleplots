if(ds_map_find_value(async_load, "id") == load_prinkle_list){
	if(ds_map_find_value(async_load, "status") == 0){
		var data = ds_map_find_value(async_load, "result");
		var json = json_parse(data);
		global.network_prinkles = json[$"prinkles"];
		if(!is_undefined(load_prinkle_callback)){
			load_prinkle_callback();
		}
	}
} else if (ds_map_find_value(async_load, "id") == load_prinkle_world){
		if(ds_map_find_value(async_load, "status") == 0){
		if(!is_undefined(load_prinkle_world_callback)){
			load_prinkle_world_callback();
		}
	}
} else if (ds_map_find_value(async_load, "id") == save_to_cloud_id){
	var data = ds_map_find_value(async_load, "result");
}