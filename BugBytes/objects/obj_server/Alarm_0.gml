player = instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_player);
buffer = buffer_create(1, buffer_fixed, 1);
buffer_write(buffer, buffer_u8, PACKETS.INIT);
network_send_udp(global.socket, remote_ip, remote_port, buffer, buffer_tell(buffer));
buffer_delete(buffer);