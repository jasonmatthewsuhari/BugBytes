/// @description Insert description here
// You can write your code in this editor

event_inherited();
var _weaponYscl = 1;

if (aim_direction >90 && aim_direction < 270) {
	_weaponYscl = -1;
}
draw_sprite_ext(sprite_index, image_index, x, y, face, 1, 0, c_white, 1);
draw_sprite_ext(weapon.sprite, -1, weapon_x, weapon_y, 1, _weaponYscl, aim_direction, c_white, 1);

/*
#region draw weighted range

// * visual only - if we have interact options, draw their weight and stroke around them
var _size = array_length(options_arr);
for (var i = 0; i < _size; ++i) {
	//get the options struct
	var _stt = options_arr[i];
	
	//get the id from the struct and ensure it exists
	var _id = _stt.id;
	if !instance_exists(_id) continue;
	
	//draw the instances weight value
	switch(_id.object_index) {
		default:
			var _x = _id.x;
			var _y = _id.bbox_bottom;
		break;
	}
	draw_text_color(_x, _y, string_concat("Weight:", _stt.weight), c_white, c_white, c_white, c_white, 1);
	
	//draw the target instance with a white stroke
	if target_id == _id draw_sprite(_id.sprite_index, 1, _id.x, _id.y);
}

// * visual only - draw the path to the target instance over the player sprite
draw_set_colour(c_white);
if path_get_number(path) > 0 {
	if target_pos_y >= y draw_path(path, x, y, true);
}

// * visual only - draw the range circle
draw_set_alpha(0.5);
draw_circle(x, y, range, true);	
draw_set_alpha(1);	

#endregion
*/