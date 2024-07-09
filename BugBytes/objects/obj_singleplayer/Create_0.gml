/// @description Initialise player

#region Spawning, inventory and movement variables

event_inherited();

max_speed = 3;
curr_speed = max_speed;

respawn_timer = 3;						// respawn timer in seconds

// spawn location
if (instance_exists(obj_flag)) {
	x = obj_flag.x + irandom_range(- 120, 120);
	y = obj_flag.y + irandom_range(- 120, 120);
}

curr_mouse_x = x;						// track last left clicked mouse x pos
curr_mouse_y = y;						// track last left clicked mouse y pos

xp = x;
yp = y;

#endregion

#region Character sprite control
face = 1;								// index of the sprite based on where it is facing
aim_direction = 0;						// aim direction (in degrees) of the sprite

#endregion

#region weapon sprite control

weapon_x_offset = 28;					// offset x pos from player origin for weapons
weapon_y_offset = 17;					// offset y pos from player origin for weapons
weapon_x = x + face * weapon_x_offset;			// x pos for where weapon should be drawn 
weapon_y = y + weapon_y_offset;			// y pos for where weapon should be drawn 

weapon = global.weapon_list.revolver;

#endregion

#region initialise useable controls
useable = 
{
	left_arrow: instance_exists(obj_left_arrow) ? true : false,
	right_arrow: instance_exists(obj_right_arrow) ? true : false,
	up_arrow: instance_exists(obj_up_arrow) ? true : false,
	down_arrow: instance_exists(obj_down_arrow) ? true : false,
	
	w_key: instance_exists(obj_w_key) ? true : false,
	a_key: instance_exists(obj_a_key) ? true : false,
	s_key: instance_exists(obj_s_key) ? true : false,
	d_key: instance_exists(obj_d_key) ? true : false,
	
	left_mouse_button: instance_exists(obj_left_mouse_button) ? true : false,
	right_mouse_button: instance_exists(obj_right_mouse_button) ? true : false,
	inventory: instance_exists(obj_inventory) ? true : false
};

#endregion