/// @description Right movement
if global.shop exit;			// if shop open, exit step
if (useable.right_arrow) {
	speed = 0;
	x += curr_speed;
}