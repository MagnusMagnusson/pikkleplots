function save(name, _id = undefined, prinkle = undefined, world = []){	
	var d = {};
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
	d[$"player_id"] = _id;
	d[$"player_name"] = name;
	buffer_write(buff, buffer_string, name);
	if(is_undefined(prinkle)){
		prinkle = new Prinkle();
		prinkle.generate();
	}
	hash ^= prinkle._id;
	d[$"prinkle_id"] = prinkle._id;
	buffer_write(buff, buffer_u32, prinkle._id);
	
	if(array_length(world) == 0){
		buffer_write(buff, buffer_u8,  0);
		d[$"world"] = world;
	} else {
		var trueLength = 0;
		for(var i = 0; i < array_length(world); i++){
			if(world[i] != 0){
				trueLength++;
			}
		}
		if(trueLength == 0){
			buffer_write(buff, buffer_u8,  0);
		} else {
			buffer_write(buff, buffer_u8,  1);
			buffer_write(buff, buffer_u32, trueLength);
			hash ^= trueLength;
			for(var i = 0; i < array_length(world); i++){
				if(world[i] != 0){
					var xx = i % WORLD_WIDTH;
					var yy = i div WORLD_WIDTH;
					show_debug_message(world[i]);
					buffer_write(buff, buffer_u16,  world[i]);
					buffer_write(buff, buffer_u8,  xx);
					buffer_write(buff, buffer_u8,  yy);
					hash ^= world[i];
					hash ^= xx;
					hash ^= yy;
				}
			}
		}
		d[$"world"] = world;
	}
	buffer_write(buff, buffer_u32, 123456789);
	buffer_write(buff, buffer_u32, hash ^ HASH_PI);
	
	buffer_save(buff, filename_sanitize(prinkle.name)+".prinkle");
	save_to_cloud(name, _id, prinkle._id, buff);
	buffer_delete(buff);
	return d;
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
		return loadFile(f);
	}
	return undefined;
}

function loadFile(f){
	var d = {};
	var buff = buffer_load(f);
	if(buffer_read(buff, buffer_string) != "Prinkle"){
		show_message("Unrecognized file format: " + f);
		return false;
	}
	var timestamp = buffer_read(buff, buffer_u32);
	d[$"timestamp"] = timestamp;
	var saveVersion = buffer_read(buff, buffer_u8);
	d[$"saveVersion"] = saveVersion;
	var playerID = buffer_read(buff, buffer_u32);
	d[$"player_id"] = playerID;
	var playerName = buffer_read(buff, buffer_string);
	d[$"player_name"] = playerName;
	var prinkleId = buffer_read(buff, buffer_u32);
	d[$"prinkle_id"] = prinkleId;
	var world_present = buffer_read(buff, buffer_u8);
	var _hash = 0;
	if(world_present){
		var world = [];
		var itemCount = buffer_read(buff, buffer_u32);
		_hash ^= itemCount
		for(var i = 0; i < itemCount; i++){
			var _id = buffer_read(buff, buffer_u16);
			var _x = buffer_read(buff, buffer_u8);
			var _y = buffer_read(buff, buffer_u8);
			_hash ^= _id ^ _x ^ _y;
			array_push(world, {"_id":_id, "_x":_x,"_y":_y});
		}
		d[$"world"] = world;
	} else {
		d[$"world"] = [];
	}
		
	var expected_hash = _hash ^ timestamp ^ saveVersion ^ playerID ^ prinkleId ^ HASH_PI;
	var validation = buffer_read(buff, buffer_u32);
		
	var hash = buffer_read(buff, buffer_u32);
	if(validation = 123456789 && hash == expected_hash){
		return d;
	} else {
		show_message("Corrupted file: " + f);
		return undefined;
	}
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