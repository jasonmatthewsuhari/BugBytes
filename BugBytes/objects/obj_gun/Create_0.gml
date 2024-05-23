/// @description Insert description here
// You can write your code in this editor

mouse_angle = 0;		// Direction from gun to mouse
knockback_angle = 0;	// Angle of knockback

ox = x;					// Original x position (change it to player's x)
oy = y;					// Original y position (change it to player's y)

bullet0 = {
	sprite: BULLET_0,	// Bullet sprite to draw
	spd: 20,			// Speed of the bullet
	rate_start: 20,		// Initial firerate of bullet
	rate_end: 20,		// Max firerate of bullet
	rate_multi: 0,		// Multiplication in firerate per shot
	firerate: 20		// Current firerate
};

bullet1 = {
	sprite: BULLET_1,	// Bullet sprite to draw
	spd: 20,			// Speed of the bullet
	rate_start: 20,		// Initial firerate of bullet
	rate_end: 20,		// Max firerate of bullet
	rate_multi: 0,		// Multiplication in firerate per shot
	firerate: 20		// Current firerate
};

gun = {
	name: "SCAR",		// Name of the gun
	sprite: BELG_SCAR,	// Gun sprite to draw
	ammo: [bullet0, bullet1],		// Array of Ammo structs
	inaccuracy: 0,		// Random bullet inaccuracy
	kick: 2,			// Kickback to position and angle
	sound: snd_shoot,	// Shooting sound effect to play
	spread_number: 3,	// Number of bullets in spread
	spread_angle: 15,	// Angle between each bullet in spread
	fullauto: true,		// Shoot while holding down or only when pressed
	burst_number: 1,	// Number of bullets in burst
	burst_delay: 0,		// Delay between bullets in burst
};

canshoot = 0;			// Shooting timer
bullet_index = 0;		// Current bullet