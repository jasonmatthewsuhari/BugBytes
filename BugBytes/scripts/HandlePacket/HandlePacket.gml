function HandlePacket(buffer){
	var packet_type = buffer_read(buffer, buffer_u8);
	
	switch(packet_type) {
		case PACKETS.INIT:
			
		break;
		
		case PACKETS.EVENT:
		
		break;
		
		case PACKETS.CONTINUOUS:
		break;
		
	}
}