client_socket = network_create_socket(network_socket_tcp);
connected = network_connect(client_socket, "127.0.0.1", global.PORT);

show_message(connected);

client_buffer = buffer_create(1024, buffer_fixed, 1);