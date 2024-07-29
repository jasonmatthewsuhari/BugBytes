player = instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_player);
buffer = buffer_create(32, buffer_grow, 1);
buffer_write(buffer, buffer_u8, PACKETS.INIT);
buffer_write(buffer, buffer_string, global.username);
network_send_udp(global.socket, global.host_ip, 8000, buffer, buffer_tell(buffer));
buffer_delete(buffer);