event_inherited();


x += lengthdir_x(5, going_direction);
y += lengthdir_y(5, going_direction);

if(point_distance(x,y,obj_camera.x,obj_camera.y) > 1500) {
	// x = ranodm place
	going_direction = point_direction(x,y,obj_singleplayer.x, obj_singleplayer.y);
}