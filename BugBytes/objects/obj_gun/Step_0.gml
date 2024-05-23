/// @description Moving and shooting
// You can write your code in this editor

#region Reset position and angle

sprite_index = gun.sprite;

// If rotated to left, flip gun
if mouse_x > x image_yscale = 1;
else image_yscale = -1;

// Lerp angle to mouse and kickback angle to zero
mouse_angle -= angle_difference(mouse_angle, point_direction(x, y, mouse_x, mouse_y)) * 0.5;
knockback_angle -= angle_difference(knockback_angle, 0) * 0.05;
image_angle = mouse_angle + knockback_angle;

//Lerp position
x = lerp(x, ox, 0.05);
y = lerp(y, oy, 0.05);

#endregion

#region Shooting

// Change condition for shooting depending on full auto
var _shoot = gun.fullauto ? mouse_check_button(mb_left) : mouse_check_button_pressed(mb_left);
var _ammo = gun.ammo[bullet_index];

if canshoot > 0 canshoot--;
else if _shoot
{
	
	// Reset firerate
	canshoot = _ammo.firerate;
	
	// Lerp firerate to end firerate while shooting
	_ammo.firerate = lerp(
		_ammo.firerate,
		_ammo.rate_end,
		_ammo.rate_multi);
		
	Shoot();
		
	var _delay = gun.burst_delay;
	repeat (gun.burst_number - 1)
	{
		call_later(_delay, time_source_units_frames, Shoot);
		_delay += gun.burst_delay;
	}
}

if !mouse_check_button(mb_left)			// Lerp firerate back to starting firerate while not shooting
{
	_ammo.firerate = lerp(
		_ammo.firerate,
		_ammo.rate_start,
		_ammo.rate_multi);
}


#endregion