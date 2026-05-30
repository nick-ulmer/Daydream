/// @description
part_system_drawit(global._part_system);

var _hcam = camera_get_view_height(view_camera[0]);
var _wcam = camera_get_view_width(view_camera[0]);
var _xcam = camera_get_view_x(view_camera[0]);
var _ycam = camera_get_view_y(view_camera[0]);
	
var _wport = view_get_wport(0);
var _hport = view_get_hport(0);

var camera = view_get_camera(0);

if (!surface_exists(self.light_surface)) {
	var cam_width = camera_get_view_width(camera);
	var cam_height = camera_get_view_height(camera);
	
	self.light_surface = surface_create(cam_width, cam_height);
}

surface_set_target(self.light_surface);
draw_clear(#000020);
//camera_apply(camera);

gpu_set_blendmode(bm_subtract);

//var scale = 2 + 0.125 * sin(current_time / 150);
var sprite = spr_light;

with (obj_player) {
	var light_scale = 3;
    // Convert world coords → camera-relative, then scale to port
    var sx = (self.x - _xcam) * (_wport / _wcam);
    var sy = (self.y - _ycam) * (_hport / _hcam);
	
	draw_sprite_ext(sprite, 0, sx, sy, light_scale, light_scale, 0, c_white, 1);
}

gpu_set_blendmode(bm_normal);
surface_reset_target();