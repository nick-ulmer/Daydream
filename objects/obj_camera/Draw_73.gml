/// @description Insert description here
// You can write your code in this editor


//draw_line(x,y, target.x, target.y);

/*
draw_set_color(c_white);
var repeat_x = 10;
var repeat_y = 10;
		
var _w = sprite_width / 2;
var _h = sprite_height / 2;
		
var _x = target.x - _w;
repeat repeat_x+1 {
	var _y = target.y - _h;
	repeat repeat_y+1 {
		draw_line(x, y, _x, _y);
		_y += sprite_height / repeat_y;		
	}
	_x += sprite_width / repeat_x;
}