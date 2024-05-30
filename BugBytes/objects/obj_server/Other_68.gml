var type = async_load[? "type"];

if (type == network_type_connect) {
	var socket = async_load[? "socket"];
	var buffer = buffer_create(2, buffer_fixed, 1);
		
	buffer_write(buffer, buffer_u8, PACKETS.INIT);
	buffer_write(buffer, buffer_u8, ds_list_size(clients));
	network_send_packet(socket, buffer, buffer_get_size(buffer));
	
	buffer_delete(buffer);

	var player = instance_create_layer(random(room_width), random(room_height), "Instances", obj_player);
	player.playerID = ds_list_size(clients);
	player.is_local = false;
		
	ds_list_add(clients, socket);
}

else if (type == network_type_data) {
	var buffer = async_load[? "buffer"];
	buffer_seek(buffer, buffer_seek_start, 0);
	var data = buffer_read(buffer, buffer_u8);
	
	// INIT_PACKETS
	if (data == PACKETS.INIT) {
		var count = buffer_read(buffer, buffer_u8);
		obj_player.playerID = count;
		
		for (var i=0; i < count; i++) {
			var plr = instance_create_layer(room_width/2, room_height/2, "Instances", obj_player);
			plr.playerID = i;
			plr.is_local = false;
		}
	}
	// PLAYER_CONTINUOUS
	else if (data == PACKETS.CONTINUOUS) {
		
		var pID = buffer_read(buffer, buffer_u8);
		with (obj_player) {
			if (pID == playerID) {
				x = buffer_read(buffer, buffer_s16);
				y = buffer_read(buffer, buffer_s16);
			}
		}
	}
	
	else if (data == PACKETS.EVENT) {
		var pID = buffer_read(buffer, buffer_u8);
		with(obj_player) {
			if(pID == playerID) {
				hp = buffer_read(buffer, buffer_u8);
			}
		}
	}
}

else if (type == network_type_disconnect) {
	
}