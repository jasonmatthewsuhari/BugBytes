/// @description Left movement
if global.shop exit;			// if shop open, exit step
if (useable.a_key) {
	speed = 0;
	x -= curr_speed;
}