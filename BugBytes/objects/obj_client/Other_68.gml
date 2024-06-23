remote_port = async_load[? "port"];
remote_ip = string(async_load[? "ip"]);

var buffer = async_load[? "buffer"];

ClientPacketHandle(buffer);