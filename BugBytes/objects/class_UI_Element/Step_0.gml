
if(flash_alpha > 0) {
	flash_alpha -= 0.1;	
}
in_wall = place_meeting(x,y,obj_solid);

if(curr_hp <= 0) {
	
	if(grounded) { 
		instance_destroy(); 
	}
	else {
		Screenshake(7,15,0.2);
		curr_hp = max_hp;
		grounded = true;
	}
	
}
	
else {
	if(!grounded) {
		var vx = camera_get_view_x(view_camera[0]);
		var vy = camera_get_view_y(view_camera[0]);
	
		x = vx + ui_position_x;
		y = vy + ui_position_y;	
	}
}