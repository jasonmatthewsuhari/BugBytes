global.socket = network_create_socket(network_socket_udp);

// Initiate basic handshake
ready_buffer = buffer_create(1, buffer_fixed, 1);
buffer_seek(ready_buffer, buffer_seek_start,0);
buffer_write(ready_buffer, buffer_u8, PACKETS.JOIN);
network_send_udp(global.socket, "127.0.0.1", 8000, ready_buffer, buffer_tell(ready_buffer));

alarm[0] = 2 * game_get_speed(gamespeed_fps);

server_ready = false;
client_ready = false;