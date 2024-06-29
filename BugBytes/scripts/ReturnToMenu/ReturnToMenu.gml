function ReturnToMenu(){
	if(instance_exists(obj_server)) {
		instance_destroy(obj_server);
	}
	if(instance_exists(obj_client)) {
		instance_destroy(obj_client);
	}
	room_goto(rm_menu);
}