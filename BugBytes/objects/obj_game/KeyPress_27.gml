/// @description Insert description here
// You can write your code in this editor
if !has_spawned_pause 
{
	instance_create_depth(obj_camera.x, view_yport[0], obj_crosshair.depth + 1, obj_pause_menu);
	has_spawned_pause = true;
}