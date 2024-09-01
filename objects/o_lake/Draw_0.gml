#macro BIT_LEFT 4
#macro BIT_DOWN 8
#macro BIT_RIGHT 1
#macro BIT_UP 2


var xx = x div 64;
var yy = y div 64;

var mask = (o_world_manager.world.getItemAt(xx + 1, yy) == _id)
		+ (2*(o_world_manager.world.getItemAt(xx , yy - 1) == _id ))
		+ (4*(o_world_manager.world.getItemAt(xx - 1 , yy) == _id ))
		+ (8*(o_world_manager.world.getItemAt(xx , yy + 1) == _id ));
		
var sprite;

switch(mask){
	case 0:{
		sprite = [6,0];
		break;
	}
	case BIT_RIGHT:{
		sprite = [7,0];
		break;
	}
	case BIT_LEFT:{
		sprite = [8,0];
		break;
	}
	case BIT_DOWN:{
		sprite = [6,1];
		break;
	}
	case BIT_UP:{
		sprite = [6,2];
		break;
	}
	case BIT_UP|BIT_RIGHT:{
		sprite = [7,3];
		break;
	}
	case BIT_UP|BIT_LEFT:{
		sprite = [9,3];
		break;
	}
	case BIT_UP|BIT_LEFT|BIT_RIGHT:{
		sprite = [8,3];
		break;
	}
	case BIT_DOWN|BIT_RIGHT:{
		sprite = [7,1];
		break;
	}
	case BIT_DOWN|BIT_LEFT:{
		sprite = [9,1];
		break;
	}
	case BIT_DOWN|BIT_LEFT|BIT_RIGHT:{
		sprite = [8,1];
		break;
	}
	case BIT_UP|BIT_DOWN|BIT_RIGHT:{
		sprite = [7,2];
		break;
	}
	case BIT_UP|BIT_DOWN|BIT_LEFT:{
		sprite = [9,2];
		break;
	}
	default:{
		sprite = [8,2];
		break;
	}
}

draw_tile_better(spr_tiles, sprite[0], sprite[1], 64,64, xx * 64, yy * 64);