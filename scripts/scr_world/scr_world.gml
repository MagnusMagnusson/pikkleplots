function World() constructor {
	player_id = 0;
	player_name = "";
	prinkle = 0;
	world = [];
	loaded = false;
	
	static load = function(dat){
		player_id = dat[$"player_id"];
		player_name = dat[$"player_name"];
		if(dat[$"prinkle_id"] >= 0){
			prinkle = new Prinkle();
			prinkle.generate(dat[$"prinkle_id"]);
		} else{
			prinkle = undefined;
		}
		world = self.generateGrid(dat[$"world"]);
		loaded = true;
	}
	
	static generateGrid = function(worldData){
		var w = array_create(WORLD_WIDTH);
		for(var i = 0; i < WORLD_WIDTH; i++){
			w[i] = array_create(WORLD_HEIGHT, 0);
		}
		for(var i = 0; i < array_length(worldData); i++){
			var item = worldData[i];
			if(item._x >= 0 && item._x < WORLD_WIDTH && item._y >= 0 && item._y < WORLD_HEIGHT){
				w[item._x][item._y] = item._id;
			}
		}
		return w;
	}
	
	static flattenWorld = function(){
		var dd = [];
		for(var j = 0; j < WORLD_HEIGHT; j++){
			for(var i = 0; i < WORLD_WIDTH; i++){
				array_push(dd, self.getItemAt(i,j));
			}
		}
		return dd;
	}
	
	static getItemAt = function(xx,yy){
		if(xx >= 0 && xx < WORLD_WIDTH && yy >= 0 && yy < WORLD_HEIGHT){
			return world[xx][yy];
		} else {
			return -1
		};
	}
}

function WorldItem(item){
	return {
		"_id":item
	};
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
globalvar plazaWorld;

ourWorld = new World();
plazaWorld = generate_plaza();


