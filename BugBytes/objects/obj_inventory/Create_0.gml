/// @description Insert description here
// You can write your code in this editor

event_inherited();
ui_position_y = camera_get_view_height(view_camera[0]) - 50;
inventory = new Inventory();

x_pos = x - 128;	// x pos to draw item sprite 
y_pos = y;			// y pos to draw item sprite
x_pos_offset = 64	// x offset to draw next item sprite

inventory.item_add("Revolver", 1, global.weapon_list.revolver);
inventory.item_add("Shotgun", 1, global.weapon_list.shotgun);
inventory.item_add("Heal Gun", 1, global.weapon_list.heal_gun);

display_text = "WE LOST THE INVENTORY!!!";

