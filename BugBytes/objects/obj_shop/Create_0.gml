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
	description: "Replenishes 10 healthpoints",
	price: 30,
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
	description: "Fully restores health",
	price: 50,
	use: function() {
		var index = obj_inventory.inventory.item_find(name);
		if (index >= 0) {
			obj_singleplayer.curr_hp = obj_singleplayer.max_hp;
			obj_inventory.inventory.item_subtract(name, 1);
		}
	}
}

flame = {
	name: "flame",
	sprite: spr_flame,
	description: "Sets down a flame that deals constant damage to everything",
	price: 400,
	use: function() {
		var index = obj_inventory.inventory.item_find(name);
		if (index >= 0) {
			instance_create_layer(obj_singleplayer.x, obj_singleplayer.y, "Enemies", obj_flame);
			obj_inventory.inventory.item_subtract(name, 1);
		}
	}
}


// ds_list_add(items, apple);
ds_list_add(items, water);
ds_list_add(items, flame);

itemCount = ds_list_size(items);

//GUI
guiWidth = display_get_gui_width();
guiHeight = display_get_gui_height();

menuWidth = guiWidth * 0.3;
menuMargin = guiWidth * 0.1;

previewWidth = (guiWidth - (menuWidth+menuMargin));