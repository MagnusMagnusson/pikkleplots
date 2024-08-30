function save(name, _id = undefined, prinkle = undefined, noWorld = false){	
	var buff = buffer_create(1, buffer_grow, 1);
	hash = current_time & 0xFFFFFFFF;
	if(is_undefined(_id)){
		_id = irandom(0xFFFFFFFF);
	}
	buffer_write(buff, buffer_string, "Prinkle");
	buffer_write(buff, buffer_u32, hash);
	hash ^= save_version;
	buffer_write(buff, buffer_u8, save_version);
	hash ^= _id;
	buffer_write(buff, buffer_u32, _id);
	buffer_write(buff, buffer_string, name);
	if(is_undefined(prinkle)){
		prinkle = new Prinkle();
		prinkle.generate();
	}
	hash ^= prinkle._id;
	buffer_write(buff, buffer_u32, prinkle._id);
	
	if(!noWorld){
		buffer_write(buff, buffer_u8,  0);
	} else {
		buffer_write(buff, buffer_u8,  1);
	}
	buffer_write(buff, buffer_u32, 123456789);
	buffer_write(buff, buffer_u32, hash ^ HASH_PI);
	
	buffer_save(buff, filename_sanitize(prinkle.name)+".prinkle");
	buffer_delete(buff);
}

function filename_sanitize(str){
	str = string_replace(str, " ","_");
	str = string_replace(str, ",","");
	str = string_lower(str);
	return str;
}

function load(){
	var f = file_find_first("*.prinkle",fa_none);
	show_debug_message(42);
	file_find_close();
	if(f != ""){
		show_debug_message(f);
		show_debug_message(45);
		var buff = buffer_load(f);
		if(buffer_read(buff, buffer_string) != "Prinkle"){
			show_message("Unrecognized file format: " + f);
			return false;
		}
		show_debug_message(51);
		var timestamp = buffer_read(buff, buffer_u32);
		var saveVersion = buffer_read(buff, buffer_u8);
		var playerID = buffer_read(buff, buffer_u32);
		var playerName = buffer_read(buff, buffer_string);
		var prinkleId = buffer_read(buff, buffer_u32);
		var world_present = buffer_read(buff, buffer_u8);
		
		show_debug_message(59);
		var expected_hash = timestamp ^ saveVersion ^ playerID ^ prinkleId ^ HASH_PI;
		show_debug_message(61);
		var validation = buffer_read(buff, buffer_u32);
		
		var hash = buffer_read(buff, buffer_u32);
		show_debug_message(62);
		if(hash == expected_hash){
			show_debug_message("AAA");
			show_debug_message({
				"date":timestamp,
				"SV": saveVersion,
				"PID": playerID,
				"PN": playerName,
				"PRINKLE": prinkleId,
				"WORLD": world_present,
				"EX HASH": expected_hash,
				"HASH": hash
			});
			return true;
		} else {
			show_debug_message(77);
			
			show_debug_message({
				"date":date,
				"SV": saveVersion,
				"PID": playerID,
				"PN": playerName,
				"PRINKLE": prinkleId,
				"WORLD": world_present,
				"EX HASH": expected_hash,
				"HASH": hash
			});
			show_message("Corrupted file: " + f);
			return false;
		}
	}
	show_debug_message(81);
	return false;
}

/*
FORMAT:
8 bytes - the string "prinkle", followed by a null
4 bytes - The time the save was created at, trunecated to an u32
1 byte - the save file version
4 bytes - the player ID
n bytes - the player name, a null terminated string
4 bytes - the Prinkle ID
1 byte - if world data is present

if world data is present:
	8 bytes - how many objects to follow
	
8 bytes: hash of time, save file, player id, prinkle id, and each numeric data of present blocks
*/