if(active){
	draw_set_color(col_bottom_blue);
	draw_set_font(fnt_consola_big);
	draw_set_alpha(1);
	var right_edge = camera_get_view_width(view_camera[0]);
	var left_edge = right_edge - 1.5*string_width(" PLOT EDITOR ");
	var bottom_edge = camera_get_view_height(view_camera[0]);
	var height = bottom_edge * 0.1;
	draw_rectangle(left_edge, 0, right_edge, bottom_edge, false);
	
	draw_set_color(c_white);
	var sep = string_height("A");
	draw_text(left_edge + 8, 32, " PLOT EDITOR");
	draw_text(left_edge + 8, 32 + sep, " ___________");
	draw_set_font(fnt_consola_medium_italic);
	draw_text(left_edge + 8, 32 + 2*sep, "Click the element you want");
	draw_text(left_edge + 8, 32 +3*sep, "Click and drag to add");
	draw_set_font(fnt_consola_big);
	
	var ii = 6;
	draw_set_color((hovering == -1 || selected == -1) ? c_white : #666666);
	draw_text(left_edge + 8, 32 + (5)*sep, "Nothing");
	for(var i = 0; i < array_length(global.ITEM_ARRAY); i++){
		var item = global.ITEM_ARRAY[i];
		draw_set_color((hovering == i || selected == i) ? c_white : #666666);
		draw_text(left_edge + 8, 32 + (ii + i)*sep, item.name);
	}
}