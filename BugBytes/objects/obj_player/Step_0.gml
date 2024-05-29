// WASD = 0123

hspd = walking_speed * (keyboard_check(ord("D")) - keyboard_check(ord("A")));
vspd = walking_speed * (keyboard_check(ord("S")) - keyboard_check(ord("W")));

x += hspd;
y += vspd;

var buffer = buffer_create(6, buffer_fixed, 1);

buffer_write(buffer, buffer_u8, DATA.UPDATE);
buffer_write(buffer, buffer_u8, player_index);
buffer_write(buffer, buffer_s16, x);
buffer_write(buffer, buffer_s16, y);

if (!obj_BOOTSTRAP.server_identity) {
	network_send_packet(obj_BOOTSTRAP.server, buffer, buffer_get_size(buffer));
}
else {
	for (var i=0; i<ds_list_size(obj_BOOTSTRAP.clients); i++) {
		var soc = obj_BOOTSTRAP.clients[| i];
		if (soc < 0) continue;
		network_send_packet(soc, buffer, buffer_get_size(buffer));
	}
}

// Delete buffer
buffer_delete(buffer);