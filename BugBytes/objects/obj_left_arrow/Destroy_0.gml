/// @description remove left_arrow functionality

if instance_exists(obj_player)	and !object_exists(self.object_index)	
	obj_player.useable.left_arrow = false;
