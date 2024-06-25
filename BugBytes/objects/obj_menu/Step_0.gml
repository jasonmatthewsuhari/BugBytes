if(keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || mouse_wheel_up()) {
    menu_index -= 1;
}

if(keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")) || mouse_wheel_down()) {
    menu_index += 1;
}

if(keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
	switch(menu_index) {
		// SINGLEPLAYER
		case 0:
			room_goto(rm_singleplayer);
		break;
		
		// MULTIPLAYER HOST
		case 1:
			room_goto(rm_lobby);
			instance_create_layer(0, 0, "Instances", obj_server);
		break;
		
		// MULTIPLAYER JOIN
		case 2:
			room_goto(rm_lobby);
			instance_create_layer(0, 0, "Instances", obj_client);
		break;
	}
}

// Clamp the MENU_INDEX value
menu_index = clamp(menu_index, 0, array_length(menu_options) - 1);