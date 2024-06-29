/// @description Right movement
if global.shop exit;			// if shop open, exit step
if (useable.d_key) {
	speed = 0;
	x += curr_speed;
}