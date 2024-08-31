if(state == STATE.loading){
	if(is_undefined(world)){
		if(!is_undefined(global.toLoad)){
			world = global.toLoad;
			if(!is_undefined(world.prinkle)){
				var p = instance_create_layer(room_width / 2, room_height / 2, "Instances", o_prinkle);
				p.me = world.prinkle;
			}
			show_debug_message("found world to load");
			show_debug_message(global.toLoad);
			show_debug_message(world);
		}
	 } else {
		if(tileDraws <= WORLD_WIDTH + WORLD_HEIGHT){
			tileDraws++;
			grid_alpha = min(1, grid_alpha + 0.005);
		} else {
			global.toLoad = undefined;
			state = STATE.wait;
		}
	}
} else if(state == STATE.unloading){
	if(tileDraws >= 0){
		tileDraws--;
		grid_alpha = min(1, grid_alpha + 0.005);
	} 
	if(tileDraws <= 0){
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