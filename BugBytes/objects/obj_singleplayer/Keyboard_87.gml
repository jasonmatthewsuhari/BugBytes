/// @description Up movement
if global.shop exit;			// if shop open, exit step
if (useable.w_key) {
	speed = 0;
	y -= curr_speed;
}