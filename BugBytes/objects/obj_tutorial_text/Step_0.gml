/// @description Insert description here
// You can write your code in this editor
switch(current_line) {
	case 0:
        if(move_on) {
               current_line++;
               move_on = false;
          }
	break;
	case 1:
		if(keyboard_check_pressed(ord("W")) or keyboard_check_pressed(ord("A")) or keyboard_check_pressed(ord("S")) or keyboard_check_pressed(ord("D")) or keyboard_check_pressed(vk_up) or keyboard_check_pressed(vk_down) or keyboard_check_pressed(vk_left) or keyboard_check_pressed(vk_right) or mouse_check_button_pressed(mb_left)) {
                 current_line++;
		}
	break;
    case 2:
        if(!instance_exists(obj_ant)) {
                  current_line++;
		}	
	break;
	case 3:
		if (obj_inventory.inventory.curr_capacity() > 3) {
			current_line++;
		}
	break;
	case 4:
		if (obj_inventory.inventory.curr_capacity() < 4) {
			current_line++;
		}
	break;
    case 5:
        if(obj_next.curr_hp >= obj_next.max_hp) {
                 alarm[0] = 5 * game_get_speed(gamespeed_fps);
				 current_line++; 
				 }
	break;
    case 6:
       
       if(move_on) {
            room_goto(rm_menu);
       }
	   break;
	
}