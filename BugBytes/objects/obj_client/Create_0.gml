client_socket = network_create_socket(network_socket_tcp);
connect = network_connect(client_socket, "127.0.0.1", global.PORT);
show_message(connect);
client_buffer = buffer_create(1024, buffer_fixed, 1);