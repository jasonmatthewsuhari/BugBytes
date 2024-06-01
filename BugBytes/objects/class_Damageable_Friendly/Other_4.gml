if (room == rm_game) {
	var player = instance_create_layer(room_width/2, room_height/2, "Instances", obj_player);
	player.playerID = 0;
	
	start_time = current_time;
	
	if (is_server) {
		ds_list_add(clients, -1);
	}
}