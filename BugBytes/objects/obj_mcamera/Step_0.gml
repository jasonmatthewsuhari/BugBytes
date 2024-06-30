if(target != noone) {
	xTo = target.x;
	yTo = target.y;
}


show_debug_message(target);
x += (xTo - x) / camera_speed;
y += (yTo - y) / camera_speed;

camera_set_view_pos(view_camera[0], x - (cam_width*0.5), y - (cam_height * 0.5));