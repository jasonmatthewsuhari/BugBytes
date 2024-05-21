global.PORT = 64000;
global.MAX_PLAYERS = 2;

network_create_server(network_socket_tcp, global.PORT, global.MAX_PLAYERS);
server_buffer = buffer_create(1024, buffer_fixed,1);
