var event = async_load[? "type"];

switch(event) {	
	case network_type_data:
	var buffer = async_load[? "buffer"];
	buffer_seek(buffer, buffer_seek_start, 0);
	PacketReceive(buffer, socket);
	break;
}