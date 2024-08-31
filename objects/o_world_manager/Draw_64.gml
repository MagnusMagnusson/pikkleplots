draw_set_font(fnt_consola);

var name = is_undefined(world) ? "The Void Between Plots" : (
	!is_undefined(world.prinkle) ? 
	world.prinkle.name + "'s plot" : 
	"Prinkle Plaza"
);


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
			draw_text(8,8,string("unloading {0} - {1}% done", name, 100 - floor(100 * (tileDraws / (WORLD_WIDTH + WORLD_HEIGHT)))));
			break;
	}
	case STATE.wait : {
		draw_text(8,8,string("Currently in {0}",name));
	}
	default:{break;}
}

draw_text(8,8 + string_height("A"),fps);
draw_text(8,8 + 2*string_height("A"),string("{0} to {1}, {2} to {3}", smallestX, largestX, smallestY, largestY));