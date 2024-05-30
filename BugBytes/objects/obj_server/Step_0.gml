if(room == rm_menu) {
	if(keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter)) {
	switch(global.MENU_INDEX) {
		case 0: // SINGLEPLAYER
			room_goto(rm_game);
		break;
		
		case 1: // HOST
			server = network_create_server(network_socket_tcp, PORT, MAX_CLIENTS);
			if (server < 0) {show_error("Could not create a server.", false);}
			else {
				room_goto(rm_game);
				is_server = true;
				global.IS_MULTIPLAYER = true;
			}
		break;
		
		case 2: // JOIN
			server = network_create_socket(network_socket_tcp);
			var connection = network_connect(server, SERVER_IP, PORT);
			
			if (connection < 0) {show_error("Could not connect to a server.", false);}
			else {
				room_goto(rm_game);
				global.IS_MULTIPLAYER = true;
				}
		break;
		
		case 3: // CREDITS
		break;
		
		case 4: // EXIT
		break;
		}
	}
}