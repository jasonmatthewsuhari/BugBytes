/// @description Insert description here
// You can write your code in this editor

/*
#region handle HP tracking

f_check_healthbar(self);

#endregion
*/

if !global.time_stop {
#region enemy spawning
spawn_timer--;
if (spawn_timer <= 0 && spawn_count < max_spawn) {
	
	if (irandom(100) > 120) {
		with instance_create_layer(x + irandom_range(-200, 200), y + irandom_range(-200, 200), "Enemies", obj_cool_roach) 
		{
			weapon = f_create_weapon(global.weapons[irandom(array_length(global.weapons) - 1)]);
			has_weapon = true;
			attack_dis = weapon.range;
		}
	} else {
		instance_create_layer(x + irandom_range(-200, 200), y + irandom_range(-200, 200), "Enemies", obj_demon);
	}
	
	spawn_timer = cooldown;
	spawn_count++;
}

#endregion
}