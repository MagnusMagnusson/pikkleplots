draw_set_alpha(1);
for(var yy = smallestY; yy < largestY; yy++){
	for(var xx = smallestX; min(largestX, xx < WORLD_WIDTH - WORLD_HEIGHT - yy + tileDraws); xx++){
		draw_tile_better(spr_tiles, 0, 0, 64,64, xx*64,yy*64);
	}
}

if(state != STATE.wait || grid_alpha > 0.1){
	draw_set_alpha(grid_alpha);
	draw_set_color(c_white);
	for(var yy = smallestY; yy < largestY; yy++){
		for(var xx = smallestX; xx < largestX; xx++){
			draw_rectangle(xx * 64, yy * 64, (xx + 1) * 64 - 1, (yy + 1) * 64 - 1, true)
		}
	}
}

draw_set_alpha(1);