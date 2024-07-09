event_inherited();

if(curr_hp <= 0) {
	
	if(grounded) { 
		instance_destroy(); 
		}
	curr_hp = max_hp;
	grounded = true;
}

else {
	if(!grounded) {
		var vx = camera_get_view_x(view_camera[0]);
		var vy = camera_get_view_y(view_camera[0]);
	
		x = vx + ui_position_x;
		y = vy + ui_position_y;	
	}
}