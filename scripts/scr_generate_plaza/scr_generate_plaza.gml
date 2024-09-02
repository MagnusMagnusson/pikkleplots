function generate_plaza(){
	var plaza = new World();
	var world = [];
	for(var i = 0; i < WORLD_WIDTH; i++){
		for(var j = 0; j < WORLD_HEIGHT; j++){
			var iid = 7;
			if(i == floor(WORLD_WIDTH/2 - 1) && j == floor(WORLD_HEIGHT/2 - 1)){
				iid = 9;
			} else {
				if(abs(i - floor(WORLD_WIDTH/2)) < 4 && abs(j - floor(WORLD_HEIGHT/2)) < 4){
					iid = 8;
				}
			}
			array_push(world,{
				"_id": iid,
				"_x": i,
				"_y": j
			});
		}
	}
	
	var d = {
		"player_id":-1,
		"player_name":"Plaza",
		"prinkle_id":-1,
		"world":world
	}
	
	plaza.load(d);
	return plaza;
}