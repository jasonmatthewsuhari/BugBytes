/// @description Respawn mechanic

var _player_respawn = time_source_create(time_source_game, respawn_timer, time_source_units_seconds,	
	function() {
		if (instance_exists(obj_flag) && !instance_exists(obj_singleplayer))
			instance_create_layer(obj_flag.x, obj_flag.y, "Friendlies", obj_singleplayer);
			
	});

time_source_start(_player_respawn);