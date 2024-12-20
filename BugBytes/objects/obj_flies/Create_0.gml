/// @description Initialise demon
event_inherited();

#region Health, sprite, state variables

max_speed = 1.2;
curr_speed = max_speed;

spr_idle = spr_flies;
spr_attack = spr_flies;
spr_dead = spr_flies;
spr_hurt = spr_flies;
spr_move = spr_flies;

state = STATES.IDLE;
face = 1;

// init previous positions
xp = x;
xy = y;


/*
// spawn location
if (instance_exists(obj_no_go)) {
	x = obj_no_go.x + 80;
	y = obj_no_go.y;
}
*/

#endregion

#region Target system variables

//init weighting variables
//set range distance we can scan, and set as an initial value so we can return to it
range_initial = 500;
range = range_initial;

// set a random timer for when we calc a path
calc_path_delay = 1;
calc_path_timer = irandom(30);

//setting a target range allows us to animate the range circle towards a target using lerp
target_range = range;

//target values and instance to set path to, and to draw a stroke around instance
target_pos_x = x;
target_pos_y = y;
target_id = obj_flag;

//the path we draw to show where we want to move
path = path_add();
//add our current position as the first path point
path_add_point(path, x, y, max_speed);

//do we need to check the path this step?
check_path = true;

//do we need to draw path
// check_draw = true;					// changed to global.check_draw

//an array holding the id and weight of the found instances within our range
options_arr = [];

// * visual only - set variables to show what is happening and for dragging instance around
draw_set_circle_precision(64);
draw_set_halign(fa_center);

//instance function for clearing the path and target
path_clear = function() {
	check_path = true;
	path_end();
	path_clear_points(path);
	target_id = noone;		
}
// * end visual only 

#endregion

#region initialise attack variables
attack_frame = 0;						// Sprite attack frame 
cooldown = 2 * game_get_speed(gamespeed_fps);				// Attack cooldown of the weapon in frames
timer = 0;					// Timer for weapon cooldown
damage = 15;						// Damage of the weapon
attack_dis = 0;
weapon_x = x;
weapon_y = y;

#endregion