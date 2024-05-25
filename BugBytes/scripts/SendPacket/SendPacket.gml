function SendPacket(key, yesorno){
	buffer_seek(buffer, buffer_seek_start, 0);
	buffer_write(buffer, buffer_u8, global.PACKET_KEY);
	buffer_write(buffer, buffer_u8, key);
	buffer_write(buffer, buffer_u8, yesorno);
	network_send_packet(socket, buffer, buffer_tell(buffer));
}