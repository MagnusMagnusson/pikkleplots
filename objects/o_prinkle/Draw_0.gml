draw_set_alpha(image_alpha);

if(is_undefined(me)){
	draw_sprite(sprite_index, 0, x, y);
} else {
	draw_sprite_ext(sprite_index, 0, x, y - 20*dsin(5*image_index), image_xscale, image_yscale, 90 * dsin(2 * image_index), me.color_1, image_alpha);
	draw_sprite_ext(sprite_index, 1, x, y - 20*dsin(5*image_index), image_xscale, image_yscale, 90 * dsin(2 * image_index), c_white, image_alpha);
	draw_set_halign(fa_center);
	var x0, x1, y0, y1;
	draw_set_font(fnt_prinkle_name);
	x0 = x - 8 - (string_width(me.name) / 2);
	x1 = x + 8 + (string_width(me.name) / 2);
	y0 = y - 60 - 2;
	y1 = y - 60 + 2 + string_height(me.name);
	draw_set_alpha(min(image_alpha, hovering ? 1 : 0.1));
	draw_set_color(c_black)
	draw_rectangle(x0-1,y0-1,x1+1,y1+1, false);
	draw_set_color(~me.color_1)
	draw_rectangle(x0,y0,x1,y1, false);
	draw_set_color(me.color_1);
	draw_text(x, y - 60, me.name);
	draw_set_halign(fa_left);
	draw_set_alpha(1);
}

draw_set_alpha(1);