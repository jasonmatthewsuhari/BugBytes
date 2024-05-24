buffer_seek(obj_client.client_buffer, buffer_seek_start, 0);
buffer_write(obj_client.client_buffer, buffer_string, "Hello, World!");
network_send_packet(obj_client.client_socket, obj_client.client_buffer, buffer_tell(obj_client.client_buffer));