event_inherited();

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

aim_direction = point_direction(x, y, mouse_x, mouse_y);

if (aim_direction <= 90 || aim_direction > 270) {
	face = 1;
} else if (aim_direction <= 270) {
	face = -1;
} else { }

weapon_x = x + face * weapon_x_offset;
weapon_y = y + weapon_y_offset;

var buffer = buffer_create(2, buffer_fixed, 1);
buffer_write(buffer, buffer_u8, PACKETS.EVENT);
buffer_write(buffer, buffer_u8, EVENTS.PLAYER_SHOOTS);

if(instance_exists(obj_server)) {
	network_send_udp(global.socket, obj_server.remote_ip, obj_server.remote_port, buffer, buffer_tell(buffer));
}
else if(instance_exists(obj_client)) {
	network_send_udp(global.socket, global.host_ip, 8000, buffer, buffer_tell(buffer));
}

buffer_delete(buffer);

if is_instanceof(weapon, Weapon) {
	if weapon == (global.weapon_list.heal_gun) {
		fire_weapon(class_Damageable_Friendly);
	} else {
		fire_weapon(class_Damageable_Enemy);
	}
	
}

var buffer = buffer_create(10, buffer_fixed, 1);

buffer_write(buffer, buffer_u8, PACKETS.CONTINUOUS);
buffer_write(buffer, buffer_s16, x);
buffer_write(buffer, buffer_s16, y);
buffer_write(buffer, buffer_u8, image_index);
buffer_write(buffer, buffer_s16, mouse_x);
buffer_write(buffer, buffer_s16, mouse_y);

if(instance_exists(obj_server)) {
	network_send_udp(global.socket, obj_server.remote_ip, obj_server.remote_port, buffer, buffer_tell(buffer));
}
else if(instance_exists(obj_client)) {
	network_send_udp(global.socket, global.host_ip, 8000, buffer, buffer_tell(buffer));
}



buffer_delete(buffer);