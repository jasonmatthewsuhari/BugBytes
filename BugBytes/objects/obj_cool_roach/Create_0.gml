/// @description Initialise cool_roach


#region Health, movement, spawn location 

health_bar = f_create_healthbar(self, 100);


max_speed = 2;
curr_speed = max_speed;

// spawn location
if (instance_exists(obj_no_go)) {
	x = obj_no_go.x + 80;
	y = obj_no_go.y;
}

#endregion

#region Target system variables (not done)
targets = ds_list_create();
for (var i = 0; i < instance_count; i ++;)
{
    with (instance_id[i]) 
	{
		// if (object_get_parent(self.object_index) == class_Friendly)		ds_list_add(targets, self);	
	}
}

curr_target = noone;

#endregion

#region Character sprite control
face = SPRITE.RIGHT;								// index of the sprite based on where it is facing
image_index = face;
aim_direction = 0;						// aim direction (in degrees) of the sprite


#endregion

#region weapon sprite control

weapon_x_offset = 28;					// offset x pos from player origin for weapons
weapon_y_offset = -10;					// offset y pos from player origin for weapons
weapon_x = x - weapon_x_offset;			// x pos for where weapon should be drawn 
weapon_y = y + weapon_y_offset;			// y pos for where weapon should be drawn 

weapon = f_create_weapon(self, obj_revolver);

#endregion


#region attack pattern

cooldown = 2 * 60;
timer = cooldown;


#endregion