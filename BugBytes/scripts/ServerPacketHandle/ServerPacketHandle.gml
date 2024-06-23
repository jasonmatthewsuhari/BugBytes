function ServerPacketHandle(buffer){
	
	buffer_seek(buffer, buffer_seek_start, 0);
	var packet_type = buffer_read(buffer, buffer_u8);
	
	switch(packet_type) {
		case PACKETS.JOIN:
		break;
		
		case PACKETS.READY:
		// U8
		show_debug_message("SERVER IS HANDLING A PACKET...");
			with(obj_server) {
				client_ready = true;
				if(server_ready) {
					room_goto(rm_game);	
				}
			}
		break;
		
		case PACKETS.INIT:
		//show_message("Remote object initiated");
		remote_player = instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_remote);
		break;
		
		case PACKETS.EVENT:
		
		break;
		
		case PACKETS.CONTINUOUS:
		remote_x = buffer_read(buffer, buffer_s16);
		
		if(instance_exists(obj_remote)) {
			obj_remote.x = remote_x;
		}
		
		/*
		show_debug_message("client x: " + string(remote_x));
		show_debug_message("client y: " + string(remote_y));
		show_debug_message("client sprite: " + string(remote_sprite));
		*/
		
		
		break;
		
		case PACKETS.TIME:
			show_message("received");
		break;
		
	}
}