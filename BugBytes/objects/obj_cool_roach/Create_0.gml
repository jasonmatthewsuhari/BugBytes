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

#region Target system variables
//init weighting variables
//set range distance we can scan, and set as an initial value so we can return to it
range_initial = 500;
range = range_initial;

//setting a target range allows us to animate the range circle towards a target using lerp
target_range = range;

/*
//characters hp and max hp, what colour to draw sprite as, and how many keys we have
hp_max = 100;
hp = hp_max;
col = c_white;
keys = 0;
*/

//target values and instance to set path to, and to draw a stroke around instance
target_pos_x = x;
target_pos_y = y;
target_id = obj_flag;

//the path we draw to show where we want to move
path = path_add();
move_spd_initial = 15;
move_spd = move_spd_initial;
//add our current position as the first path point
path_add_point(path, x, y, move_spd);

//do we need to check the path this step?
check_path = true;

//an array holding the id and weight of the found instances within our range
options_arr = [];

// * visual only - set variables to show what is happening and for dragging instance around
draw_set_circle_precision(64);
draw_set_halign(fa_center);
carry = false;						//should the char be carried with the mouse?
xoffset = 0;						//stops snapping to mouse when dragging initially
yoffset = 0;						//stops snapping to mouse when dragging initially
item_spawn_time = 240;				//time until instances respawn
key_stt = {};						//struct holding keys respawn position
heart_stt = {};						//struct holding hearts respawn position
potion_stt = {};					//struct holding potions respawn position

//instance function for clearing the path and target
path_clear = function() {
	check_path = true;
	path_end();
	path_clear_points(path);
	target_id = noone;		
}
// * end visual only 

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
