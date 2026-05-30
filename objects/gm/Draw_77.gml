/// @description 
var _hcam = camera_get_view_height(view_camera[0]);
var _wcam = camera_get_view_width(view_camera[0]);
var _xcam = camera_get_view_x(view_camera[0]);
var _ycam = camera_get_view_y(view_camera[0]);
	
var _wport = view_get_wport(0);
var _hport = view_get_hport(0);

draw_surface(application_surface, 0, 0);

draw_surface_ext(self.light_surface, 0, 0, window_get_width() / surface_get_width(self.light_surface), window_get_height() / surface_get_height(self.light_surface), 0, c_white, darkness_coefficient);