if(keyboard_string != "") {
	global.host_ip += keyboard_string;
	keyboard_string = "";
}
	
if(keyboard_check_pressed(vk_backspace)) {
	if (string_length(global.host_ip) > 0) {
		global.host_ip = string_delete(global.host_ip, string_length(global.host_ip), 1);
	}
}

if(keyboard_check_pressed(vk_enter)) {
	var client = instance_create_layer(0,0,"Instances",obj_client);	
	with(client) {
		global.socket = network_create_socket(network_socket_udp);

		// Initiate basic handshake
		ready_buffer = buffer_create(1, buffer_fixed, 1);
		buffer_seek(ready_buffer, buffer_seek_start,0);
		buffer_write(ready_buffer, buffer_u8, PACKETS.JOIN);
		network_send_udp(global.socket, global.host_ip, 8000, ready_buffer, buffer_tell(ready_buffer));

		server_ready = false;
		client_ready = false;		
	}
	room_goto(rm_lobby);
}


