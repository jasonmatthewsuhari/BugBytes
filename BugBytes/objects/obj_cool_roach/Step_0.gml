/// @description Insert description here
// You can write your code in this editor

#region handle character HP tracking

f_check_healthbar(self);

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
} else { };

image_index = face;

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

f_track_weapon(self, weapon);


#endregion

timer--;
if (timer <= 0) {
	timer = cooldown;
	f_fire(weapon);
}

