if(vulnerable) {
	vulnerable = false;
	hp -= 1;
	alarm[0] = 1 * game_get_speed(gamespeed_fps);
	
	var buffer = buffer_create(100, buffer_fixed, 1);

	buffer_write(buffer, buffer_u8, PACKETS.EVENT);
	buffer_write(buffer, buffer_u8, playerID);
	buffer_write(buffer, buffer_u8, hp);
}