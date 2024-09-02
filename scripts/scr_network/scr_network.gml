#macro useProdServer true
#macro devURL "http://localhost:3000"
#macro prodURL "https://gmcjam.mmagnusson.net"
#macro Prinkleurl (useProdServer ? prodURL : devURL)

function save_to_cloud(name, player_id, prinkle_id, buffer){
	var url = Prinkleurl+"/prinkles/save?name="+name+"&pid="+string(player_id)+"&prinkle="+string(prinkle_id);
	buffer_seek(buffer, buffer_seek_start, 0); 
	
	var data=buffer;
	var map = ds_map_create();
	ds_map_add(map, "Content-Length", string(buffer_get_size(data)));
	ds_map_add(map, "User-Agent", "Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.57 Safari/537.36");
	o_networking.save_to_cloud_id = http_request(url, "POST", map, data);
	ds_map_destroy(map);
}

global.network_prinkles = [];

function get_cloud_prinkles(callback){
	var url = Prinkleurl+"/prinkles/list?t=a";
	o_networking.load_prinkle_list = http_get(url);
	o_networking.load_prinkle_callback = callback;
}

global.cloudWorld = -1;

function cloud_prepare_world(){
	var d = loadFile(string("tmp/{0}.prinkle", global.cloudWorld));
	if(!is_undefined(d)){
		var w = new World();
		w.load(d);
		global.toLoad = w;
		show_debug_message("===== SUCCESS!====");
	} else {
		global.toLoad = ourWorld;
		show_debug_message("===== :( :( FAIL :( :( ====");
	}
}

function load_cloud_world(prinkle_id){
	var url = Prinkleurl+"/prinkles/load?prinkle="+string(prinkle_id);
	global.toLoad = undefined;
	o_world_manager.state = STATE.unloading;
	o_networking.load_prinkle_world = http_get_file(url,string("tmp/{0}.prinkle", prinkle_id));
	o_networking.load_prinkle_world_callback = cloud_prepare_world;
	global.cloudWorld = prinkle_id;
}