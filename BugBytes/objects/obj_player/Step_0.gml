// wasd = 0123
if(mouse_check_button_pressed(mb_right)) {
	cursor_x = mouse_x;
	cursor_y = mouse_y;
	SpawnBullet(x, y, cursor_x, cursor_y);
	
	var buffer = buffer_create(6, buffer_fixed, 1);
	buffer_write(buffer, buffer_u8, PACKETS.EVENT);
	buffer_write(buffer, buffer_u8, EVENTS.PLAYER_SHOOTS);
	buffer_write(buffer, buffer_s16, cursor_x);
	buffer_write(buffer, buffer_s16, cursor_y);
	if(instance_exists(obj_server)) {
		network_send_udp(global.socket, obj_server.remote_ip, obj_server.remote_port, buffer, buffer_tell(buffer));
	}
	else if(instance_exists(obj_client)) {
		network_send_udp(global.socket, "127.0.0.1", 8000, buffer, buffer_tell(buffer));
	}
}

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

<<<<<<< HEAD
aim_direction = point_direction(x, y, mouse_x, mouse_y);

if (aim_direction <= 45 || aim_direction > 315) {
	image_index = 1;
} else if (aim_direction <= 135) {
	image_index = 2;
} else if (aim_direction <= 225) {
	image_index = 0;
} else if (aim_direction <= 315) {
	image_index = 3;
} else { }

if (image_index == 1) {
	weapon_x = x - weapon_x_offset;
	weapon_y = y + weapon_y_offset;
} else if (image_index == 2) {
	weapon_x = x + weapon_x_offset;
	weapon_y = y + weapon_y_offset;
} else if (image_index == 0) {
	weapon_x = x;
	weapon_y = y - weapon_y_offset;
} else if (image_index == 3) {
	weapon_x = x;
	weapon_y = y + weapon_y_offset;
} else { }

with weapon 
{
	sprite_index = gun.sprite;

	// If rotated to left, flip gun
	if mouse_x > x image_yscale = 1;
	else image_yscale = -1;

	// Lerp angle to mouse and kickback angle to zero
	mouse_angle -= angle_difference(mouse_angle, point_direction(x, y, mouse_x, mouse_y)) * 0.5;
	knockback_angle -= angle_difference(knockback_angle, 0) * 0.05;
	image_angle = mouse_angle + knockback_angle;

	//Lerp position
	x = lerp(x, ox, 0.05);
	y = lerp(y, oy, 0.05);
}

var buffer = buffer_create(10, buffer_fixed, 1);
=======
var buffer = buffer_create(6, buffer_fixed, 1);
>>>>>>> parent of 738eda8 (Aim Sprite Control)
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
	network_send_udp(global.socket, "127.0.0.1", 8000, buffer, buffer_tell(buffer));
}



buffer_delete(buffer);