/// @description

// Muzzle flash sprite to bullet sprite
image_index = 1;

x += lengthdir_x(spd, image_angle);
y += lengthdir_y(spd, image_angle);

// destroy bullet after travelling  _p pixel distance

if (instance_exists(owner))
	if !point_in_rectangle(x, y, - owner.range, - owner.range, owner.ox + owner.range, owner.oy + owner.range) instance_destroy();
