/// @description Initialise knife

cooldown = 3 * game_get_speed(gamespeed_fps);					// Attack cooldown of the weapon in frames
timer = cooldown;					// Timer for weapon cooldown
damage = 20;						// Damage of the weapon