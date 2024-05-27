/// @description Initialise knife

// The following variables must be declared when creating an instance of this class
/*
{
	owner: noone					// Wielder of the weapon

}
*/

owner = noone;
cooldown = 1.5 * 60;				// Attack cooldown of the weapon in frames
timer = cooldown;					// Timer for weapon cooldown
damage = 20;						// Damage of the weapon