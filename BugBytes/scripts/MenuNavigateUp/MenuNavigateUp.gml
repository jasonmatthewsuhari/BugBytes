function MenuNavigateUp(menu){
	if(menu.menu_index <= 0) {
		menu.menu_index = array_length(menu.menu_options) - 1;
	}
    else {
		menu.menu_index -= 1;
	}
	
	return menu.menu_index;
}