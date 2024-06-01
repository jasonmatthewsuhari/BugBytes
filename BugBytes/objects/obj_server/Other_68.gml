var type = async_load[? "type"];

if (type == network_type_connect) {
	socket = async_load[? "socket"];
	var buffer = buffer_create(2, buffer_fixed, 1);
		
	buffer_write(buffer, buffer_u8, PACKETS.INIT);
	buffer_write(buffer, buffer_u8, ds_list_size(clients));
	// insert buffer for name and any other character details here
	network_send_packet(socket, buffer, buffer_get_size(buffer));
	
	buffer_delete(buffer);

	var player = instance_create_layer(0, 0, "Instances", obj_player);
	player.playerID = ds_list_size(clients);
	player.is_local = false;
		
	ds_list_add(clients, socket);
}

else if (type == network_type_disconnect) {
	// to implement the disconnection later
	var socket = async_load[? "socket"];
	with(obj_player) {
		if(playerID == socket) {
			instance_destroy();	
		}
	}
	network_destroy(socket);
}

else if (type == network_type_data) {
	var buffer = async_load[? "buffer"];
	buffer_seek(buffer, buffer_seek_start, 0);
	var data = buffer_read(buffer, buffer_u8);
	
	switch(data) {
		case PACKETS.INIT:
			var count = buffer_read(buffer, buffer_u8);
			obj_player.playerID = count;
		
			for (var i=0; i < count; i++) {
				var plr = instance_create_layer(room_width/2, room_height/2, "Instances", obj_player);
				plr.playerID = i;
				plr.is_local = false;
			}
		break;
		
		case PACKETS.EVENT:
			var pID = buffer_read(buffer, buffer_u8);
			var eventID = buffer_read(buffer, buffer_u8);
			
			switch(eventID) {
				case EVENTS.PLAYER_DAMAGED:
					with(obj_player) {
						if(pID == playerID) {
							hp = buffer_read(buffer, buffer_u8);
						}
					}
				break;
			}
			
			
		break;
		
		case PACKETS.CONTINUOUS:
			var pID = buffer_read(buffer, buffer_u8);
			with (obj_player) {
				if (pID == playerID) {
					x = buffer_read(buffer, buffer_s16);
					y = buffer_read(buffer, buffer_s16);
					image_index = buffer_read(buffer, buffer_u8);
				}
			}
		break;
		
		case PACKETS.SPAWN:
			var _x = buffer_read(buffer, buffer_u8);
			var _y = buffer_read(buffer, buffer_u8);
			
			instance_create_layer(_x, _y, "Instances", obj_enemy_1);
		break;
		
		case PACKETS.TIME:
		
		break;
	}
}