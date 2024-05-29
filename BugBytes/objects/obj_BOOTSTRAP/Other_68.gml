var connection_type = async_load[? "type"];

if(connection_type == network_type_connect) {
	var socket = async_load[? "socket"];
	
	var buffer = buffer_create(2, buffer_fixed, 1);
	buffer_write(buffer, buffer_u8, DATA.INIT);
	buffer_write(buffer, buffer_u8, ds_list_size(clients));
	
	network_send_packet(socket, buffer, buffer_get_size(buffer));
	buffer_delete(buffer);
	
	var player = instance_create_layer(room_width/2,room_height/2,"Instances",obj_player);
	player.player_index = ds_list_size(clients);
	player.is_local = false;
	
	ds_list_add(clients, player);
}

else if(connection_type == network_type_disconnect) {
	ds_list_destroy(clients);
}

else if(connection_type == network_type_data) {
	var buffer = async_load[? "buffer"];
	buffer_seek(buffer, buffer_seek_start, 0);
	
	var type = buffer_read(buffer, buffer_u8);
	if(type == DATA.INIT) {
		var count = buffer_read(buffer, buffer_u8);
		obj_player.player_index = count;
		
		for (var i = 0; i < count; i++) {
			var player = instance_create_layer(room_width/2, room_height/2+ 50 * ds_list_size(clients), "Instances", obj_player);
			player.player_index = i;
			player.is_local = false;
		}
	}
	else if(type == DATA.UPDATE) {
		var pID = buffer_read(buffer, buffer_u8);
		
		with(obj_player) {
			if(pID == player_index) {
				x = buffer_read(buffer, buffer_s16);
				y = buffer_read(buffer, buffer_s16);
			}	
		}
	}
}