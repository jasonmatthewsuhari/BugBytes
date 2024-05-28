/// @description remove left_mouse_button functionality

if instance_exists(obj_player)	and !object_exists(self.object_index) 
	obj_player.useable.left_mouse_button = false;
