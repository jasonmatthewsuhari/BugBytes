/// @description

// Muzzle flash sprite to bullet sprite
image_index = 1;

x += lengthdir_x(spd, image_angle);
y += lengthdir_y(spd, image_angle);

// destroy bullet after travelling  _p distance
var _p = 500;

if (instance_exists(owner))
	if !point_in_rectangle(x, y, -_p, -_p, owner.ox + _p, owner.oy + _p) instance_destroy();
