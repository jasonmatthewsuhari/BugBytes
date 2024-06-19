remote_port = async_load[? "port"];
remote_ip = string(async_load[? "ip"]);

var buffer = async_load[? "buffer"];
buffer_seek(buffer, buffer_seek_start, 0);

if(server_ready && buffer_read(buffer, buffer_bool)) {
	ready_buffer = buffer_create(1, buffer_fixed, 1);
	buffer_seek(ready_buffer, buffer_seek_start,0);
	buffer_write(ready_buffer, buffer_bool, true);
	network_send_udp(socket, remote_ip, remote_port, ready_buffer, buffer_tell(ready_buffer));
	room_goto(rm_game);
}