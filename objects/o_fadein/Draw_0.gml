draw_rectangle_colour(0,0,room_width, room_height,top, top, bottom, bottom, false);
draw_set_color(c_white);

if(stage == BOOTUP_STAGES.console){		
	draw_set_font(fnt_consola);
	draw_set_halign(fa_left);
	for(var i = array_length(console_log) - 1; i >= 0; i--){
		draw_text(16, room_height - string_height("A") * (array_length(console_log) - i), console_log[i]);
	}
}

if(stage >= BOOTUP_STAGES.username){	
	draw_set_alpha(alph);
	alph += 0.01;
	draw_set_font(fnt_main_menu);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_text((room_width / 2), (room_height / 2) - string_height("A"),  "Please, enter your name");
	var ustring = (current_time % 1000) < 200 ? user : string_insert("|", user, cursor_pos);
	draw_text((room_width / 2), (room_height / 2), ustring);
	draw_set_alpha(1);
}