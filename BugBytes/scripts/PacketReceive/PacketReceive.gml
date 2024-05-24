function PacketReceive(buffer, socket){
	type = buffer_read(buffer, buffer_u8);
	switch(type) {
		case 0: // debug message
			var given_message = buffer_read(buffer, buffer_string);
			show_message(given_message);
		break;
	}
}