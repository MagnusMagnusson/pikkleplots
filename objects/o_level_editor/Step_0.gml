active = 
	o_world_manager.state == STATE.wait && 
	!is_undefined(o_world_manager.world) && 
	o_world_manager.world.player_id == ourWorld.player_id && 
	!is_undefined(o_world_manager.world.prinkle) && 
	o_world_manager.world.prinkle._id == ourWorld.prinkle._id;
	
	
if(active){
	draw_set_font(fnt_consola_big);
	var sep = string_height("A");
	var right_edge = display_get_gui_width();
	var left_edge = right_edge - 1.5*string_width(" PLOT EDITOR ");
	var bottom_edge = display_get_gui_height();
	var height = bottom_edge * 0.1;
	
	var xx = window_mouse_get_x(); 
	var yy = window_mouse_get_y(); 
	var ii = 6;
	hovering = -2;
	
	for(var i = -1; i < array_length(global.ITEM_ARRAY); i++){
		if(xx > left_edge && xx < right_edge && yy > 32 + (ii + i)*sep && yy < 32 + (ii + i + 1)*sep){
			hovering = i;
			if(mouse_check_button_pressed(mb_left)){
				selected = i;
				x0 = -2;
				x1 = -2;
				y0 = -2;
				y1 = -2;
			}
		}
	}
	
	if(xx < left_edge && mouse_check_button_pressed(mb_left)){
		x0 = mouse_x div 64;
		y0 = mouse_y div 64;
	}
	if(xx < left_edge && mouse_check_button(mb_left)){
		x1 = mouse_x div 64;
		y1 = mouse_y div 64;
	}
}

if(selected != -1){
	var minx = min(x0, x1);
	var maxx = max(x0, x1);
	var miny = min(y0, y1);
	var maxy = max(y0, y1);
	if(mouse_check_button_released(mb_left) && x0 >= 0){
		var changed = false;
		for(var i = minx; i <= maxx; i++){
			for(var j = miny; j <= maxy; j++){
				var item = global.ITEM_ARRAY[selected];
				var currently_there = o_world_manager.world.world[i][j];
				if(currently_there == selected){
					continue;
				}
				o_world_manager.world.world[i][j] = selected;
				with(o_item_parent){
					if(x div 64 == i && y div 64 == j && object_index != item.object){
						changed = true;
						instance_destroy();
					}
				}
				
				if(item.object){
					changed = true;
					var ii = instance_create_layer(i*64,j*64, "Instances", item.object);
					ii._id = selected;
				}
			}
		}
		if(changed){
			show_debug_message("Saved!");
			var d  = save(o_world_manager.world.player_name, o_world_manager.world.player_id, o_world_manager.world.prinkle, o_world_manager.world.flattenWorld());
			show_debug_message(d);
		}
	}
}