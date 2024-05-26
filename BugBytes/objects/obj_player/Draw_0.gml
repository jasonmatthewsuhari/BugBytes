/// @description Insert description here
// You can write your code in this editor

draw_self();


// draw weapon
/*
// flip weapon upright
var _weaponYscale = 1;
if (aim_direction > 90 && aim_direction < 270) {
	_weaponYscale = -1;
}

draw_sprite_ext(BELG_SCAR, 0, weapon_x, weapon_y, 1, _weaponYscale, aim_direction, c_white, 1);
*/


if (!instance_exists(obj_player_gun)) {
	instance_create_depth(weapon_x, weapon_y, depth - 1, obj_player_gun);
}

