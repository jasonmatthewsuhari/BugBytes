/// @description Initialise camera

follow = noone;
if (instance_exists(obj_player)) {
	follow = obj_player;
}

cam_width = room_get_viewport(room, 0)[3];
cam_height = room_get_viewport(room, 0)[4];

x_to = x;
x_to = y;
