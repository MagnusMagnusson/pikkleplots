draw_set_font(fnt_consola);
draw_set_color(col_bottom_blue);
var name = is_undefined(world) ? "The Void Between Plots" : (
	!is_undefined(world.prinkle) ? 
	world.prinkle.name + "'s plot" : 
	"Prinkle Plaza"
);

var owner = is_undefined(world) ? "Waiting for next plot..." : (
	!is_undefined(world.prinkle) ? 
	"Owned by "+world.player_name : 
	"Community Space"
);

var w = string_width(string("Unloading {0} - {1}% done", name, 100 - floor(100 * (tileDraws / (WORLD_WIDTH + WORLD_HEIGHT)))));
draw_rectangle(0,0,8+8+w, 16 + 2.1*string_height("A"), false)
draw_set_color(c_white);
switch(state){
	case STATE.loading : {
		if(is_undefined(world)){
			draw_text(8,8,"No plot set to be loaded.");
		} else {
			draw_text(8,8,string("Loading {0}  - {1}% done", name, floor(100 * (tileDraws / (WORLD_WIDTH + WORLD_HEIGHT)))));
		}
		break;
	}
	case STATE.unloading : {
			draw_text(8,8,string("Unloading {0} - {1}% done", name, 100 - floor(100 * (tileDraws / (WORLD_WIDTH + WORLD_HEIGHT)))));
			break;
	}
	case STATE.wait : {
		draw_text(8,8,string("Currently in {0}",name));
		draw_text(8,8 + 8 + string_height("A"),owner);
	}
	default:{break;}
}

if(state == STATE.wait){
	if(is_undefined(world)  || !is_undefined(world.prinkle)){
		draw_sprite(spr_plaza,0,32, window_get_height() - 32 - sprite_get_height(spr_plaza));
	}
	if(world != ourWorld && (global.selected_prinkle == -1 || global.selected_prinkle==ourWorld.prinkle._id)){
		draw_sprite(spr_home,0,32, window_get_height() - 32 - 2.1*sprite_get_height(spr_plaza));
	}
	if(global.selected_prinkle != -1 && global.selected_prinkle != ourWorld.prinkle._id){
		draw_sprite(spr_home,1,32, window_get_height() - 32 - 2.1*sprite_get_height(spr_plaza));
	}
}

