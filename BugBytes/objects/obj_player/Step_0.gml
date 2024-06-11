// wasd = 0123
if (!is_local) exit;

movement_array[0] = (keyboard_check(ord("W")) || keyboard_check(vk_up));
movement_array[1] = (keyboard_check(ord("A")) || keyboard_check(vk_left));
movement_array[2] = (keyboard_check(ord("S")) || keyboard_check(vk_down));
movement_array[3] = (keyboard_check(ord("D")) || keyboard_check(vk_right));

var hspd = movement_array[3] - movement_array[1];
var vspd = movement_array[2] - movement_array[0];

x += hspd * moveSpeed;
y += vspd * moveSpeed;

if (hspd == 1) {
    image_index = 1;
} else if (hspd == -1) {
    image_index = 0;
} else if (vspd == 1) {
    image_index = 3;
} else if (vspd == -1) {
    image_index = 2;
}

if(global.IS_MULTIPLAYER) {
	var buffer = buffer_create(7, buffer_fixed, 1);

	buffer_write(buffer, buffer_u8, PACKETS.CONTINUOUS);
	buffer_write(buffer, buffer_u8, playerID);
	buffer_write(buffer, buffer_s16, x);
	buffer_write(buffer, buffer_s16, y);
	buffer_write(buffer, buffer_u8, image_index);

	if (!obj_server.is_server) {
		network_send_packet(obj_server.server, buffer, buffer_get_size(buffer));
	}
	else {
		for (var i = 0; i < ds_list_size(obj_server.clients); i++) {
			var soc = obj_server.clients[| i];
			if (soc < 0) continue;
		
			network_send_packet(soc, buffer, buffer_get_size(buffer));
		}
	}

	buffer_delete(buffer);
}