if(keyboard_check_pressed(vk_space)) {
	switch(global.MENU_INDEX) {
		case 0: // HOST
			server = network_create_server(network_socket_tcp, PORT, MAX_PLAYERS);
			room_goto(rm_game);
			server_identity = true;
			// to check for failed hosting later
		break;
		
		case 1: // JOIN
			server = network_create_socket(network_socket_tcp);
			connection = network_connect(server, SERVER_IP, PORT);
			room_goto(rm_game);
			// to check for failed connection later
		break;
		
		case 2: // SETTINGS
		// with menu object,
		// set to visible
		break;
		
		case 3: // CREDITS
		// switch to credits room
		break;
		
		case 4: // EXIT
		game_end("Game has been ended by the user.");
		break;
	}
}