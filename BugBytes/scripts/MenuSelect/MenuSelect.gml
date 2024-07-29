function MenuSelect(menu){
	audio_play_sound(snd_bootup, 1, false);
	switch(menu.menu_index) {
		// SINGLEPLAYER
		case 0:
			room_goto(rm_singleplayer_placeholder);
		break;
		
		// MULTIPLAYER HOST
		case 1:
			room_goto(rm_lobby);
			instance_create_layer(0, 0, "Instances", obj_server);
		break;
		
		// MULTIPLAYER JOIN
		case 2:
			room_goto(rm_ipentry);
		break;
		
		case 3:
			instance_create_layer(0,0,"Instances",obj_settings);
		break;
		
		case 4:
			room_goto(rm_tutorial);
		break;
		
		case 5:
			game_end();
		break;
	}
}