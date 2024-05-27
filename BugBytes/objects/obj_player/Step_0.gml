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
	weapon_y = y - weapon_y_offset;
} else { }

#endregion

#region handle character HP

if (health_bar.curr_hp <= 0)	instance_destroy(self);

#endregion