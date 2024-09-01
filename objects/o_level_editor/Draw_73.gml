if(selected != -1){
	var minx = min(x0, x1);
	var maxx = max(x0, x1);
	var miny = min(y0, y1);
	var maxy = max(y0, y1);
		
	if(mouse_check_button(mb_left)){
		draw_set_color(c_white);
		draw_set_alpha(0.5);
		draw_rectangle(minx * 64, miny * 64, (maxx + 1) * 64, (maxy + 1) * 64, false);
	} else {
		draw_set_color(c_white);
		draw_set_alpha(0.25);
		draw_rectangle((mouse_x div 64) * 64,(mouse_y div 64) * 64,64 + (mouse_x div 64) * 64,64 + (mouse_y div 64) * 64, false);
	}
}
draw_set_alpha(1);