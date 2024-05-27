///	@func								f_create_weapon(_owner)
///	@desc								Creates a weapon instance and assign it to an owner, owner must have the variables weapon_x and weapon_y
///	@param {Id.Instance} _owner			The owner of this weapon instance
/// @return {Id.Instance}				The weapon instance
function f_create_weapon(_owner) {
		var _weapon = 
			instance_create_depth(_owner.weapon_x, _owner.weapon_y, _owner.depth - 1, obj_revolver,
				{
					owner: _owner,					// Wielder of the weapon
					ox: _owner.weapon_x,			// Original x position (owner must have .weapon_x)
					oy: _owner.weapon_y				// Original y position (owner must have .weapon_y)
				});
				
		return _weapon;
}


///	@func								f_shoot(_gun)
///	@desc								Fires the gun
///	@param {Id.Instance} _gun			The gun that is being fired
function f_fire(_gun) {
	
	with _gun {
		// Play sound
		audio_play_sound(gun.sound, 10, false, random_range(0.8, 1), 0, random_range(0.8, 1));		// Play shooting sound at random gain and pitch
		
		// Calculate distance from centre to tip of gun
		var _dist = sprite_get_width(gun.sprite) - sprite_get_xoffset(gun.sprite);					// Distance to edge of gun sprite
		
		// Calculate bullet spread
		for (var i = 0; i < gun.spread_number; i++) 
		{
			var _angle = image_angle + (i * gun.spread_angle) - ((gun.spread_number - 1) * (gun.spread_angle / 2));
			instance_create_depth(
				x + lengthdir_x(_dist, image_angle),
				y + lengthdir_y(_dist, image_angle),
				depth - 1,
				obj_bullet,
				{
					image_angle: _angle + random_range(- gun.inaccuracy, gun.inaccuracy),
					sprite_index: gun.ammo[bullet_index].sprite,
					spd: gun.ammo[bullet_index].spd
				}
			);
		}
		
		// Gun kick and knockback
		x -= gun.kick * image_yscale;
		knockback_angle += gun.kick * image_yscale;
		
		// Iterate through ammo types
		if bullet_index < array_length(gun.ammo) - 1 bullet_index++;
		else bullet_index = 0;
	}
}

///	@func								f_track_weapon(_owner)
///	@desc								Sprite control of the weapon in relation to the direction its owner is facing
///	@param {Id.Instance} _owner			The owner of this weapon instance
///	@param {Id.Instance} _weapon		The weapon instance
function f_track_weapon(_owner, _weapon) {

	with _weapon {
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
	}

}