if (image_index == 1) {
	weapon_x = x - weapon_x_offset;
	weapon_y = y + weapon_y_offset;
} else if (image_index == 2) {
	weapon_x = x + weapon_x_offset;
	weapon_y = y + weapon_y_offset;
} else if (image_index == 0) {
	weapon_x = x;
	weapon_y = y - weapon_y_offset;
} else if (image_index == 3) {
	weapon_x = x;
	weapon_y = y + weapon_y_offset;
} else { }

with weapon 
{
	sprite_index = gun.sprite;

	// If rotated to left, flip gun
	if obj_remote.remote_mouse_x > x image_yscale = 1;
	else image_yscale = -1;

	// Lerp angle to mouse and kickback angle to zero
	mouse_angle -= angle_difference(mouse_angle, point_direction(x, y, obj_remote.remote_mouse_x, obj_remote.remote_mouse_y)) * 0.5;
	knockback_angle -= angle_difference(knockback_angle, 0) * 0.05;
	image_angle = mouse_angle + knockback_angle;

	//Lerp position
	x = lerp(x, ox, 0.05);
	y = lerp(y, oy, 0.05);
}