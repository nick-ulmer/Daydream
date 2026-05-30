/// @description Change depth and draw self. 

depth = -bbox_bottom;
var _hcam = camera_get_view_height(view_camera[0]);
var _wcam = camera_get_view_width(view_camera[0]);
var _xcam = camera_get_view_x(view_camera[0]);
var _ycam = camera_get_view_y(view_camera[0]);

// obj_player Draw Event
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
