/// @description Insert description here
// You can write your code in this editor


inventory = new Inventory();

x_pos = x - 128;	// x pos to draw item sprite 
y_pos = y;			// y pos to draw item sprite
x_pos_offset = 64	// x offset to draw next item sprite

inventory.item_add("Revolver", 1, spr_revolver);
inventory.item_add("Shotgun", 1, spr_shotgun);

show_debug_message(inventory);


