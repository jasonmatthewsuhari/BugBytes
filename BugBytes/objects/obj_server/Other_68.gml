var event = async_load[? "type"];
var server_id = async_load[? "id"];

if(server == server_id) {
	switch(event) {
		case network_type_connect:
			// adds newly connected socket to sockets list
			var socket = async_load[? "socket"];
			ds_list_add(sockets, socket);
			
			// adds newly generated player to player map
			var p = instance_create_layer(room_width/2, room_height/2+50*socket, "Instances", obj_player);
			ds_map_add(players, socket, p);
		break;
	
		case network_type_disconnect:
			var p = players[? socket];
			if(instance_exists(p)) {
				with(p
				) {instance_destroy();}
			}
			var socket = async_load[? "socket"];
			ds_list_delete(sockets, ds_list_find_index(sockets, socket));
		break;		
	}
}

else if(server_id != global.socket) {
	var socket = async_load[? "id"];
	var buffer = async_load[? "buffer"];
	
	buffer_seek(buffer, buffer_seek_start, 0);
	var cmd = buffer_read(buffer, buffer_u8);
	
	var p = players[? socket];
	switch(cmd) {
		case global.PACKET_KEY:
			with(p) {
				var k = buffer_read(buffer, buffer_u8);
				var s = buffer_read(buffer, buffer_u8);
				movement_array[k] = s;
			}	
	}
}

