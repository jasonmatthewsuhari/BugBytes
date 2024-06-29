MAX_CLIENTS = 2;

global.socket = network_create_socket_ext(network_socket_udp, 8000);
assert(global.socket >= 0, "Failed to get a port");

server_ready = false;
client_ready = false;

can_spawn = true;