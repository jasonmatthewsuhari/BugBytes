function SpawnRemoteEntity(_x, _y, _layer, obj){
	var buffer = buffer_create(3, buffer_fixed, 1);
	
	buffer_write(buffer, buffer_u8, PACKETS.SPAWN);
	buffer_write(buffer, buffer_u8, _x);
	buffer_write(buffer, buffer_u8, _y);

	var entity = instance_create_layer(_x, _y, _layer, obj);
}