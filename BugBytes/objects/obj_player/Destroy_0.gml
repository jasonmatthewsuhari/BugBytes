/// @description Respawn mechanic

if instance_exists(obj_flag) {
	instance_create_layer(x, y, layer, obj_player);
}