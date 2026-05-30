/// @description 

// Camera view determined by spr_camera
camera_set_view_size(view_camera[0],sprite_width,sprite_height);
target = obj_player; // Can be defined elsewhere


function scr_bounds(_x, _y){
	var _bound = place_meeting( _x, _y, obj_room_boundary);
	return _bound;
}

function collision_check() {
	if (!place_meeting(x, y, obj_player)) {
		show_debug_message("camera: Teleporting to available locatino around player");
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
    if (!scr_bounds(x + xspd, y)) {
        x += xspd;
    } else {
        while (!scr_bounds(x + sign(xspd), y)) {
            x += sign(xspd);
        }
    }

    // Vertical
    if (!scr_bounds(x, y + yspd)) {
        y += yspd;
    } else {
        while (!scr_bounds(x, y + sign(yspd))) {
            y += sign(yspd);
        }
    }
	
	
}
