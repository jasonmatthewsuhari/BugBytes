/// @description Respawn mechanic

if (instance_exists(obj_flag)) {
	instance_create_depth(obj_flag.x, obj_flag.y, depth, obj_player);
} 