image_xscale = 64 / sprite_width;
image_yscale = image_xscale;

me = undefined;
clicked = false;
hovering = false;

image_alpha = -0.5;

moving = false;
tx = x;
ty = y;
index = 0;
image_speed = 0;
alarm[0] = 90 + irandom(5 * 60);