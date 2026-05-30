/// @description 

if (instance_exists(obj_room_boundary)) {
	collision_check();
} else {
	x = target.x;
	y = target.y;
}

x = floor(x);
y = floor(y);