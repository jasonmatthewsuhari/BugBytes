/// @description Down movement
if global.shop exit;			// if shop open, exit step
if (useable.down_arrow) {
	speed = 0;
	y += curr_speed;
}