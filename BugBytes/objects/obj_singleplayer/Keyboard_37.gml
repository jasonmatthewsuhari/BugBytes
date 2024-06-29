/// @description Left movement
if global.shop exit;			// if shop open, exit step
if (useable.left_arrow) {
	speed = 0;
	x -= curr_speed;
}