/// @description Left mouse click movement
if global.shop exit;			// if shop open, exit step

if (useable.left_mouse_button) {
	speed = curr_speed;

	curr_mouse_x = mouse_x;
	curr_mouse_y = mouse_y;
}
