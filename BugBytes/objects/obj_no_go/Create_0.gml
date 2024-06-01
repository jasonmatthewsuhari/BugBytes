/// @description Initialise no_go

health_bar = f_create_healthbar(self, 300, ,30);

instance_create_layer(x + irandom_range(-200, 200), y + irandom_range(-200, 200), "Instances", obj_cool_roach);

max_spawn = 3;
spawn_count = 0;
spawn_timer = 7 * game_get_speed(gamespeed_fps);
cooldown = spawn_timer;