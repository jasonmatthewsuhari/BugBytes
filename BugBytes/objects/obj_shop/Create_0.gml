/// @description Insert description here
// You can write your code in this editor
event_inherited();
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
	price: 20,
	use: function() {
		var index = obj_inventory.inventory.item_find(name);
		if (index >= 0) {
			obj_singleplayer.curr_hp = obj_singleplayer.max_hp;
			obj_singleplayer.heal = true;
			obj_singleplayer.flash_alpha = 1;
			obj_inventory.inventory.item_subtract(name, 1);
		}
	}
}

flame = {
	name: "flame",
	sprite: spr_flame,
	description: "Sets down a flame that deals constant damage to everything",
	price: 300,
	use: function() {
		var index = obj_inventory.inventory.item_find(name);
		if (index >= 0) {
			instance_create_layer(obj_singleplayer.x, obj_singleplayer.y, "Enemies", obj_flame);
			obj_inventory.inventory.item_subtract(name, 1);
		}
	}
}

piercing = {
	name: "piercing",
	sprite: spr_piercing,
	description: "Adds Piercing effect to all your damage bullets, increase healing on heal gun",
	price: 200,
	use: function() {
		var index = obj_inventory.inventory.item_find(name);
		if (index >= 0) {
			global.piercing += 1;
			obj_inventory.inventory.item_subtract(name, 1);
		}
	}
	
}

speed_potion = {
	name: "speed potion",
	sprite: spr_speed_up,
	description: "Increase movement speed for 30s",
	price: 120,
	use: function() {
		var index = obj_inventory.inventory.item_find(name);
		if (index >= 0) {
			obj_singleplayer.max_speed = obj_singleplayer.max_speed * 2;
			obj_inventory.inventory.item_subtract(name, 1);
			// this could cause bugs if another array_delete is triggered before this time source executes
			array_push(obj_powers.powers, new Power("speed up", spr_speed_up, "x2"));
			
			reset_speed = time_source_create(time_source_game, 5, time_source_units_seconds, function() 
			{
				if (instance_exists(obj_singleplayer)) {
					if (obj_singleplayer.max_speed > obj_singleplayer.o_max_speed) { obj_singleplayer.max_speed = obj_singleplayer.max_speed / 2 };
					array_delete(obj_powers.powers, array_length(obj_powers.powers) - 1, 1);
				}
	
			}, [], 1);

			time_source_start(reset_speed);
		}
	}
}


// ds_list_add(items, apple);
ds_list_add(items, water);
ds_list_add(items, flame);
ds_list_add(items, piercing);
ds_list_add(items, speed_potion);

itemCount = ds_list_size(items);

//GUI
guiWidth = display_get_gui_width();
guiHeight = display_get_gui_height();

menuWidth = guiWidth * 0.3;
menuMargin = guiWidth * 0.1;

previewWidth = (guiWidth - (menuWidth+menuMargin));