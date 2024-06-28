///	@func								f_attack(_melee)
///	@desc								Attacks with the melee weapon, note that the sprite y origin must be set at the same height as the barrel of the gun
///	@param {Id.Instance} _gun			The melee weapon that is used to attack
function f_attack(_melee) 
{
	if (place_meeting(_melee.x, _melee.y, class_Damageable)) {
		if (other != owner) {
			timer--;
			if (timer <= 0) {
				timer = cooldown;
				other._health.curr_hp -= damage;
			}
		}
	}
}

///	@func									fire_weapon(_damage_to) 
///	@desc									Fires the gun, note that the sprite y origin must be set at the same height as the barrel of the gun
/// @param	{Assest.GMObject} _damage_to	The target type to deal damage to
function fire_weapon(_damage_to) 
{
	if (weapon.timer <= 0) 
	{
		weapon.timer = weapon.cooldown;
		// audio_play_sound(weapon.sound, 10, false, random_range(0.8, 1), 0, random_range(0.8, 1));
	
		var _x_offset = lengthdir_x(weapon.weapon_length, aim_direction);
		var _y_offset = lengthdir_y(weapon.weapon_length, aim_direction);
	
		for (var i = 0; i < weapon.spread_number; i++) 
			{
				var _angle = aim_direction + (i * weapon.spread_angle) - ((weapon.spread_number - 1) * (weapon.spread_angle / 2));
				var _bullet = instance_create_depth(
				weapon_x + _x_offset, 
				weapon_y + _y_offset, 
				depth - 100, 
				weapon.bullet
				);
				with (_bullet) 
				{
					image_angle = _angle;
					dir = _angle;
					damage_to = _damage_to;
				}
			}
	} else {
		weapon.timer--
	}
}

///	@func								f_track_weapon(_owner)
///	@desc								Sprite control of the weapon in relation to the direction its owner is facing
///	@param {Id.Instance} _weapon		The weapon instance
function f_track_weapon() 
{
	with weapon 
	{
			// If rotated to left, flip gun
			image_angle = point_direction(x, y, owner.target_pos_x, owner.target_pos_y);
			if image_angle <= 270 and image_angle > 90 {
				image_yscale = -1;
			}


	}
}


/// @func								Weapon(_name, _sprite, _cooldown, _range, _sound, _bullet = obj_bullet, _spread_number = 1, _spread_angle = 15)
/// @desc								creates a weapon
/// @param {String} _name				name of weapon
///	@param {Asset.GMSprite} _sprite		sprite of weapon
/// @param {Real}_cooldown				cooldown of weapon
/// @param {Real} _range				range of weapon
/// @param {Asset.GMSound} _sound		Shooting sound effect to play
/// @param {Asset.GMObject}_bullet		bullet object of weapon
/// @param {Real} _spread_number;		Number of bullets in spread
/// @param {Real} _spread_angle;		Angle between each bullet in 
function Weapon(_name, _sprite, _cooldown, _range, _sound, _bullet = obj_revolver_bullet, _spread_number = 1, _spread_angle = 15) constructor 
{
	name = _name;								// name of weapon
	sprite = _sprite;							// sprite of weapon
	bullet = _bullet;							// bullet object of weapon
	cooldown = _cooldown;						// cooldown of weapon
	range = _range;								// range of weapon
	sound = _sound;								// Shooting sound effect to play
	spread_number = _spread_number;				// Number of bullets in spread
	spread_angle = _spread_angle;				// Angle between each bullet in spread
	timer = 0;
	weapon_length = sprite_get_bbox_right(sprite) - sprite_get_xoffset(sprite);
		
}

