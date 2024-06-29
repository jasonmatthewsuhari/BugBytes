///	@func								f_create_healthbar(_owner)
///	@desc								Creates an instance healthbar and assign it to an owner
///	@param {Id.Instance} _owner			The owner of this healthbar instance
/// @param {Real} _max_hp				The maximum health of the owner
/// @param {Real} _x_offset				The offset amount of the healthbar from the owner in the x position, defaults to 0
/// @param {Real} _y_offset				The offset amount of the healthbar above the owner in the y position, defaults to 10
/// @param {Real} _curr_hp				The current health of the owner, defaults to _max_hp
/// @return {Id.Instance}				The healthbar instance
function f_create_healthbar(_owner, _max_hp, _x_offset = 0, _y_offset = 10, _curr_hp = _max_hp) 
{
		var _health_bar = 
			instance_create_depth(x + _x_offset, y - _owner.sprite_height / 2 - _y_offset, depth, class_HealthDisplay,
				{
					owner: _owner,
					max_hp: _max_hp,
					curr_hp: _curr_hp,
					x_offset: _x_offset,
					y_offset: _y_offset
				});
		return _health_bar;
}

///	@func								f_draw_healthbar(_owner)
///	@desc								Draws the healthbar of the owner it is assigned to
///	@param {Id.Instance} _owner			The owner of this healthbar instance
function f_draw_healthbar(_owner) 
{
		// draw_text(x + health_bar.x_offset, y - sprite_height / 2 - health_bar.y_offset, string_concat("HP:", health_bar.curr_hp));
		var _x = x - health_bar.x_offset - 50;
		var _y  = y - sprite_height / 2 - health_bar.y_offset;
		var _health_percent = health_bar.curr_hp / health_bar.max_hp * 100;
		draw_healthbar(_x, _y, _x + 100, _y - 15, _health_percent, c_white, c_red, c_green, 0, true, true);
}

///	@func								f_check_healthbar(_owner)
///	@param {Id.Instance} _owner			The owner of this healthbar instance
///	@desc								Checks owner health and destroys owner when health reaches zero.
function f_check_healthbar(_owner) 
{
	if (_owner.health_bar.curr_hp <= 0)	instance_destroy(_owner);
}
	