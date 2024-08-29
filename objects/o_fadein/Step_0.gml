var r0,g0,b0, r1,g1,b1, rd, bd, gd;


if (bottom != col_bottom_blue){
	r0 = color_get_red(bottom);
	g0 = color_get_green(bottom);
	b0 = color_get_blue(bottom);
	r1 = color_get_red(col_bottom_blue);
	g1 = color_get_green(col_bottom_blue);
	b1 = color_get_blue(col_bottom_blue);
	bottom = make_color_rgb(r0 + sign(r1 - r0), g0 + sign(g1 - g0), b0 + sign(b1 - b0));
}

if (top != col_top_blue){
	r0 = color_get_red(top);
	g0 = color_get_green(top);
	b0 = color_get_blue(top);
	r1 = color_get_red(col_top_blue);
	g1 = color_get_green(col_top_blue);
	b1 = color_get_blue(col_top_blue);
	top = make_color_rgb(r0 + sign(r1 - r0), g0 + sign(g1 - g0), b0 + sign(b1 - b0));
}