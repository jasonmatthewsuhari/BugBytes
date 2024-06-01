/// @description Initialise camera

follow = noone;
if (instance_exists(obj_singleplayer)) {
	follow = obj_singleplayer;
}

cam_width = room_get_viewport(room, 0)[3];
cam_height = room_get_viewport(room, 0)[4];

x_to = x;
x_to = y;
