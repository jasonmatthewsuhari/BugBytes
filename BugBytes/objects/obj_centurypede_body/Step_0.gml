event_inherited();

if(!left_neighbor) {
	move_towards_point(class_Damageable_Friendly.x, class_Damageable_Friendly.y,0.5);
}
else {
	y += irandom_range(-wriggle, wriggle);
	x = clamp(x, left_neighbor.x - upper_limit, left_neighbor.x + lower_limit);
	y = clamp(y, left_neighbor.y - upper_limit, left_neighbor.y + lower_limit);	
}

var shake_value = 2.5 - (point_distance(obj_camera.x, obj_camera.y, x, y)/700) * 1.5
show_debug_message(shake_value);
Screenshake(0.5,shake_value,0.1);

