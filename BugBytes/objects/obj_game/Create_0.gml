/// @description Re-initialise global variables (when you start a new game)
audio_stop_all();
audio_play_sound(snd_game, 1, true);


global.point = 0;
global.max_spawn = 3;
global.spawn_count = 0;
global.wave_count = 1;
global.piercing = 1;
global.showhp = false;

