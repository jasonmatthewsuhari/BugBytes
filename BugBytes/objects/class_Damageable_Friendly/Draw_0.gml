event_inherited();

if global.showhp {
#region draw healthbar

var _x = x - x_offset - 50;
var _y  = y - sprite_height / 2 - y_offset;
var _health_percent = curr_hp / max_hp * 100;
draw_healthbar(_x, _y, _x + 100, _y - 15, _health_percent, c_white, c_red, c_green, 0, true, true);

#endregion
}