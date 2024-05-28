/// @description remove s_key functionality

if instance_exists(obj_player) and !object_exists(self.object_index)
	obj_player.useable.s_key = false;
