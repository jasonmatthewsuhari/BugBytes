switch(room) {
	case rm_lobby:
		selected = (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space));
		if(selected && !server_ready) {
			server_ready = true;
			if(client_ready) {
				room_goto(rm_game);	
			}

			// Creates a buffer of ID 0, indicating that server is ready
			ready_buffer = buffer_create(1, buffer_fixed, 1);
			buffer_seek(ready_buffer, buffer_seek_start, 0);
			buffer_write(ready_buffer, buffer_u8, PACKETS.READY);
			network_send_udp(global.socket, remote_ip, remote_port, ready_buffer, buffer_tell(ready_buffer));
		
			buffer_delete(ready_buffer);
		}
	
	break;
	
	case rm_game:
		// Enemy spawning system
		// --> the current number of minutes elapsed (starts from 0) is the
		// index of the global.waves array being used.
		
		if(can_spawn) {
			// make spawning system here
		}
		
	break;
}