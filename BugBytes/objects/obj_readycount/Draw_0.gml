draw_set_color(c_black);
if(instance_exists(obj_server)) {
	var sum = obj_server.server_ready + obj_server.client_ready;
}
else if(instance_exists(obj_client)) {
	var sum = obj_client.server_ready + obj_client.client_ready;
}

draw_text(room_width / 2, room_height / 2, "Players Ready: (" + string(sum) + "/2)");