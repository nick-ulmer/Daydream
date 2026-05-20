/// @description Change depth and draw self. 

depth = -bbox_bottom;
var _hcam = camera_get_view_height(view_camera[0]);
var _wcam = camera_get_view_width(view_camera[0]);
var _xcam = camera_get_view_x(view_camera[0]);
var _ycam = camera_get_view_y(view_camera[0]);



//camera_set_view_pos(view_camera[0],x-(_wcam/2),y-(_hcam/2));

draw_self();
