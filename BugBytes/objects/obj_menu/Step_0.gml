if(keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
	MenuNavigateUp(self);
}

else if(keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
	MenuNavigateDown(self);
}

else if(keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
	MenuSelect(self);
}