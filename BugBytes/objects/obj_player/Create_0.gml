<<<<<<< Updated upstream
// WASD = 0123
movement_array = array_create(4,0);
walking_speed = 5;
hspd = 0;
vspd = 0;
=======
/// @description Initialise Player

max_speed = 4;
curr_speed = max_speed
my_hp = 200;

curr_mouse_x = mouse_x;
curr_mouse_y = mouse_y;

#region sprite control

enum SPRITE{
	LEFT = 0,
	RIGHT = 1,
	UP = 2,
	DOWN = 3
}

face = SPRITE.RIGHT;
aim_direction = 0;
weapon_x_offset = 105;			// pixel difference between origin and weapon placement for x
weapon_y_offset = 50;			// pixel difference between origin and weapon placement for y
weapon_x = x + weapon_x_offset;
weapon_y = y + weapon_y_offset;

#endregion

#region initialise useable controls
useable = {
	left_arrow : true,
	right_arrow: true,
	up_arrow: true,
	down_arrow: true,
	
	w_key: true,
	a_key: true,
	s_key: true,
	d_key: true,
	
	left_mouse_button: true,
	right_mouse_button: true
}

#endregion
>>>>>>> Stashed changes

