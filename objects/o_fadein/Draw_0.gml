draw_rectangle_colour(0,0,room_width, room_height,top, top, bottom, bottom, false);
draw_set_color(c_white);
draw_text(0,0, string("{0}, {1}, {2}", color_get_red(top), color_get_green(top), color_get_blue(top)));
draw_text(0,32, string("{0}, {1}, {2}", color_get_red(bottom), color_get_green(bottom), color_get_blue(bottom)));