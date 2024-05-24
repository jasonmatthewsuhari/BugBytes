server = network_create_server(network_socket_tcp, global.PORT, global.MAX_PLAYERS);
server_buffer = buffer_create(1024, buffer_fixed,1);

players = ds_map_create();
sockets = ds_list_create();
