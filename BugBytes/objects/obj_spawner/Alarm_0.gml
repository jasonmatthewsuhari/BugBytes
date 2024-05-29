//show_message("Spawned!");
instance_create_layer(random(room_width), random(room_height), "Instances", obj_enemy);
alarm[0] = 5 * game_get_speed(gamespeed_fps);