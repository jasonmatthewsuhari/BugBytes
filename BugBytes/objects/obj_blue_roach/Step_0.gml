/// @description Insert description here
// You can write your code in this editor

if !global.time_stop {

#region handle character HP tracking

f_check_healthbar(self);

#endregion

#region handle diagonal speed

if (x != xprevious && y != yprevious) {
	curr_speed = sqrt(2) / 2 * max_speed;
} else {
	curr_speed = max_speed;
}

#endregion

#endregion

#region handle pathfinding with weights
//do we need to check for a new path?
if check_path {	
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
					_weight = round(map_value(_dis, range, 5, 0, 20));	
				break;
				case obj_left_mouse_button:
					_weight = round(map_value(_dis, range, 5, 0, 50));
				break;
				case obj_left_arrow:
					_weight = round(map_value(_dis, range, 5, 0, 90));
				break;
				case obj_right_arrow:
					_weight = round(map_value(_dis, range, 5, 0, 90));
				break;
				case obj_up_arrow:
					_weight = round(map_value(_dis, range, 5, 0, 90));
				break;
				case obj_down_arrow:
					_weight = round(map_value(_dis, range, 5, 0, 90));
				break;
				case obj_w_key:
					_weight = round(map_value(_dis, range, 5, 0, 60));
				break;
				case obj_a_key:
					_weight = round(map_value(_dis, range, 5, 0, 60));
				break;
				case obj_s_key:
					_weight = round(map_value(_dis, range, 5, 0, 60));
				break;
				case obj_d_key:
					_weight = round(map_value(_dis, range, 5, 0, 60));
				break;
				case obj_singleplayer:
					_weight = round(map_value(_dis, range, 5, 0, 60));
				break;
				case obj_flag:
					_weight = round(map_value(_dis, range, 5, 0, 20));
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
			path_add_point(path, x, y, move_spd);
			// * visual only end
			#endregion
			
			//get the id of the highest weighted instance
			var _id = options_arr[_highest].id;
			
			//set target values to this 
				target_pos_x = _id.x;
				target_pos_y = _id.y;
				target_id = _id
			
			#region visual only - add the path coordinates, and activate the path so we can draw it
			// * visual only - add the path coordinates, and activate the path so we can draw it
			path_add_point(path, target_pos_x, target_pos_y, move_spd);
			path_start(path, move_spd, path_action_stop, false);
			// * visual only end			
			#endregion
		}
	} 

	
	#region visual only - if no path coordinates exists, set the path to the chars start position
	// * visual only - if no path coordinates exists, set the path to the chars start position
	if path_get_number(path) == 0 {
		path_add_point(path, x, y, move_spd);
		path_add_point(path, obj_flag.x, obj_flag.y, move_spd);
		//target_pos_y = ystart;
		path_start(path, move_spd, path_action_stop, false);
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