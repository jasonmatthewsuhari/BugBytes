/// @description

// Muzzle flash sprite to bullet sprite
image_index = 1;

x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);

// destroy bullet after travelling range
if !point_in_circle(x, y, xstart, ystart, range) instance_destroy(self);

if place_meeting(x, y, damage_to) 
{
	 var _inst = instance_place(x, y, damage_to);
	 _inst.curr_hp -= damage;
	 _inst.heal = true;
	 _inst.state = STATES.HURT;
	 _inst.flash_alpha = 1;
	 piercing -= 1;
	 
 if (piercing <= 0) {
	instance_destroy(self);
 }
}