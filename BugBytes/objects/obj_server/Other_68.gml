var event = async_load[? "type"];
var socket = async_load[? "socket"];
var server_id = async_load[? "id"];

if(server == server_id) {
	switch(event) {
		case network_type_connect:
			// adds newly connected socket to sockets list
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
			ds_list_delete(sockets, ds_list_find_index(sockets, socket));
		break;
	
		case network_type_data:
			var buffer = async_load[? "buffer"];
			var socket = async_load[? "id"];
			buffer_seek(buffer, buffer_seek_start, 0);
			PacketReceive(buffer, socket);
		break;
	}
}

