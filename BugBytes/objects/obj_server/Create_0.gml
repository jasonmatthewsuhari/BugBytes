SERVER_IP = "127.0.0.1";
MAX_CLIENTS = 2;

clients = ds_list_create();
elapsed_time = 0;

socket = network_create_socket_ext(network_socket_udp, 8000);

server_ready = true;
