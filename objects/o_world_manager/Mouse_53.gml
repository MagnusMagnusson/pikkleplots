if(state == STATE.wait){
	if(is_undefined(world)  || !is_undefined(world.prinkle)){
		var xx = window_mouse_get_x();
		var yy = window_mouse_get_y();
		if(xx >= 0 && xx < sprite_get_width(spr_plaza) && yy >  window_get_height() - 32 - sprite_get_height(spr_plaza) && yy < window_get_height() - 32){
			loadWorld(plazaWorld);
		}
	}
	if(world != ourWorld){
			var xx = window_mouse_get_x();
			var yy = window_mouse_get_y();
			if(xx >= 0 && xx < sprite_get_width(spr_plaza) && yy >  window_get_height() - 32 - 2.1 * sprite_get_height(spr_plaza) && yy < window_get_height() - 32){
			if(global.selected_prinkle != -1 && global.selected_prinkle != ourWorld.prinkle._id){
				load_cloud_world(global.selected_prinkle);
			} else {
				loadWorld(ourWorld);
			}
		}
	}
}

global.selected_prinkle = -1;