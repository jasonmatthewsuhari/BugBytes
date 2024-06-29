if(keyboard_string != "") {
	global.username += keyboard_string;
	keyboard_string = "";
}
	
if(keyboard_check_pressed(vk_backspace)) {
	if (string_length(global.username) > 0) {
		global.username = string_delete(global.username, string_length(global.username), 1);
	}
}


