function EventPacket(target, event_id, vars, vals){
	switch(event_id) {
		case EVENTS.PLAYER_DAMAGED:
			var buffer = buffer_create(2, buffer_fixed, 1);
			buffer_write(buffer, buffer_u8, PACKETS.EVENT);
			buffer_write(buffer, buffer_u8, vals[0]);
		break;
		
		// add more cases here
	}
	
}