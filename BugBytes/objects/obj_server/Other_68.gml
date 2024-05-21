var event = async_load[? "type"];

switch(event) {
	case network_type_connect:
	var socket = async_load[? "socket"];
	ds_list_add(sockets, socket);
	break;
	
	case network_type_disconnect:
	var socket = async_load[? "socket"];
	ds_list_delete(sockets, ds_list_find_index(sockets, socket));
	break;
	
	case network_type_data:
	var buffer = async_load[? "buffer"];
	var socket = async_load[? "id"];
	buffer_seek(buffer, buffer_seek_start, 0);
	PacketReceive(buffer, socket);
	break;
}