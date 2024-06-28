/// @description Insert description here
// You can write your code in this editor

event_inherited();
draw_self();

for (var i = 0; i < array_length(inventory._inventory_items); i++) {
	draw_sprite_ext(inventory._inventory_items[i].item.sprite, 0, x_pos + x_pos_offset * i, y_pos, 0.5, 0.5, 0, c_white, 1);
	draw_text( x_pos + x_pos_offset * i - 20, y_pos + 10, string_concat(inventory._inventory_items[i].quantity, "x"));
}
