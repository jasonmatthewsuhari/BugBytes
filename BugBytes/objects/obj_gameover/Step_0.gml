if(instance_exists(obj_player) && instance_exists(obj_remote)) {
	server_player_distance = sqrt(power(obj_player.x - x, 2) + power(obj_player.y - y, 2));
	client_player_distance = sqrt(power(obj_remote.x - x, 2) + power(obj_remote.y - y, 2));

	if(server_player_distance <= client_player_distance) {
		move_towards_point(obj_player.x, obj_player.y, 1);
	}
	else {
		move_towards_point(obj_remote.x, obj_remote.y, 1);
	}	
}