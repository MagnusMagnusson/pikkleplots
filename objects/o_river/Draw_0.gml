var base, right, left, up, down;
base = [6,0];
right = [7,0];
left = [8,0];
down = [6,1];
up = [6,2];
draw_tile_better(spr_tiles, base[0], base[1], 64,64,x,y);

var xx = x div 64;
var yy = y div 64;
var test = o_world_manager.world.getItemAt(xx - 1, yy);
if(test == _id){
	draw_tile_better(spr_tiles, left[0], left[1], 64,64,x,y);
}
 
test = o_world_manager.world.getItemAt(xx + 1, yy);
if(test == _id){
	draw_tile_better(spr_tiles, right[0], right[1], 64,64,x,y);
}
 

test = o_world_manager.world.getItemAt(xx, yy - 1);
if(test == _id){
	draw_tile_better(spr_tiles, up[0], up[1], 64,64,x,y);
}
 
test = o_world_manager.world.getItemAt(xx, yy + 1);
if(test == _id){
	draw_tile_better(spr_tiles, down[0], down[1], 64,64,x,y);
}
 