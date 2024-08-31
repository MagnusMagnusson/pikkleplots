var cam = camera_get_active();
var xx = camera_get_view_x(cam);
var yy = camera_get_view_y(cam);
var ww = camera_get_view_width(cam);
var hh = camera_get_view_height(cam);

draw_rectangle_colour(xx,yy,xx+ww, yy+hh, col_top_blue, col_top_blue, col_bottom_blue, col_bottom_blue, false);