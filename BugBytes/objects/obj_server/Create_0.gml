MAX_CLIENTS = 2;

global.socket = network_create_socket_ext(network_socket_udp, 8000);

server_ready = false;
client_ready = false;

can_spawn = true;

remote_ip = "127.0.0.1";
remote_port = 8000;