/// @description Initialise flag
event_inherited();

if(room == rm_singleplayer) {
	instance_create_layer(x, y, "Friendlies", obj_singleplayer);	
}