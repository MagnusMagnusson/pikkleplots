if(mouse_check_button_pressed(mb_right)){
	xclick = display_mouse_get_x();
	yclick = display_mouse_get_y();
}
if(mouse_check_button(mb_right)){
	x -= display_mouse_get_x() - xclick;
	y -= display_mouse_get_y() - yclick;	
	xclick = display_mouse_get_x();
	yclick = display_mouse_get_y();
}