/// @description remove w_key functionality

if instance_exists(obj_player)	and !object_exists(self.object_index)
	obj_player.useable.w_key = false;
