/// @description 

application_surface_draw_enable(false);

var camera = view_get_camera(0);
var cam_width = camera_get_view_width(camera);
var cam_height = camera_get_view_height(camera);

light_surface = surface_create(cam_width, cam_height);
darkness_coefficient = .2;

//var _panel = new UIPanel("HelloWorld_Panel", 100, 100, 500, 350, green_panel);
//_panel.setTitle("Hello world!");

save_room_sprite = function() {
	var _hcam = camera_get_view_height(view_camera[0]);
	var _wcam = camera_get_view_width(view_camera[0]);
	var _xcam = camera_get_view_x(view_camera[0]);
	var _ycam = camera_get_view_y(view_camera[0]);
	
	var _wport = view_get_wport(0);
	var _hport = view_get_hport(0);

	var _surface = surface_create(_wport,_hport);
	surface_set_target(_surface);
	gpu_push_state();
	gpu_set_zwriteenable(false); 
	gpu_set_ztestenable(false);
	draw_set_alpha(1);
	
	surface_reset_target();
	gpu_pop_state()
	room_sprite = sprite_create_from_surface(application_surface, 0,0, _wport,_hport, false, false, 0, 0);
	sprite_save(room_sprite, 0, "room_sprite.png")
	
	surface_free(_surface);
}

pause_menus = ["Pause_Main","Settings","Graphics"];
pause_menu = function() {if (!ui_exists("Pause_Main")) {
	var _width = 200;
	var _button_height = 70; var _button_margin = 5;
	// height don't matter because it gets changed at the end after buttons are made. 
	var _panel = new UIPanel("Pause_Main", 0, 0, _width, 100, grey_panel, UI_RELATIVE_TO.MIDDLE_CENTER);
	_panel
		.setResizable(false)
		.setDraggable(false)
		.setTitle("Pause Menu")
		// For some reason, sticks its middle to the very top, so place downward 10 pixels
		.setTitleOffset({x:0, y:10}) 
		.setImageAlpha(0.75).setTitleFormat("[c_black]");
		
	// Create Buttons
	var _buttons = ["Resume Game","Settings","Graphics","Save Game","Exit to Main Menu"];
	var _i = 0;
	while (_i < array_length(_buttons)) {
		var _button = _panel.add(new UIButton(_buttons[_i], 0, (_button_height+_button_margin)*_i + 30, _width, _button_height, _buttons[_i], grey_button00, UI_RELATIVE_TO.TOP_CENTER));
		_button
			.setTextFormat("[c_black][fa_center][fa_middle]")
		switch _buttons[_i] {
			case "Resume Game": 
				_button.setCallback(UI_EVENT.LEFT_RELEASE, function() {resume_game();});
			break;
			case "Settings":
			break;
			case "Graphics":
			break;
			case "Save Game":
			break;
			case "Exit to Main Menu":
			break;
		}
		_i ++;
	}
	
	_panel.setDimensions(0, 0, _width+20, (_button_height+_button_margin)*_i + 40, UI_RELATIVE_TO.MIDDLE_CENTER)
}}

pause_exit = function() {
	for (var _i = 0; _i < array_length(pause_menus); _i++) {
		if ui_exists(pause_menus[_i]) ui_get(pause_menus[_i]).destroy();
	}
}


previous_room = room;
resume_game = function() {
	pause_exit();
	room_goto(previous_room);
	//room_goto(rm_primary);
}