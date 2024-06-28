/// @description Re-initialise global variables (when you start a new game)

global.point = 0;
global.max_spawn = 3;
global.spawn_count = 0;
global.wave_count = 1;

wave_time_source = time_source_create(time_source_game, 60, time_source_units_seconds, function() 
{
	global.max_spawn += 2;
	global.wave_count ++;
	
}, [], -1);

time_source_start(wave_time_source);