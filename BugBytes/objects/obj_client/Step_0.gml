if(keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
	show_message("Client ready");
	
	buffer = buffer_create(4, buffer_fixed, 1);
	buffer_seek(buffer, buffer_seek_start, 0);
	buffer_write(buffer, buffer_bool, true);

	network_send_udp(socket, "127.0.0.1", 8000, buffer, buffer_tell(buffer));
}