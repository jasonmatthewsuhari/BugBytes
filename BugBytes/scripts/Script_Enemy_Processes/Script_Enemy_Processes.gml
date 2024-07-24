///	@func								path_find()
///	@desc								
/// Scans the surrounding area and weighs all the points of interest, then path finds towards 
/// the highest weighted target using motion planning to avoid walls. (ie. obj_solid)
/// For the function to work, the object that calls this function must have the variables declared in 
/// #region  Target system variables and attack_dis (see existing enemy objects for examples)
function path_find() 
{
	
	#region handle pathfinding with weights
	//do we need to check for a new path?
	if check_path and calc_path_timer-- <= 0 {	
	
	calc_path_timer = calc_path_delay;
	#region
	// * visual only - reset visual cues.  We are checking each step, but ideally this is only needed
	//every 10-60 steps instead depending how 'smart' and responsive you want the AI to be
	path_clear();	
	// * visual only end
	#endregion
		
	//create a ds_list to store the possible targets
	var _list = ds_list_create();
	
	//check in a circle around us and store the number found in a variable
	var _num = collision_circle_list(x, y, range, class_Damageable_Friendly, false, true, _list, false);
	
	//did we find any instances?
	if (_num > 0) {
		//create an array to hold the possiblities
		options_arr = array_create(_num);	
		
		//loop through the instances found
	    for (var i = 0; i < _num; ++i;) {
			//get next instance id
	        var _id = _list[| i];
			
			/* init a weight temp value
			The weight is a value we will use to decide what is
			more important to us.  The highest weighted value is
			what we will move towards.  Weights are calculated 
			based on a set of rules you define, but by default
			they can simply be based on the distance we are to the instance	*/
			var _weight = 0;	
			
			//create a struct which holds the id and it's weight value
			options_arr[i] = {id : _id, weight : _weight}	
			

			/* Next we check what to do with the instance we can see.
			We base the weight on the distance to us, and we set a 
			weight value using map_value which maps our max range
			to a set of values, using the distance as the determing value.
			We can change these values to modify the instances
			weights and make objects more or less valuable to the character.
			*/
			
			//get the distance to the object
			var _dis = distance_to_object(_id);			
			
			//set a weight value, based on the object type, and how far away we are, scaling for each object
			switch(_id.object_index) {
				case obj_right_mouse_button:
					_weight = round(map_value(_dis, range, 5, 0, 20)) * !in_wall;	
				break;
				case obj_left_mouse_button:
					_weight = round(map_value(_dis, range, 5, 0, 50)) * !in_wall;
				break;
				case obj_left_arrow:
					_weight = round(map_value(_dis, range, 5, 0, 90)) * !in_wall;
				break;
				case obj_right_arrow:
					_weight = round(map_value(_dis, range, 5, 0, 90)) * !in_wall;
				break;
				case obj_up_arrow:
					_weight = round(map_value(_dis, range, 5, 0, 90)) * !in_wall;
				break;
				case obj_down_arrow:
					_weight = round(map_value(_dis, range, 5, 0, 90)) * !in_wall;
				break;
				case obj_w_key:
					_weight = round(map_value(_dis, range, 5, 0, 60)) * !in_wall;
				break;
				case obj_a_key:
					_weight = round(map_value(_dis, range, 5, 0, 60)) * !in_wall;
				break;
				case obj_s_key:
					_weight = round(map_value(_dis, range, 5, 0, 60)) * !in_wall;
				break;
				case obj_d_key:
					_weight = round(map_value(_dis, range, 5, 0, 60)) * !in_wall;
				break;
				case obj_inventory:
					_weight = round(map_value(_dis, range, 5, 0, 15)) * !in_wall;
				break;
				case obj_singleplayer:
					_weight = round(map_value(_dis, range, 5, 0, 60)) * !in_wall;
				break;
				case obj_flag:
					_weight = round(map_value(_dis, range, 5, 0, 20)) * !in_wall;
				break;
			}
			
			//add the weight to this instances struct value
			options_arr[i].weight = _weight;
	    }
	} else {
		
		#region
		// * visual only - clears the path which we draw to show the choice
		path_clear_points(path);
		target_id = noone;
		// * visual only end		
		#endregion
	}
	
	//clean up list
	ds_list_destroy(_list);

	//find the object with the highest weight, and set it as the target
	if _num > 0 {
		//init a default highest weight
		var _highest = 0;


		//ensure we found some instances
		if array_length(options_arr) > 0 {
			//loop through the found instances and get the highest weight
			for (var i = 0; i < _num; ++i) {
				if options_arr[i].weight > options_arr[_highest].weight _highest = i;
			}
		}
		
		//if we found a weight that was the highest, set as the target if the weight is not 0
		if options_arr[_highest].weight != 0 {
			
			#region
			// * visual only - clears the old path points, and add the players position as first point 
			path_clear_points(path);
			path_add_point(path, x, y, max_speed);
			// * visual only end
			#endregion
			
			//get the id of the highest weighted instance
			var _id = options_arr[_highest].id;
			
			var _dis = distance_to_object(_id);
			
			
			//set target values to this 
				target_pos_x = _id.x;
				target_pos_y = _id.y;
				target_id = _id
				
			
			
			#region visual only - add the path coordinates, and activate the path so we can draw it
			// * visual only - add the path coordinates, and activate the path so we can draw it
			// mp_potential_step(target_pos_x, target_pos_y, max_speed, false);
			if mp_grid_path(global.mp_grid, path, x, y, target_pos_x, target_pos_y, true) {
				path_start(path, max_speed, path_action_stop, false);
			}
			

			// * visual only end			
			#endregion
		}
	} 

	
	#region visual only - if no path coordinates exists, set the path to the chars start position
	// * visual only - if no path coordinates exists, set the path to the chars start position
	if path_get_number(path) == 0 {
		var _dis = distance_to_object(obj_flag);
		target_id = obj_flag;
		target_pos_x = obj_flag.x;
		target_pos_y = obj_flag.y;
		if mp_grid_path(global.mp_grid, path, x, y, target_pos_x, target_pos_y, true) {
			path_start(path, max_speed, path_action_stop, false);
			}
		}
		if _dis <= attack_dis {
			path_end();
			state = STATES.ATTACK;
		} else {
			state = STATES.MOVE;
		}
	

			

	// * visual only end	
	#endregion

	#region visual only - ensure range lerps to it's current target value
	// * visual only - ensure range lerps to it's current target value
	range = lerp(range, target_range, 0.1);
	image_xscale = lerp(abs(image_xscale), 1, 0.1) * sign(image_xscale);
	image_yscale = lerp(image_yscale, 1, 0.1);
	// * visual only end
	#endregion
	}

	#endregion
	
}





///	@desc map_value(input, input_start, input_end, output_start, output_end) 	
/// Takes an input value, clamped between 2 variables and
///	remaps it to another value between 2 other variables.
///	@param input				real input value
///	@param input_start			real input start value to map from
///	@param input_end			real input end value to map from
///	@param output_start			real start value to map to
///	@param output_end			real end value to map to
function map_value(_in, _ins, _ine, _outs, _oute) 
{

	//Figure out how 'wide' each range is
	var inr = _ine - _ins;
	var outr = _oute - _outs;

	//Convert the in range into a 0-1 range
	var in_scaled = (_in - _ins) / (inr);

	//Convert that 0-1 range into a value in the out range.
	return _outs + (in_scaled * outr);

}

/// @desc check_facing()
/// Checks where the entity is facing and set its face value accordingly
/// For the function to work, the object that calls this function must have the variables face, target_pos_x and target_pos_y
function check_facing() 
{
	aim_direction = point_direction(weapon_x, weapon_y, target_pos_x, target_pos_y);
	if aim_direction < 270 and aim_direction > 90 {
		face = -1;
	} else {
		face = 1;
	}
}

/// @desc enemy_anim()
/// Handles enemy animation based on the current state of the enemy object.
/// For the function to work, the object that calls this function must have the variables declared in 
/// #region sprite, state variables (see existing enemy objects for examples)


/// @desc enemy_anim()
/// Handles enemy animation based on the current state of the enemy object.
/// For the function to work, the object that calls this function must have the variables declared in 
/// #region sprite, state variables (see existing enemy objects for examples)
function enemy_anim() 
{
	switch(state) {
		case STATES.IDLE:
			sprite_index = spr_idle;
		break;
		case STATES.MOVE:
			sprite_index = spr_move;
		break;
		case STATES.ATTACK:
			sprite_index = spr_attack;
		break;
		case STATES.HURT:
			sprite_index = spr_hurt;
			flash_alpha = 1;
		break;
		case STATES.DEAD:
			sprite_index = spr_dead;
		break;
	}	
		
}

/// @desc perform attack()
/// Performs an attack (currently for pure melee enemies only)
/// For the function to work, the object that calls this function must have the variables declared in 
/// #region initialise attack variables and a valid target (see existing enemy objects for examples)
function perform_attack() 
{
	if timer <= 0 and image_index >= attack_frame {
		//reset for next attack
		timer = cooldown;
		
		// get attack direction
		var _dir = point_direction(x, y, target_pos_x, target_pos_y);
		
		// get attack position
		var _xx = x + lengthdir_x(attack_dis, _dir);
		var _yy = y + lengthdir_y(attack_dis, _dir);
		
		// create hitbox and pass variables to hitbox
		var _inst = instance_create_layer(_xx, _yy, "Instances", obj_enemy_hitbox);
		_inst.owner_id = id;
		_inst.damage = damage;
		
	} else {
		timer--
	}
}	


function spawn_enemies() 
{
	
}

///	@func								path_find()
///	@desc								
/// Scans the surrounding area and weighs all the points of interest, then path finds towards 
/// the highest weighted target, flying over collision walls
/// For the function to work, the object that calls this function must have the variables declared in 
/// #region  Target system variables and attack_dis (see existing enemy objects for examples)
function path_find_flies() 
{
	
	#region handle pathfinding with weights
	//do we need to check for a new path?
	if check_path and calc_path_timer-- <= 0 {	
	
	calc_path_timer = calc_path_delay;
	#region
	// * visual only - reset visual cues.  We are checking each step, but ideally this is only needed
	//every 10-60 steps instead depending how 'smart' and responsive you want the AI to be
	path_clear();	
	// * visual only end
	#endregion
		
	//create a ds_list to store the possible targets
	var _list = ds_list_create();
	
	//check in a circle around us and store the number found in a variable
	var _num = collision_circle_list(x, y, range, class_Damageable_Friendly, false, true, _list, false);
	
	//did we find any instances?
	if (_num > 0) {
		//create an array to hold the possiblities
		options_arr = array_create(_num);	
		
		//loop through the instances found
	    for (var i = 0; i < _num; ++i;) {
			//get next instance id
	        var _id = _list[| i];
			
			/* init a weight temp value
			The weight is a value we will use to decide what is
			more important to us.  The highest weighted value is
			what we will move towards.  Weights are calculated 
			based on a set of rules you define, but by default
			they can simply be based on the distance we are to the instance	*/
			var _weight = 0;	
			
			//create a struct which holds the id and it's weight value
			options_arr[i] = {id : _id, weight : _weight}	
			

			/* Next we check what to do with the instance we can see.
			We base the weight on the distance to us, and we set a 
			weight value using map_value which maps our max range
			to a set of values, using the distance as the determing value.
			We can change these values to modify the instances
			weights and make objects more or less valuable to the character.
			*/
			
			//get the distance to the object
			var _dis = distance_to_object(_id);			
			
			//set a weight value, based on the object type, and how far away we are, scaling for each object
			switch(_id.object_index) {
				case obj_right_mouse_button:
					_weight = round(map_value(_dis, range, 5, 0, 20)) * !in_wall;	
				break;
				case obj_left_mouse_button:
					_weight = round(map_value(_dis, range, 5, 0, 50)) * !in_wall;
				break;
				case obj_left_arrow:
					_weight = round(map_value(_dis, range, 5, 0, 90)) * !in_wall;
				break;
				case obj_right_arrow:
					_weight = round(map_value(_dis, range, 5, 0, 90)) * !in_wall;
				break;
				case obj_up_arrow:
					_weight = round(map_value(_dis, range, 5, 0, 90)) * !in_wall;
				break;
				case obj_down_arrow:
					_weight = round(map_value(_dis, range, 5, 0, 90)) * !in_wall;
				break;
				case obj_w_key:
					_weight = round(map_value(_dis, range, 5, 0, 60)) * !in_wall;
				break;
				case obj_a_key:
					_weight = round(map_value(_dis, range, 5, 0, 60)) * !in_wall;
				break;
				case obj_s_key:
					_weight = round(map_value(_dis, range, 5, 0, 60)) * !in_wall;
				break;
				case obj_d_key:
					_weight = round(map_value(_dis, range, 5, 0, 60)) * !in_wall;
				break;
				case obj_inventory:
					_weight = round(map_value(_dis, range, 5, 0, 15)) * !in_wall;
				break;
				case obj_singleplayer:
					_weight = round(map_value(_dis, range, 5, 0, 60)) * !in_wall;
				break;
				case obj_flag:
					_weight = round(map_value(_dis, range, 5, 0, 20)) * !in_wall;
				break;
			}
			
			//add the weight to this instances struct value
			options_arr[i].weight = _weight;
	    }
	} else {
		
		#region
		// * visual only - clears the path which we draw to show the choice
		path_clear_points(path);
		target_id = noone;
		// * visual only end		
		#endregion
	}
	
	//clean up list
	ds_list_destroy(_list);

	//find the object with the highest weight, and set it as the target
	if _num > 0 {
		//init a default highest weight
		var _highest = 0;


		//ensure we found some instances
		if array_length(options_arr) > 0 {
			//loop through the found instances and get the highest weight
			for (var i = 0; i < _num; ++i) {
				if options_arr[i].weight > options_arr[_highest].weight _highest = i;
			}
		}
		
		//if we found a weight that was the highest, set as the target if the weight is not 0
		if options_arr[_highest].weight != 0 {
			
			
			//get the id of the highest weighted instance
			var _id = options_arr[_highest].id;
			
			var _dis = distance_to_object(_id);
			
			
			//set target values to this 
			target_pos_x = _id.x;
			target_pos_y = _id.y;
			target_id = _id
			
				
			
		} else {
			var _dis = distance_to_object(obj_flag);
			target_id = obj_flag;
			target_pos_x = obj_flag.x;
			target_pos_y = obj_flag.y;
		}
	} 
		var _dis = distance_to_object(target_id);
		move_towards_point(target_pos_x, target_pos_y, max_speed);
		if _dis <= attack_dis {
			speed = 0;
			state = STATES.ATTACK;
		} else {
			state = STATES.MOVE;
		}
	

			

	// * visual only end	
	#endregion

	#region visual only - ensure range lerps to it's current target value
	// * visual only - ensure range lerps to it's current target value
	range = lerp(range, target_range, 0.1);
	image_xscale = lerp(abs(image_xscale), 1, 0.1) * sign(image_xscale);
	image_yscale = lerp(image_yscale, 1, 0.1);
	// * visual only end
	#endregion
	}

	#endregion
	
}