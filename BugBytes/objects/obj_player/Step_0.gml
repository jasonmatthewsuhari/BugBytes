/// @description 
// Not local? Nah
if (!is_local) exit;

// Move
var hor = keyboard_check(vk_right) - keyboard_check(vk_left);
var ver = keyboard_check(vk_down) - keyboard_check(vk_up);

x += hor * moveSpeed;
y += ver * moveSpeed;

// Create buffer with position
var buffer = buffer_create(6, buffer_fixed, 1);

buffer_write(buffer, buffer_u8, DATA.UPDATE);
buffer_write(buffer, buffer_u8, playerID);
buffer_write(buffer, buffer_s16, x);
buffer_write(buffer, buffer_s16, y);

// Send position to server
if (!obj_controller.is_server) {
	network_send_packet(obj_controller.server, buffer, buffer_get_size(buffer));
}
// Send position to clients
else {
	// Loop through clients list
	for (var i=0; i<ds_list_size(obj_controller.clients); i++) {
		// Get socket
		var soc = obj_controller.clients[| i];
		
		// Skip if server itself
		if (soc < 0) continue;
		
		// Send
		network_send_packet(soc, buffer, buffer_get_size(buffer));
	}
}

// Delete buffer
buffer_delete(buffer);