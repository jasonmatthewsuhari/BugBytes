x = camera_get_view_x(view_camera[0]);
y = camera_get_view_y(view_camera[0]);

if(keyboard_check_pressed(vk_enter)) {
	index++;	
}

switch(index) {
	case 0:
		sprite_index = spr_scene_1;
	break;
	
	case 1:
		sprite_index = spr_scene_2;
	break;
	
	case 2:
		sprite_index = spr_scene_3;
	break;
	
	case 3:
		sprite_index = spr_scene_4;
	break;
	
	case 4:
		sprite_index = spr_scene_5;
	break;
	
	case 5:
		sprite_index = spr_scene_6;
	break;
	
	case 6:
		instance_destroy();
	break;
}