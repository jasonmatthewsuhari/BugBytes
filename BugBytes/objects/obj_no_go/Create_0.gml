/// @description Initialise no_go

// _health = f_create_healthbar(self, 300, ,30);

if (irandom(100) > 70) {

	
	with instance_create_layer(x, y, "Enemies", obj_big_zombie) 
	{
		weapon = global.weapon_list.shotgun;
		has_weapon = true;
		attack_dis = weapon.range / 2;
	}
} else {
	instance_create_layer(x, y, "Enemies", obj_demon);
}

max_spawn = 3;
spawn_count = 0;
spawn_timer = 7 * game_get_speed(gamespeed_fps);
cooldown = spawn_timer;