/// @description Respawn mechanic

if (instance_exists(weapon))		instance_destroy(weapon);

if (instance_exists(health_bar))	instance_destroy(health_bar);

if (instance_exists(obj_flag))		instance_create_depth(obj_flag.x, obj_flag.y, depth, obj_player);