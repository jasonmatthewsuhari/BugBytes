/// @description Insert description here
// You can write your code in this editor

event_inherited()


if !global.time_stop 
{

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

image_index = face;

#endregion

#region handle weapon sprite tracking

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


f_track_weapon(weapon);


#endregion

#region handle attack time

if (instance_exists(weapon)) 
{	
	weapon.timer--;
	if (weapon.timer <= 0) {
		weapon.timer = weapon.cooldown;
		f_fire(weapon);
	}
}

#endregion

path_find()
}
else { path_clear(); }