function save(name, _id = undefined, prinkle = undefined, noWorld = false){	
	var buff = buffer_create(4, buffer_grow, 4);
	hash = current_time & 0xFFFFFFFF;
	if(is_undefined(_id)){
		_id = irandom(0xFFFFFFFF);
	}
	buffer_write(buff, buffer_string, "prinkle");
	buffer_write(buff, buffer_f32, current_time & 0xFFFFFFFF);
	hash ^= save_version;
	buffer_write(buff, buffer_f8, save_version);
	hash ^= _id;
	buffer_write(buff, buffer_f32, _id);
	if(is_undefined(prinkle)){
		prinkle = scr_prinkle();
	}
	
	if(!noWorld){
	} else {
	}
}