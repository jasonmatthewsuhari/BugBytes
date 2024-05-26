/// @description Initialise camera

cam_viewport_data = room_get_viewport(room, 0);
cam_width = cam_viewport_data[3];
cam_height = cam_viewport_data[4];

follow = obj_player;

xTo = follow.x;
yTo = follow.y;

