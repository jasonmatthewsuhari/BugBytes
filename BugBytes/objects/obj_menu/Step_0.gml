if(keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
	MenuNavigateUp(self);
}

else if(keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
	MenuNavigateDown(self);
}

else if(keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
	MenuSelect(self);
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
}