if(vulnerable) {
	vulnerable = false;
	if(hp - obj_enemy.collision_dmg <= 0) {
		instance_destroy();
	}
	else {
		hp -= obj_enemy.collision_dmg;
	}
	EventPacket(playerID, EVENTS.PLAYER_DAMAGED, ["hp"],[hp]);
	alarm[0] = 1 * game_get_speed(gamespeed_fps);
	
	
}