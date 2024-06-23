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

var buffer = buffer_create(100, buffer_fixed, 1);
buffer_write(buffer, buffer_u8, PACKETS.CONTINUOUS);
buffer_write(buffer, buffer_s16, x);
//buffer_write(buffer, buffer_s16, y);
//buffer_write(buffer, buffer_u8, sprite_index);

network_send_udp(global.socket, "127.0.0.1", 8000, buffer, buffer_tell(buffer));

buffer_delete(buffer);