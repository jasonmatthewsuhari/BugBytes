// Create event
fade_start_time = 0.5 * game_get_speed(gamespeed_fps); // Time to wait before starting the fade (2 seconds)
fade_duration = 1.5 * game_get_speed(gamespeed_fps);  // Duration of the fade (5 seconds)
fade_timer = 0;  // Timer to keep track of the fade progress
fading = false; // Flag to check if fading should start

text_offset_x = 910;	
text_offset_y = 630;

depth = -1000;