socket = network_create_socket(network_socket_tcp);
global.socket = socket;
buffer = buffer_create(1024, buffer_fixed, 1); // fixed 1mb
connect = network_connect(socket, "127.0.0.1", global.PORT);