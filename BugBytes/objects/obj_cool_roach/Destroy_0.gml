/// @description Insert description here
// You can write your code in this editor


if (instance_exists(weapon))		instance_destroy(weapon);

if (instance_exists(health_bar))	instance_destroy(health_bar);

if (instance_exists(obj_no_go))		instance_create_depth(obj_no_go.x, obj_no_go.y, depth, obj_cool_roach);