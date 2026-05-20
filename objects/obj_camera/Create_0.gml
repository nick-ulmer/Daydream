/// @description 
/*
// Initialize Camera

camera_set_view_pos(view_camera[0],0,0);
camera_set_view_size(view_camera[0],2049,1152);


x = 0; y = 0; // Center
chunk_x = 0; chunk_y = 0;
chunk_rel_x = 0; chunk_rel_y = 0;

w = 0;h = 0;
w_set = 2049; h_set = 1152;
w_min = 700; w_max = 20000;
target = obj_player;
y_offset_constant = 7;
y_offset = 0;
scale = 1; // Size of camera compared to world. 
wport = view_get_wport(0);
hport = view_get_hport(0);

l = 0; r = 0; t = 0; b = 0;
aspect_ratio = [0,0,0]; // width to height. then just the fraction. 