// grabs the IP and port of the client
remote_port = async_load[? "port"];
remote_ip = string(async_load[? "ip"]);

show_message(remote_ip);
show_message(remote_port);

var buffer = async_load[? "buffer"];
HandlePacket(buffer);
