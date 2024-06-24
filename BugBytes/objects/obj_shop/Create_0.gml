/// @description Insert description here
// You can write your code in this editor
shopOpen = false; //Is this shop open?
global.shop = false; //Is any shop open?

selected = 0;
selectedAnim = 0;
//Items
items = ds_list_create();
apple = {
	name: "apple",
	sprite: spr_apple,
	description: "Replenishes health",
	price: 10,
	use: function() {
		var index = obj_inventory.inventory.item_find(name);
		if (index >= 0) {
			obj_singleplayer.curr_hp += 10;
			obj_inventory.inventory.item_subtract(name, 1);
		}
	}
}
water = {
	name: "water",
	sprite: spr_water,
	description: "Quenches thirst",
	price: 30,
	use: function() {
		var index = obj_inventory.inventory.item_find(name);
		if (index >= 0) {
			obj_singleplayer.curr_hp = obj_singleplayer.max_hp;
			obj_inventory.inventory.item_subtract(name, 1);
		}
	}
}
thing = {
	name: "thing",
	sprite: spr_thing,
	description: "It really do be like that",
	price: 60,
	use: function() {
	}
}


ds_list_add(items, apple);
ds_list_add(items, water);
ds_list_add(items, thing);

itemCount = ds_list_size(items);

//GUI
guiWidth = display_get_gui_width();
guiHeight = display_get_gui_height();

menuWidth = guiWidth * 0.3;
menuMargin = guiWidth * 0.1;

previewWidth = (guiWidth - (menuWidth+menuMargin));