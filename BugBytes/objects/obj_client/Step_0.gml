switch(room) {
	case rm_lobby:
		selected = (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space));
		if(selected && !client_ready) {
			client_ready = true;
			if(server_ready) {
				room_goto(rm_game);	
			}
			
			// Creates a buffer of ID 0, indicating that server is ready
			ready_buffer = buffer_create(1, buffer_fixed, 1);
			buffer_seek(ready_buffer, buffer_seek_start,0);
			buffer_write(ready_buffer, buffer_u8, PACKETS.READY);
			network_send_udp(global.socket, global.host_ip, 8000, ready_buffer, buffer_tell(ready_buffer));
		
			buffer_delete(ready_buffer);
		}
	
	break;
	
	case rm_game:
	break;
}