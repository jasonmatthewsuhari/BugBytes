/// @description Insert description here
// You can write your code in this editor
//Open shop
if (!shopOpen && place_meeting(x, y + 10, obj_singleplayer) && keyboard_check_pressed(ord("E"))) {
	shopOpen = true;
	global.shop = true;
}
//Close shop
else if (shopOpen && keyboard_check_pressed(vk_escape)) {
	shopOpen = false;
	global.shop = false;
}

//Shop is open
if (shopOpen) {
	selectedAnim = lerp(selectedAnim, selected, 0.1);
	
	//Down
	if (keyboard_check_pressed(vk_down)){
		selected++;
		if (selected == itemCount) selected = 0;
	}
	
	//Up
	if (keyboard_check_pressed(vk_up)){
		selected--;
		if (selected < 0) selected = itemCount-1;
	}
	
	//Buy
	var item = items[| selected];
	var name = item.name;
	var price = item.price;
	
	if (keyboard_check_pressed(vk_enter) && global.point >= price && instance_exists(obj_inventory)) {
		//Add to inventory
		obj_inventory.inventory.item_add(name, 1, item);
		
		//Reduce money
		global.point -= price;
	}
}