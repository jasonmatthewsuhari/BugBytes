// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function HandlePacket(buffer){
	buffer_seek(buffer, buffer_seek_start, 0);
	var packet_type = buffer_read(buffer, buffer_u8);
	
	switch(packet_type) {
		case PACKETS.JOIN:
		break;
		
		case PACKETS.READY:
		// U8
			if(instance_exists(obj_server)) {
				with(obj_server) {
					client_ready = true;	
				}
				if(server_ready) {
					room_goto(rm_game);	
				}
			}
			
			else if(instance_exists(obj_client)) {
				with(obj_client) {
					server_ready = true;
				}
				if(client_ready) {
					room_goto(rm_game);
				}
			}
			
		break;
		
		case PACKETS.INIT:
			remote_player = instance_create_layer(room_width / 2 + 100, room_height / 2, "Instances", obj_remote);
			remote_player.name = "Player";
			remote_player.depth = -1;
		break;
		
		case PACKETS.EVENT:
			type_of_event = buffer_read(buffer, buffer_u8);
			switch(type_of_event) {
				case EVENTS.PLAYER_DAMAGED:
					damage = buffer_read(buffer, buffer_u8);
					remote_player.hp -= damage;
				break;
				
				case EVENTS.PLAYER_DESTROYED:
					instance_destroy(remote_player);
				break;
				
				case EVENTS.ENEMY_SPAWNED:
					spawn_x = buffer_read(buffer, buffer_s16);
					spawn_y = buffer_read(buffer, buffer_s16);
					enemy_id = buffer_read(buffer, buffer_u8);
					
					instance_create_layer(spawn_x, spawn_y, "Instances", enemy_id);
				break;
			}
		break;
		
		case PACKETS.CONTINUOUS:
		remote_x = buffer_read(buffer, buffer_s16);
		remote_y = buffer_read(buffer, buffer_s16);
		remote_sprite = buffer_read(buffer, buffer_u8);
		
		if(instance_exists(obj_remote)) {
			remote_player.x = remote_x;
			remote_player.y = remote_y;
			remote_player.image_index = remote_sprite;
		}
		
		/*
		show_debug_message("client x: " + string(remote_x));
		show_debug_message("client y: " + string(remote_y));
		show_debug_message("client sprite: " + string(remote_sprite));
		*/
	}
}