image_alpha += 0.01;

if(image_alpha > 1 && alarm[0] < 0){
	alarm[0] = 60 * random_range(2,4);
}

if(x != xstart){
	hspeed += min(xstart - x,sign(xstart - x));
}

hspeed *= 0.9;