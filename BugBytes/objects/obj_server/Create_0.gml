MAX_CLIENTS = 2;

global.socket = network_create_socket_ext(network_socket_udp, 8000);

server_ready = false;
client_ready = false;

can_spawn = true;

global.enemies = [];

function AllZero(arr) {
	for(var i = 0; i < array_length(arr); i++) {
		if(arr[i] != 0) {
			return false;
		}
	}
	return true;
}