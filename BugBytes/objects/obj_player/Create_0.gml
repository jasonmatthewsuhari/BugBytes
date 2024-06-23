movement_array = array_create(4, 1);
moveSpeed = 4;
is_local = true;
playerID = -1;
name = "";

max_hp = 10;
hp = max_hp;

depth = -1
image_speed	 = 0;

var buffer = buffer_create(1, buffer_fixed, 1);
buffer_write(buffer, buffer_u8, PACKETS.INIT);

network_send_udp(global.socket, "127.0.0.1", 8000, buffer, buffer_tell(buffer));

buffer_delete(buffer);