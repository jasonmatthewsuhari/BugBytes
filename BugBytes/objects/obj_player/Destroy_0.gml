/// @description Respawn mechanic

if (instance_exists(weapon))		instance_destroy(weapon);

if (instance_exists(health_bar))	instance_destroy(health_bar);

var _player_respawn = time_source_create(time_source_game, respawn_timer, time_source_units_seconds,	
	function() {
		if (instance_exists(obj_flag) && !instance_exists(obj_player))
			instance_create_layer(obj_flag.x, obj_flag.y, "Instances", obj_player);
	});

time_source_start(_player_respawn);