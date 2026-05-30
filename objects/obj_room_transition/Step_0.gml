/// @description 

if place_meeting(x, y, obj_player) {
	if (!able_to_room_transport) return;
	
	// no need to check for global variable that is being set anyways. 
	variable_global_set("player_destination_id", destination_id);
	show_debug_message("destination set to " + destination_id + "; going to new room");
	room_goto(destination_room);
} else {
	able_to_room_transport = true;
}