/// @description Draw all info related to player

event_inherited();
var _weaponYscl = 1;

if (aim_direction > 90 && aim_direction < 270) {
	_weaponYscl = -1;
}
//draw_sprite_ext(sprite_index, image_index, x, y, face, 1, 0, c_white, 1);
draw_sprite_ext(weapon.sprite, -1, weapon_x, weapon_y, 1, _weaponYscl, aim_direction, c_white, 1);