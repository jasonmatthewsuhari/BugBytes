// wasd = 0123
if (!is_local) exit;

// Move
movement_array[0] = (keyboard_check(ord("W")) || keyboard_check(vk_up));
movement_array[1] = (keyboard_check(ord("A")) || keyboard_check(vk_left));
movement_array[2] = (keyboard_check(ord("S")) || keyboard_check(vk_down));
movement_array[3] = (keyboard_check(ord("D")) || keyboard_check(vk_right));
var hor = movement_array[3] - movement_array[1];
var ver = movement_array[2] - movement_array[0];

x += hor * moveSpeed;
y += ver * moveSpeed;



// Create buffer with position
var buffer = buffer_create(100, buffer_fixed, 1);

buffer_write(buffer, buffer_u8, DATA.UPDATE);
buffer_write(buffer, buffer_u8, playerID);
buffer_write(buffer, buffer_s16, x);
buffer_write(buffer, buffer_s16, y);
buffer_write(buffer, buffer_u8, hp);


// Send position to server
if (!obj_server.is_server) {
	network_send_packet(obj_server.server, buffer, buffer_get_size(buffer));
}
// Send position to clients
else {
	// Loop through clients list
	for (var i=0; i<ds_list_size(obj_server.clients); i++) {
		// Get socket
		var soc = obj_server.clients[| i];
		
		// Skip if server itself
		if (soc < 0) continue;
		
		// Send
		network_send_packet(soc, buffer, buffer_get_size(buffer));
	}
}

// Delete buffer
buffer_delete(buffer);