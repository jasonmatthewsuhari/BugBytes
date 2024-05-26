/// @description Movement
// You can write your code in this editor

// Muzzle flash sprite to bullet sprite
image_index = 1;

x += lengthdir_x(spd, image_angle);
y += lengthdir_y(spd, image_angle);

// destroy bullet after travelling  _p distance
var _p = 150
if !point_in_rectangle(x, y, -_p, -_p, obj_player_gun.ox + _p, obj_player_gun.oy + _p) instance_destroy();

