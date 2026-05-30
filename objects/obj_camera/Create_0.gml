/// @description 

// Camera view determined by spr_camera
camera_set_view_size(view_camera[0],sprite_width,sprite_height);
target = obj_player; // Can be defined elsewhere


/*function scr_bounds(_x, _y){
	var _bound = place_meeting( _x, _y, obj_room_boundary);
	return _bound;
}*/

function scr_bounds(_x, _y) {
    var _spr = sprite_index;
    var _hw = sprite_get_width(_spr) / 2;
    var _hh = sprite_get_height(_spr) / 2;
    var _box_left   = _x - sprite_get_xoffset(_spr);
    var _box_top    = _y - sprite_get_yoffset(_spr);
    var _box_right  = _box_left + sprite_get_width(_spr);
    var _box_bottom = _box_top  + sprite_get_height(_spr);
    
    // Check all four corners of the camera's sprite mask against the boundary grid
    var _spr_b = obj_room_boundary.sprite_index;
    var _bx = global.boundary_x;
    var _by = global.boundary_y;
    var _bsx = global.boundary_scale_x;
    var _bsy = global.boundary_scale_y;
    var _xoff = sprite_get_xoffset(_spr_b);
    var _yoff = sprite_get_yoffset(_spr_b);
    var _bw = global.boundary_w;
    var _bh = global.boundary_h;
    
    var _corners = [
        [_box_left,  _box_top],
        [_box_right, _box_top],
        [_box_left,  _box_bottom],
        [_box_right, _box_bottom]
    ];
    
    for (var i = 0; i < 4; i++) {
        var _gx = floor((_corners[i][0] - _bx) / _bsx + _xoff);
        var _gy = floor((_corners[i][1] - _by) / _bsy + _yoff);
        _gx = clamp(_gx, 0, _bw - 1);
        _gy = clamp(_gy, 0, _bh - 1);
        if (global.boundary_grid[_gx + _gy * _bw]) return true;
    }
    return false;
}

function collision_check() {
	if (!place_meeting(x, y, obj_player)) {
		show_debug_message("camera: Teleporting to available location around player");
		var _w = sprite_width / 2;
		var _h = sprite_height / 2;
		x = target.x;
		y = target.y;
		if !scr_bounds(x, y) return;
		x -= _w; if !scr_bounds(x, y) return;
		x += _w * 2; if !scr_bounds(x, y) return;
		x -= _w; // reset
		
		y -= _h; if !scr_bounds(x, y) return;
		y += _h * 2; if !scr_bounds(x, y) return;
		y -= _h; // reset
		
		x -= _w; y -= _h; if !scr_bounds(x, y) return;
		x += _w * 2; if !scr_bounds(x, y) return;
		y += _h * 2; if !scr_bounds(x, y) return;
		x -= _w * 2; if !scr_bounds(x, y) return;
		y -= _h * 2; if !scr_bounds(x, y) return;
		
		x = target.x;
		y = target.y;
		show_debug_message("couldn't find a valid position");
		return;
	}
	
	var _clamp_limit = 10;
    xspd = clamp(target.x - x, -_clamp_limit, _clamp_limit);
	yspd = clamp(target.y - y, -_clamp_limit, _clamp_limit);
	
	/*
    xspd = target.x - x;
	yspd = target.y - y;
	//*/
	
	
	// Horizontal
    if (scr_bounds(x + xspd, y)) {
        while (!scr_bounds(x + sign(xspd), y)) {
            x += sign(xspd);
        }
		xspd = 0;
    } 
	x += xspd;

    // Vertical
    if (scr_bounds(x, y + yspd)) {
        while (!scr_bounds(x, y + sign(yspd))) {
            y += sign(yspd);
        }
		yspd = 0;
    }
	y += yspd;
}


function bake_sprite_boundary() {
	var _spr = obj_room_boundary.sprite_index;
	var _img = obj_room_boundary.image_index;
	var _xscale = obj_room_boundary.image_xscale;
	var _yscale = obj_room_boundary.image_yscale;
	var _sw = sprite_get_width(_spr);
	var _sh = sprite_get_height(_spr);

	global.boundary_grid = array_create(_sw * _sh, false);
	global.boundary_scale_x = _xscale;
	global.boundary_scale_y = _yscale;
	global.boundary_x = obj_room_boundary.x;
	global.boundary_y = obj_room_boundary.y;
	global.boundary_w = _sw;
	global.boundary_h = _sh;

	var _surf = surface_create(_sw, _sh);
	surface_set_target(_surf);
	draw_clear_alpha(c_black, 0);
	draw_sprite(_spr, _img, sprite_get_xoffset(_spr), sprite_get_yoffset(_spr));
	surface_reset_target();

	var _buf = buffer_create(_sw * _sh * 4, buffer_fixed, 4);
	buffer_get_surface(_buf, _surf, 0);

	for (var i = 0; i < _sw * _sh; i++) {
	    var _alpha = buffer_peek(_buf, i * 4 + 3, buffer_u8);
	    global.boundary_grid[i] = (_alpha > 0);
	}

	buffer_delete(_buf);
	surface_free(_surf);
}

if (instance_exists(obj_room_boundary)) {
	bake_sprite_boundary();
}
