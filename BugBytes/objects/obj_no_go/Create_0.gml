/// @description Initialise no_go

// _health = f_create_healthbar(self, 300, ,30);

if (irandom(100) > 120) {
	with instance_create_layer(x + irandom_range(-200, 200), y + irandom_range(-200, 200), "Enemies", obj_cool_roach) 
	{
		weapon = f_create_weapon(global.weapons[irandom(array_length(global.weapons) - 1)]);
		has_weapon = true;
		attack_dis = weapon.range / 2;
	}
} else {
	instance_create_layer(x + irandom_range(-200, 200), y + irandom_range(-200, 200), "Enemies", obj_demon);
}

max_spawn = 3;
spawn_count = 0;
spawn_timer = 7 * game_get_speed(gamespeed_fps);
cooldown = spawn_timer;