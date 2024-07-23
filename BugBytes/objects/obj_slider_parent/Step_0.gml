if(mouse_check_button_pressed(mb_left)) {
	var button_x = x + sprite_width * value;
	var button_y = y;
	var button_width = sprite_get_width(spr_bob);
	var button_height = sprite_get_height(spr_bob);
	
	if(point_in_rectangle(mouse_x, mouse_y, button_x - button_width / 2, button_y - button_height / 2, button_x + button_width / 2, button_y + button_height / 2)) {
		selected = true;
	}
}

if(!mouse_check_button(mb_left)) {
	selected = false;	
}

if(selected) {
	value = clamp((mouse_x - x) / sprite_width, 0, max_value - 0.05);
}