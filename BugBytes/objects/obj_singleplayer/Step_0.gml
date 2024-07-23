/// @description Insert description here
// You can write your code in this editor

event_inherited();

if global.shop exit;			// if shop open, exit step

#region fire weapon

if is_instanceof(weapon, Weapon) {
	if weapon == (global.weapon_list.heal_gun) {
		fire_weapon(class_Damageable_Friendly);
	} else {
		fire_weapon(class_Damageable_Enemy);
	}
	
}

#endregion

#region handle movement options

#region handle left mouse click movement

var _dist_from_mouse = point_distance(x, y, curr_mouse_x, curr_mouse_y);

if (point_distance(x, y, curr_mouse_x, curr_mouse_y) > curr_speed) {
	move_towards_point(curr_mouse_x, curr_mouse_y, speed);
} else {
	speed = 0;
}


#endregion

#region handle diagonal speed

if (x != xprevious && y != yprevious) {
	curr_speed = sqrt(2) / 2 * max_speed;
} else {
	curr_speed = max_speed;
}

#endregion


#endregion


#region handle character sprite control


aim_direction = point_direction(x, y, mouse_x, mouse_y);

if (aim_direction <= 90 || aim_direction > 270) {
	face = 1;
} else if (aim_direction <= 270) {
	face = -1;
} else { }


#endregion

#region handle weapon tracking and weapon swap

weapon_x = x + face * weapon_x_offset;
weapon_y = y + weapon_y_offset;

#region handle useable control tracking
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

if useable.inventory {
	var _len = obj_inventory.inventory.curr_capacity();
	if (keyboard_check_pressed(ord("1"))) {
		if _len >= 1		weapon = obj_inventory.inventory._inventory_items[0].item;
	} else if (keyboard_check_pressed(ord("2"))) {
		if _len	>=2			weapon = obj_inventory.inventory._inventory_items[1].item;
	} else if (keyboard_check_pressed(ord("3"))) {
		if _len >= 3		weapon = obj_inventory.inventory._inventory_items[2].item;
	} else if (keyboard_check_pressed(ord("4"))) {
		if _len >= 4		weapon = obj_inventory.inventory._inventory_items[3].item;
	} else if (keyboard_check_pressed(ord("5"))) {
		if _len >= 5		weapon = obj_inventory.inventory._inventory_items[4].item;
	} else { }
}

#endregion

