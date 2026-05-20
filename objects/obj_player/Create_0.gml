spd = 3;

function collision_check() {
    var mx = (keyboard_check(vk_right) - keyboard_check(vk_left)) * spd;
    var my = (keyboard_check(vk_down) - keyboard_check(vk_up)) * spd;

    // Horizontal
    if (!scr_solid(x + mx, y)) {
        x += mx;
    } else {
        while (!scr_solid(x + sign(mx), y)) {
            x += sign(mx);
        }
    }

    // Vertical
    if (!scr_solid(x, y + my)) {
        y += my;
    } else {
        while (!scr_solid(x, y + sign(my))) {
            y += sign(my);
        }
    }
}