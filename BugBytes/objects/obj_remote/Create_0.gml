image_speed = 0;
name = "";

weapon_x_offset = 28;					// offset x pos from player origin for weapons
weapon_y_offset = 17;					// offset y pos from player origin for weapons
weapon_x = x - weapon_x_offset;			// x pos for where weapon should be drawn 
weapon_y = y + weapon_y_offset;	

weapon = f_create_weapon(self, obj_revolver);

remote_mouse_x = 0;
remote_mouse_y = 0;