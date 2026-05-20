/// @description Save screen as sprite temporarily and then goto rm_pause

switch room {
	case rm_main: 
		//if !ctrl.keyboard.enable() return;
		//log("paused");
		save_room_sprite();
		//obj_debug.activate(false);
		room_goto(rm_pause);
		pause_menu();
		//camera_set_view_pos(0, 0, 0);
	break;
	case rm_pause: 
		resume_game();
	break;
}