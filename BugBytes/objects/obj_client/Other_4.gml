switch(room) {
	case rm_game:
		global.player = instance_create_layer(room_width / 2 + 100, room_height / 2, "Instances", obj_player);
	break;
}