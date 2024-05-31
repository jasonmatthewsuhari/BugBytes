if(room == rm_game) {
	SpawnRemoteEntity(random(room_width), random(room_height), "Instances", obj_enemy);
	alarm[0] = random(5) * game_get_speed(gamespeed_fps);
}