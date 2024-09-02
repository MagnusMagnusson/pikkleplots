var w = camera_get_view_width(view_camera[0]);
var h = camera_get_view_height(view_camera[0])
var ratio = h/w;

camera_set_view_size(view_camera[0], w + 20,  h + 20*ratio);