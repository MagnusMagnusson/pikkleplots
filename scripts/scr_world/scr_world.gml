function World() constructor {
	player_id = 0;
	player_name = "";
	prinkle = 0;
	world = [];
	loaded = false;
	
	static load = function(dat){
		player_id = dat[$"player_id"];
		player_name = dat[$"player_name"];
		prinkle = new Prinkle();
		prinkle.generate(dat[$"prinkle_id"]);
		world = dat[$"world"];
		loaded = true;
	}
}

global.toLoad = undefined;
function loadWorld(world){
	if(room != rm_plot){
		global.toLoad = world;
		room_goto(rm_plot);
	} else {
		global.toLoad = world;
		o_world_manager.state = STATE.unloading;
	}
	
}

globalvar ourWorld;

ourWorld = new World();