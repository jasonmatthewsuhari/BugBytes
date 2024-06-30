function SpawnEnemy(enemy_list, ratio){
	if(!CheckAllZero(ratio)) {
		index = RandomNonZeroIndex(ratio);
		spawn_x = random(room_width);
		spawn_y = random(room_height);
		enemy_id = enemy_list[index];
		
		instance_create_layer(spawn_x, spawn_y, "Enemies", enemy_id);
		ratio[index] =  ratio[index] - 1;
		
		buffer = buffer_create(7, buffer_fixed, 1);
		buffer_write(buffer, buffer_u8, PACKETS.EVENT);
		buffer_write(buffer, buffer_u8, EVENTS.ENEMY_SPAWNED);
		
		buffer_write(buffer, buffer_s16, spawn_x);
		buffer_write(buffer, buffer_s16, spawn_y);
		buffer_write(buffer, buffer_u8, enemy_id);
		
		network_send_udp(global.socket, remote_ip, remote_port, buffer, buffer_tell(buffer));
		buffer_delete(buffer);
	}
}

// Helper function to check if all entries in an array are zero
function CheckAllZero(arr) {
	for(var i = 0; i < array_length(arr); i++) {
		if(arr != 0) {
			return false;
		}
	}
	return true;
}

// Helper function to find index at which integer is non-zero
function RandomNonZeroIndex(arr) {
	index = irandom(array_length(arr) - 1);
	while(arr[index] <= 0) {
		index = irandom(array_length(arr) - 1);	
	}
	return index;
}