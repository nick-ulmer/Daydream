/// @description Send to destination

// Guard clause. Don't send player
if (!variable_global_exists("player_destination_id")) {
	show_debug_message("no destination id present");
	return; 
}

if (transition_id == variable_global_get("player_destination_id")) {
	show_debug_message("destination present!!!");
	show_debug_message(transition_id);
	obj_player.x = x + rel_x_spawn;
	obj_player.y = y + rel_y_spawn;	
	able_to_room_transport = false;
}