/// @description Up movement
if global.shop exit;			// if shop open, exit step
if (useable.up_arrow) {
	speed = 0;
	y -= curr_speed;
}