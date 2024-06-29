function MenuNavigateDown(menu){
	if(menu.menu_index == array_length(menu.menu_options) - 1) {
		menu.menu_index = 0;
	}
    else {
		menu.menu_index += 1;
	}
	
	return menu.menu_index;
}