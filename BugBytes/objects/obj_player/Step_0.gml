<<<<<<< Updated upstream
// WASD = 0123
hspd = walking_speed * (movement_array[3] - movement_array[1]);
vspd = walking_speed * (movement_array[2] - movement_array[0]);

x += hspd;
y += vspd;
=======
/// @description Insert description here
// You can write your code in this editor

#region moves player by left mouse click

var _dist = point_distance(x, y, curr_mouse_x, curr_mouse_y);
if (_dist <= speed)
{
    speed = 0;
}
move_towards_point(curr_mouse_x, curr_mouse_y, speed);

#endregion

#region normalise diagonal movement

if (x != xprevious && y != yprevious) {
	curr_speed = sqrt(2) / 2 * max_speed;
} else {
	curr_speed = max_speed;
}

#endregion

#region handle sprite control


// sprite movement direction 
if (x > xprevious) {
	face = SPRITE.RIGHT;
	weapon_x = x + weapon_x_offset;
	weapon_y = y + weapon_y_offset;
} else if (x < xprevious) {
	face = SPRITE.LEFT;
	weapon_x = x - weapon_x_offset;
	weapon_y = y + weapon_y_offset;
} else if (y < yprevious) {
	face = SPRITE.UP;
	weapon_x = x;
	weapon_y = y - weapon_y_offset;
} else if (y > yprevious) {
	face = SPRITE.DOWN;
	weapon_x = x;
	weapon_y = y + 2 * weapon_y_offset;
} else { }


// sprite aim direction
aim_direction = point_direction(x, y, mouse_x, mouse_y);

if (aim_direction <= 45 || aim_direction > 315) {
	face = SPRITE.RIGHT;
	weapon_x = x + weapon_x_offset;
	weapon_y = y + weapon_y_offset;
} else if (aim_direction <= 135) {
	face = SPRITE.UP;
	weapon_x = x;
	weapon_y = y - weapon_y_offset;
} else if (aim_direction <= 225) {
	face = SPRITE.LEFT;
	weapon_x = x - weapon_x_offset;
	weapon_y = y + weapon_y_offset;
} else if (aim_direction <= 315) {
	face = SPRITE.DOWN;
	weapon_x = x;
	weapon_y = y + 2 * weapon_y_offset;
} else { }

image_index = face;

depth = -bbox_bottom;

#endregion
>>>>>>> Stashed changes
