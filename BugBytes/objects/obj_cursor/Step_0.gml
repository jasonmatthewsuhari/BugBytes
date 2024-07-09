x = mouse_x;
y = mouse_y;

if(mouse_check_button(mb_left)) {
    sprite_index = spr_cursor_click;
} 
else if(place_meeting(x,y,obj_menu_select_parent)) {
	sprite_index = spr_cursor_grab
}
else {
    sprite_index = spr_cursor_normal;
}