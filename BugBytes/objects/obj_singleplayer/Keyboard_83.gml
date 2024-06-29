/// @description Down movement
if global.shop exit;			// if shop open, exit step
if (useable.s_key) {
	speed = 0;
	y += curr_speed;
}