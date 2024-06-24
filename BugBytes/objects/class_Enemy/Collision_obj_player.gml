
if(can_attack) {
	can_attack = false;
	if(obj_player.hp - damage <= 0) {
		instance_destroy(obj_player);	
		buffer = buffer_create(2, buffer_fixed, 1);
		buffer_write(buffer, buffer_u8, PACKETS.EVENT);
		buffer_write(buffer, buffer_u8, EVENTS.PLAYER_DESTROYED);
		
		if(instance_exists(obj_server)) {
			network_send_udp(global.socket, obj_server.remote_ip, obj_server.remote_port, buffer, buffer_tell(buffer));
		}
		else if(instance_exists(obj_client)) {
			network_send_udp(global.socket, "127.0.0.1", 8000, buffer, buffer_tell(buffer));
		}
		
	}
	else {
		obj_player.hp -= damage;

		buffer = buffer_create(3, buffer_fixed, 1);
		buffer_write(buffer, buffer_u8, PACKETS.EVENT);
		buffer_write(buffer, buffer_u8, EVENTS.PLAYER_DAMAGED);
		buffer_write(buffer, buffer_u8, damage);

		if(instance_exists(obj_server)) {
			network_send_udp(global.socket, obj_server.remote_ip, obj_server.remote_port, buffer, buffer_tell(buffer));
		}
		else if(instance_exists(obj_client)) {
			network_send_udp(global.socket, "127.0.0.1", 8000, buffer, buffer_tell(buffer));
		}

		buffer_delete(buffer);

		alarm[0] = 1*game_get_speed(gamespeed_fps);
	}
	

}
