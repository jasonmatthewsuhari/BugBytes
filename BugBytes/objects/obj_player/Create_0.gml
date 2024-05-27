/// @description Initialise player

max_hp = 100;
curr_hp = max_hp;
max_speed = 3;
curr_speed = max_speed;
if (instance_exists(obj_flag)) {
	x = obj_flag.x;
	y = obj_flag.y;
}

curr_mouse_x = x;		// track last left clicked mouse x pos
curr_mouse_y = y;		// track last left clicked mouse y pos

// sprite control
face = 0;					// index of the sprite based on where it is facing
image_index = face;
aim_direction = 0;			// aim direction (in degrees) of the sprite


enum SPRITE 
{
	LEFT = 0,
	RIGHT = 1,
	UP = 2,
	DOWN = 3
}

// initialise useable controls
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




	
