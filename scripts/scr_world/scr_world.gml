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

globalvar ourWorld;

ourWorld = new World();