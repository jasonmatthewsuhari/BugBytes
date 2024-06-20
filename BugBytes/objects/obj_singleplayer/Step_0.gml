/// @description Insert description here
// You can write your code in this editor

event_inherited();
check_facing();

#region handle movement options

#region handle left mouse click movement

var _dist_from_mouse = point_distance(x, y, curr_mouse_x, curr_mouse_y);

if (point_distance(x, y, curr_mouse_x, curr_mouse_y) > curr_speed) {
	move_towards_point(curr_mouse_x, curr_mouse_y, speed);
} else {
	speed = 0;
}


#endregion

#region handle diagonal speed

if (x != xprevious && y != yprevious) {
	curr_speed = sqrt(2) / 2 * max_speed;
} else {
	curr_speed = max_speed;
}

#endregion


#endregion


#region handle character sprite control


aim_direction = point_direction(x, y, mouse_x, mouse_y);

if (aim_direction <= 90 || aim_direction > 270) {
	face = 1;
} else if (aim_direction <= 270) {
	face = -1;
} else { }


#endregion

#region handle weapon tracking

weapon_x = x + face * weapon_x_offset;
weapon_y = y + weapon_y_offset;


with weapon 
{
	
		sprite_index = gun.sprite;

		// If rotated to left, flip gun
		if mouse_x > x image_yscale = 1;
		else image_yscale = -1;

		// Lerp angle to mouse and kickback angle to zero
		mouse_angle -= angle_difference(mouse_angle, point_direction(x, y, mouse_x, mouse_y)) * 0.5;
		knockback_angle -= angle_difference(knockback_angle, 0) * 0.05;
		image_angle = mouse_angle + knockback_angle;

		//Lerp position
		x = lerp(x, ox, 0.05);
		y = lerp(y, oy, 0.05);
}


#endregion

#region handle useable control tracking
useable = 
{
	left_arrow: instance_exists(obj_left_arrow) ? true : false,
	right_arrow: instance_exists(obj_right_arrow) ? true : false,
	up_arrow: instance_exists(obj_up_arrow) ? true : false,
	down_arrow: instance_exists(obj_down_arrow) ? true : false,
	
	w_key: instance_exists(obj_w_key) ? true : false,
	a_key: instance_exists(obj_a_key) ? true : false,
	s_key: instance_exists(obj_s_key) ? true : false,
	d_key: instance_exists(obj_d_key) ? true : false,
	
	left_mouse_button: instance_exists(obj_left_mouse_button) ? true : false,
	right_mouse_button: instance_exists(obj_right_mouse_button) ? true : false
};

#endregion