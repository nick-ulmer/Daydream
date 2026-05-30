/// @description Save screen as sprite temporarily and then goto rm_pause

switch room {
	case rm_pause: 
		resume_game();
	break;
	default:
		save_room_sprite();
		room_goto(rm_pause);
		//pause_menu();
	break;
}