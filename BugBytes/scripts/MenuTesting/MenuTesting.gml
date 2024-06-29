function MenuTesting(){
	// SECTION 1: MENU TESTING
	file_text_write_string(global.file, "SECTION 1: MENU TESTING\n");
	
	/// Test 1 - Navigating up on the menu with W / Up Arrow
	file_text_write_string(global.file, "Test 1 - Navigating Up with W / Up-Arrow: " + boolstr(MenuNavigateUp(obj_menu) == array_length(obj_menu.menu_options) - 1) + "\n"); 
	
	/// Test 2 - Navigating down on the menu with S / Down Arrow
	file_text_write_string(global.file, "Test 2 - Navigating Down with S / Down-Arrow: " + boolstr(MenuNavigateDown(obj_menu) == 0) + "\n"); 
	
	/// Test 3 - Randomly navigating
	up_times = irandom(10);
	down_times = irandom(10);
	expected_result = abs(obj_menu.menu_index + up_times - down_times) mod (array_length(obj_menu.menu_options));
	
	for(var i = 0; i < up_times; i++) {
		MenuNavigateUp(obj_menu);
	}
	for(var i = 0; i < down_times; i++) {
		MenuNavigateDown(obj_menu);
	}
	
	file_text_write_string(global.file, "Test 3 - Randomly navigating: " + boolstr(obj_menu.menu_index == expected_result) + "\n"); 
	
	/// Test 4 - Selecting Singleplayer
	/*
	number_of_increments = obj_menu.menu_index
	for(var i = 0; i < number_of_increments; i++) {
		MenuNavigateUp(obj_menu);	
	}
	*/
	
	//MenuSelect(obj_menu);
	/*
	room_goto(rm_singleplayer);
	if(room == rm_singleplayer) {
		show_message("Singleplayer");
	}
	else {
		show_message("Not singleplayer");	
	}
	
	file_text_write_string(global.file, "Test 4 - Selecting singleplayer: " + boolstr(room == rm_singleplayer) + "\n"); 
	*/
	
	/// Test 5 - Exiting Singleplayer
	//ReturnToMenu();
	
	/// Test 6 - Selecting Multiplayer Host
	
	/// Test 7 - Exiting Multiplayer As a Host
	
	/// Test 8 - Selecting Multiplayer Join
	
	/// Test 9 - Exiting Multiplayer As a Client
	
	file_text_close(global.file);
}