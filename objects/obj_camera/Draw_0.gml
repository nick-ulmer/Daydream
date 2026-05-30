/// @description 



camera_set_view_pos(view_camera[0], x - sprite_width/2, y - sprite_height/2);

// For debugging
//draw_self();


if (!instance_exists(obj_room_boundary)) return;
var _sw = global.boundary_w;
var _sh = global.boundary_h;

for (var _gy = 0; _gy < _sh; _gy++) {
    for (var _gx = 0; _gx < _sw; _gx++) {
        if (global.boundary_grid[_gx + _gy * _sw]) {
            draw_set_alpha(0.5);
            draw_set_color(c_red);
            var _wx = global.boundary_x + (_gx - sprite_get_xoffset(obj_room_boundary.sprite_index)) * global.boundary_scale_x;
            var _wy = global.boundary_y + (_gy - sprite_get_yoffset(obj_room_boundary.sprite_index)) * global.boundary_scale_y;
            draw_rectangle(_wx, _wy, _wx + global.boundary_scale_x, _wy + global.boundary_scale_y, false);
        }
    }
}
draw_set_alpha(1);
draw_set_color(c_white);