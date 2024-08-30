var r0,g0,b0, r1,g1,b1, rd, bd, gd;

countdown--;
if(countdown == 0){
	stage++;
	switch(stage){
		case BOOTUP_STAGES.fadein:{
			audio_play_sound(snd_c_chord,1,false);
			countdown = fps * 5;
			break;
		}		
		case BOOTUP_STAGES.black:{
			countdown = fps * 5;
			break;
		}
		case BOOTUP_STAGES.username: {
			if(load()){
				game_end();
			} else {
				keyboard_string = user;
				cursor_pos = 1 + string_length(user);
				countdown = -1;
				break;
			}
		}
	}
}
if(stage >= BOOTUP_STAGES.fadein){
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
}

if(stage == BOOTUP_STAGES.username){
	var validKeys = "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm1234567890-_ ";
	if(keyboard_check_pressed(vk_enter)){
		if(is_profanity(user)){
			mess = "Remember the human. Please enter another name";
		} else {
			save(user);
		}
	} else if(keyboard_check_pressed(vk_left)){
		cursor_pos = max(1, cursor_pos - 1);
	} else if(keyboard_check_pressed(vk_right)){
		cursor_pos = min(string_length(user) + 1, cursor_pos + 1);
	} else if(keyboard_check_pressed(vk_anykey)){
		if(string_length(user) < 15){
			if(keyboard_lastkey == vk_backspace){
				if(cursor_pos != 0){
					user = string_delete(user, cursor_pos-1, 1);
					cursor_pos = max(0,cursor_pos - 1);
				}
			} else if(string_pos(keyboard_lastchar, validKeys)){
				user = string_insert(keyboard_lastchar, user, cursor_pos);
				cursor_pos = max(2, cursor_pos + 1);
			}
		}
	}

}