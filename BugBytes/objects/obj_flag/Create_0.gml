/// @description Initialise flag
event_inherited();

if(room == rm_singleplayer or room == rm_singleplayer_2) {
	instance_create_layer(x, y, "Friendlies", obj_singleplayer);	
}