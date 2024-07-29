if(!instance_exists(obj_settings)) {
	if(keyboard_check_pressed(vk_escape)) {
		alarm[0] = 0.1 * game_get_speed(gamespeed_fps);
	}
	
	if(keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
	MenuNavigateUp(self);
	}

	else if(keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
		MenuNavigateDown(self);
	}

	// DEBUG: add mb left
	else if(keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left)) {
		MenuSelect(self);
	}

	if(instance_position(mouse_x, mouse_y, obj_menu_select_singleplayer) && menu_index != 0) {
		selected_with_mouse = true;
		menu_index = 0;
		audio_play_sound(snd_navigate, 1, false);
	}

	else if(instance_position(mouse_x, mouse_y, obj_menu_select_host) && menu_index != 1) {
		selected_with_mouse = true;
		menu_index = 1;
		audio_play_sound(snd_navigate, 1, false);
	}

	else if(instance_position(mouse_x, mouse_y, obj_menu_select_join) && menu_index != 2) {
		selected_with_mouse = true;
		menu_index = 2;
		audio_play_sound(snd_navigate, 1, false);
	}

	else if(instance_position(mouse_x, mouse_y, obj_menu_select_settings) && menu_index != 3) {
		selected_with_mouse = true;
		menu_index = 3;
		audio_play_sound(snd_navigate, 1, false);
	}
	else if(instance_position(mouse_x, mouse_y, obj_menu_select_tutorial) && menu_index != 4) {
		selected_with_mouse = true;
		menu_index = 4;
		audio_play_sound(snd_navigate, 1, false);
	}
	else if(instance_position(mouse_x, mouse_y, obj_menu_select_exit) && menu_index != 5) {
		selected_with_mouse = true;
		menu_index = 5;
		audio_play_sound(snd_navigate, 1, false);
	}
	else {
		selected_with_mouse = false;	
	}

	switch(menu_index) {
		case 0:
		layer_background_sprite(layer_background_get_id(layer_get_id("Background")), spr_menu_singleplayer);
		break;
	
		case 1:
		layer_background_sprite(layer_background_get_id(layer_get_id("Background")), spr_menu_host);
		break;
	
		case 2:
		layer_background_sprite(layer_background_get_id(layer_get_id("Background")), spr_menu_join);
		break;
	
		case 3:
		layer_background_sprite(layer_background_get_id(layer_get_id("Background")), spr_menu_settings);
		break;
		
		case 4:
		layer_background_sprite(layer_background_get_id(layer_get_id("Background")), spr_menu_tutorial);
		break;
		
		case 5:
		layer_background_sprite(layer_background_get_id(layer_get_id("Background")), spr_menu_exit);
		break;
	}	
}

if(keyboard_check_pressed(vk_escape) && instance_exists(obj_settings)) {
	instance_destroy(obj_settings);	
}