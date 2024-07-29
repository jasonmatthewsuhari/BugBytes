/// @description Initialise camera

follow = noone;
if (instance_exists(obj_singleplayer)) {
	follow = obj_singleplayer;
}

cam_width = room_get_viewport(room, 0)[3];
cam_height = room_get_viewport(room, 0)[4];

cam_width = 640;
cam_height = 360;

x_to = x;
y_to = y;