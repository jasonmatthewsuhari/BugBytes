MAX_CLIENTS = 2;

global.socket = network_create_socket_ext(network_socket_udp, 8000);
alarm[0] = 2 * game_get_speed(gamespeed_fps);

server_ready = false;
client_ready = false;