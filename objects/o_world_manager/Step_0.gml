if(state == STATE.loading){
	if(is_undefined(world)){
		if(!is_undefined(global.toLoad)){
			world = global.toLoad;
			if(!is_undefined(world.prinkle)){
				var p = instance_create_layer(room_width / 2, room_height / 2, "Prinkles", o_prinkle);
				p.me = world.prinkle;
			} else {
				get_cloud_prinkles(function(){
					for(var i = 0; i < array_length(global.network_prinkles); i++){
						var p = instance_create_layer(room_width / 2 + random_range(-100, 100), room_height / 2 + random_range(-100, 100) , "Prinkles", o_prinkle);
						p.me = new Prinkle();
						p.me.generate(global.network_prinkles[i][$"id"]);
						p.me.owner = global.network_prinkles[i][$"owner"]+"'s";
						show_debug_message(p.me);
					}
				});
			}
			show_debug_message("found world to load");
			show_debug_message(global.toLoad);
			show_debug_message(world);
		}
	 } else {
		if(tileDraws <= WORLD_WIDTH + WORLD_HEIGHT){
			tileDraws++;
			grid_alpha = min(1, grid_alpha + 0.005);
			for(var yy = 0; yy < WORLD_HEIGHT; yy++){
				var xx = tileDraws - yy;
				if(xx >= 0 && xx < WORLD_WIDTH){
					//new valid tile
					var item_id = world.getItemAt(xx,yy);
					if(item_id < 0){
						continue;
					}
					
					//Find and add the object from the item array
					var item = global.ITEM_ARRAY[item_id];
					if(item.object){
						var ii = instance_create_layer(xx*64,yy*64, "Instances", item.object);
						ii._id = item_id;
					}
				}
			}
		} else {
			global.toLoad = undefined;
			state = STATE.wait;
		}
	}
} else if(state == STATE.unloading){
	instance_activate_all();
	with(o_item_parent){
		instance_destroy();
	}
	if(tileDraws >= 0){
		tileDraws--;
		grid_alpha = min(1, grid_alpha + 0.005);
	} 
	if(tileDraws <= 0){
		world = undefined;
		state = STATE.loading;
	}
} else if(state == STATE.wait){
	grid_alpha -= 0.05;
	if(grid_alpha <= 0.2){
		grid_alpha = 0;
	}
}

var xx = camera_get_view_x(view_camera[0]);
var yy = camera_get_view_y(view_camera[0]);
var ww = camera_get_view_width(view_camera[0]);
var hh = camera_get_view_height(view_camera[0]);

smallestX = max(0, xx div 64 - 2);
largestX = min(WORLD_WIDTH, 2+ (xx + ww) div 64);
smallestY = max(0, yy div 64 - 2);
largestY = min(WORLD_HEIGHT, 2 + (yy + hh) div 64);

instance_deactivate_object(o_item_parent);
instance_activate_region((smallestX - 1) * 64, (smallestY-1) * 64, (largestX+1) * 64, (1 + largestY) * 64, true)
