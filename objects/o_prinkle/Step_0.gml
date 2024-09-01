image_alpha += 0.01;

if(!moving){
	image_index = 0;
} else {
	image_index++;
	if(point_distance(x,y,tx,ty) > 4){
		move_towards_point(tx, ty, 3);
	} else {
		moving = false;
		tx = x;
		ty = y;
		alarm[0] = 90 + irandom(5 * 60);
		speed = 0;
	}
}