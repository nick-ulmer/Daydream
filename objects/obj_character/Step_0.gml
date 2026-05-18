var move_x = (keyboard_check(vk_right) - keyboard_check(vk_left));
var move_y = (keyboard_check(vk_down) - keyboard_check(vk_up));

var spd_diag = (move_x != 0 && move_y != 0) ? spd / sqrt(2) : spd;
x += move_x * spd_diag;
y += move_y * spd_diag;