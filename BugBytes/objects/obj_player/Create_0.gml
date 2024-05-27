/// @description Initialise player

#region Health and movement variables

health_bar = instance_create_depth(x, y - obj_player.sprite_height / 2 - 10, depth, class_HealthDisplay,
{
	owner: obj_player,
	max_hp: 100,
	curr_hp: 100		
});



max_speed = 3;
curr_speed = max_speed;
if (instance_exists(obj_flag)) {
	x = obj_flag.x;
	y = obj_flag.y;
}

curr_mouse_x = x;				// track last left clicked mouse x pos
curr_mouse_y = y;				// track last left clicked mouse y pos

#region sprite control
face = 0;						// index of the sprite based on where it is facing
image_index = face;
aim_direction = 0;				// aim direction (in degrees) of the sprite
weapon_x_offset = 28;			// offset x pos from player origin for weapons
weapon_y_offset = 17;			// offset y pos from player origin for weapons
weapon_x = x - weapon_x_offset;	// x pos for where weapon should be drawn 
weapon_y = y + weapon_y_offset;	// y pos for where weapon should be drawn 

enum SPRITE 
{
	LEFT = 0,
	RIGHT = 1,
	UP = 2,
	DOWN = 3
}

#endregion

#region initialise useable controls
useable = 
{
	left_arrow: true,
	right_arrow: true,
	up_arrow: true,
	down_arrow: true,
	
	w_key: true,
	a_key: true,
	s_key: true,
	d_key: true,
	
	left_mouse_button: true,
	right_mouse_button: true
};

#endregion


	
