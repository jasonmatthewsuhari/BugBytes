if(room == rm_game) {
	var player = instance_create_layer(room_width / 2, room_height / 2 + 50 * ds_list_size(clients), "Instances", obj_player);
	player.player_index = 0;
	
	if (server_identity) {ds_list_add(clients, -1);}
}