/// @description right_mouse_button functionality

if instance_exists(obj_player) 	and !object_exists(self.object_index) 
	obj_player.useable.right_mouse_button = false;
