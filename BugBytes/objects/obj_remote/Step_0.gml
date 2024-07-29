event_inherited();

aim_direction = point_direction(x, y, remote_mouse_x, remote_mouse_y);
if (aim_direction <= 90 || aim_direction > 270) {
	face = 1;
} else if (aim_direction <= 270) {
	face = -1;
} else { }

weapon_x = x - weapon_x_offset;			// x pos for where weapon should be drawn 
weapon_y = y + weapon_y_offset;	

if is_instanceof(weapon, Weapon) {
	if weapon == (global.weapon_list.heal_gun) {
		fire_weapon(class_Damageable_Friendly);
	} else {
		fire_weapon(class_Damageable_Enemy);
	}
	
}