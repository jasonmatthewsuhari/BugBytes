/// @description Insert description here
// You can write your code in this editor

/*
#region handle HP tracking

f_check_healthbar(self);

#endregion
*/

#region enemy spawning
spawn_timer--;
if (spawn_timer <= 0 && global.spawn_count < global.max_spawn) {
	
	var _xx_offset = irandom_range(-200, 200);
	var _yy_offset = irandom_range(-200, 200);
	
	var _xx = x + _xx_offset;
	var _yy = y + _yy_offset;
	
	while place_meeting(_xx, _yy, obj_solid) {
		_xx_offset = irandom_range(-200, 200);
		_yy_offset = irandom_range(-200, 200);
	
		_xx = x + _xx_offset;
		_yy = y + _yy_offset;
	}
	
	if !place_meeting(_xx, _yy, obj_solid) {
		if (irandom(100) > 80 and global.wave_count >= 3) {
			with instance_create_layer(_xx, _yy, "Enemies", obj_big_zombie) 
			{
				weapon = global.weapon_list.shotgun
				has_weapon = true;
				attack_dis = weapon.range / 2;
			}
		} else {
			instance_create_layer(_xx, _yy, "Enemies", obj_demon);
		}
	}
	
	spawn_timer = cooldown;
	global.spawn_count++;
}

#endregion