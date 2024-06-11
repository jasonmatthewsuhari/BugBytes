if(can_attack) {
	can_attack = false;
	if(other.hp - collision_dmg <= 0) {
		instance_destroy(other);
	}
	else {
		other.hp -= collision_dmg;
	}
	EventPacket(other.playerID, EVENTS.PLAYER_DAMAGED, ["hp"],[other.hp]);
	alarm[0] = (10/attack_speed) * game_get_speed(gamespeed_fps);
}