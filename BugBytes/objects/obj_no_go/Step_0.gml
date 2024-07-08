/// @description Insert description here
// You can write your code in this editor

/*
#region handle HP tracking

f_check_healthbar(self);

#endregion
*/

#region enemy spawning
	wave_info = global.waves[global.minutes];
	count = wave_info[0];
	enemy_list = wave_info[1];
	ratio = DecideWaves(count, enemy_list);
	delay = 60 / count;
		
	if(can_spawn) {
		can_spawn = false;
		global.spawn_count++;
		SpawnEnemy(enemy_list, ratio, delay);
		alarm[1] = delay * game_get_speed(gamespeed_fps);
	}

#endregion