if(vulnerable) {
	vulnerable = false;	
	alarm[0] = 1 * game_get_speed(gamespeed_fps);
	
	if(hp - 1 <= 0) {
		instance_destroy();	
	}
	else {
		hp -= 1;	
	}
}