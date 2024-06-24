/// @description Insert description here
// You can write your code in this editor

event_inherited();
draw_self();

for (var i = 0; i < array_length(inventory._inventory_items); i++) {
	draw_sprite_ext(inventory._inventory_items[i].sprite, 0, x_pos + x_pos_offset * i, y_pos, 0.5, 0.5, 0, c_white, 1);
}
