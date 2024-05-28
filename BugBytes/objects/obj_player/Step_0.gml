/// @description Insert description here
// You can write your code in this editor

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

#region handle character sprite control

// sprite control when moving
if (x > xprevious) {
	face = SPRITE.RIGHT;
} else if (x < xprevious) {
	face = SPRITE.LEFT;
} else if (y < yprevious) {
	face = SPRITE.UP;
} else if (y > yprevious) {
	face = SPRITE.DOWN;
} else { };

aim_direction = point_direction(x, y, mouse_x, mouse_y);

if (aim_direction <= 45 || aim_direction > 315) {
	face = SPRITE.RIGHT;
} else if (aim_direction <= 135) {
	face = SPRITE.UP;
} else if (aim_direction <= 225) {
	face = SPRITE.LEFT;
} else if (aim_direction <= 315) {
	face = SPRITE.DOWN;
} else { }

image_index = face;

#endregion

#region handle character HP tracking

f_check_healthbar(self);

#endregion

#region handle weapon tracking

// handle origin for weapon
if (face = SPRITE.LEFT) {
	weapon_x = x - weapon_x_offset;
	weapon_y = y + weapon_y_offset;
} else if (face = SPRITE.RIGHT) {
	weapon_x = x + weapon_x_offset;
	weapon_y = y + weapon_y_offset;
} else if (face = SPRITE.UP) {
	weapon_x = x;
	weapon_y = y - weapon_y_offset;
} else if (face = SPRITE.DOWN) {
	weapon_x = x;
	weapon_y = y + weapon_y_offset;
} else { }

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
