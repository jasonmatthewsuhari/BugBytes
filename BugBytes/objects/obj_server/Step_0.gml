if(room == rm_menu) {
	if(keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter)) {
	switch(global.MENU_INDEX) {
		case 0: // HOST
			server = network_create_server(network_socket_tcp, PORT, MAX_CLIENTS);
			if (server < 0) {
				show_error("Could not create server.", false);
			}
			else {
				room_goto(rm_game);
				is_server = true;
			}
		break;
		
		case 1: // JOIN
			server = network_create_socket(network_socket_tcp);
			var res = network_connect(server, SERVER_IP, PORT);
	
			// Failed
			if (res < 0) {
				show_error("Could not connect to server.", false);
			}
			// Connected
			else {
				room_goto(rm_game);
			}
		break;
		
		case 2: // SETTINGS
		break;
		
		case 3: // CREDITS
		break;
		
		case 4: // EXIT
		break;
	}
}
}
else if (room == rm_game && is_server) {
	alarm[0] = 5 * game_get_speed(gamespeed_fps);
}