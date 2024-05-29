function RemoteEntity(socket, type, entity_id, val){
	buffer_seek(buffer, buffer_seek_start, 0);
	buffer_write(buffer, buffer_u8, global.ENTITY_KEY);
	buffer_write(buffer, buffer_u8, type);
	buffer_write(buffer, buffer_u16, entity_id);
	
	switch(type) {
		case CMD.cmd_x:
			buffer_write(buffer, buffer_s16, val);
		break;
		
		case CMD.cmd_y:
			buffer_write(buffer, buffer_s16, val);
		break;
		
		case CMD.cmd_name:
			buffer_write(buffer, buffer_string, val);
		break;
		
		case CMD.cmd_sprite:
			buffer_write(buffer, buffer_u8, val);
		break;
		
		case CMD.cmd_destroy:
			buffer_write(buffer, buffer_bool, val);
		break;
	}
	
	network_send_packet(socket, buffer, buffer_tell(buffer));
}