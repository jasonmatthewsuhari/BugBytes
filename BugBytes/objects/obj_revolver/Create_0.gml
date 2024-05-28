/// @description Initialise revolver

// The following variables must be declared when creating an instance of this class
/*
{
	owner: noone					// Wielder of the weapon

}
*/

// only for player
mouse_angle = 0;					// Direction from gun to mouse 


knockback_angle = 0;				// Angle of knockback
canshoot = 0;						// Shooting timer
bullet_index = 0;					// Current bullet
cooldown = 1 * 60;					// Attack cooldown of the weapon in frames
timer = cooldown;					// Timer for weapon cooldown (same as cooldown)
range = 500;						// Range of the weapon


bullet0 = {
	sprite: bullet_1,				// Bullet sprite to draw
	spd: 20,						// Speed of the bullet
	rate_start: 20,					// Initial firerate of bullet
	rate_end: 20,					// Max firerate of bullet
	rate_multi: 0,					// Multiplication in firerate per shot
	firerate: 20,					// Current firerate
	damage: 30,						// Damage of the bullet
	cooldown: 0 * 60,				// Attack cooldown of the weapon in frames
	timer: 0 * 60,					// Timer for weapon cooldown (same as cooldown)
	damage: 30						// Damage of the weapon
};

gun = {
	name: "revolver",				// Name of the gun
	sprite: revolver,				// Gun sprite to draw
	y_offset: 20,					// Gun sprite y offset pos
	ammo: [bullet0],				// Array of Ammo structs
	inaccuracy: 0,					// Random bullet inaccuracy
	kick: 2,						// Kickback to position and angle
	sound: blaster,					// Shooting sound effect to play
	spread_number: 1,				// Number of bullets in spread
	spread_angle: 15,				// Angle between each bullet in spread
	fullauto: false,				// Shoot while holding down or only when pressed
	burst_number: 1,				// Number of bullets in burst
	burst_delay: 0,					// Delay between bullets in burst
};