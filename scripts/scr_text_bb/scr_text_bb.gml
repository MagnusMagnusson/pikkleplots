function scr_text_highlight(xx, yy, text, base_col, highlight_col){
	var splits = string_split(text, "$");
	var w = 0;
	draw_set_halign(fa_left);
	for(var i = 0; i < array_length(splits); i++){
		draw_set_color(i%2 == 0 ? base_col : highlight_col);
		draw_text(xx + w, yy, splits[i]);
		w += string_width(splits[i]);
	}
}